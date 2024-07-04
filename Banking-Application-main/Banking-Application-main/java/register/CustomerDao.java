package register;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;

public class CustomerDao {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/customer?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private String dbUser = "root";
    private String dbPassword = "Chaithu@9515";

    public CustomerDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public boolean isAccountNumberExists(int accountNumber) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String checkQuery = "SELECT COUNT(*) FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(checkQuery)) {
                preparedStatement.setInt(1, accountNumber);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return true; 
        }
    }

    public boolean registerCustomer(int accountNumber, String fullName, String address, String emailId, String password,
                                    String account, String balance, String dob, Part filePart)throws ServletException,IOException {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String insertQuery = "INSERT INTO customer (account_number, full_name, address, email_id, password, balance, account, dob, id_proof ) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setInt(1, accountNumber);
                preparedStatement.setString(2, fullName);
                preparedStatement.setString(3, address);
                preparedStatement.setString(4, emailId);
                preparedStatement.setString(5, password);
                preparedStatement.setString(6, balance);
                preparedStatement.setString(7, account);
                preparedStatement.setString(8, dob);
                InputStream fileContent = filePart.getInputStream();
                preparedStatement.setBlob(9, fileContent);

                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean isValidLogin(String accountNumber, String password) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String checkQuery = "SELECT COUNT(*) FROM customer WHERE account_number = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(checkQuery)) {
                preparedStatement.setString(1, accountNumber);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public AccountDetails getAccountDetails(String accountNumber) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT * FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, accountNumber);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        String fullName = resultSet.getString("full_name");
                        String address = resultSet.getString("address");
                        String emailId = resultSet.getString("email_id");
                        String account = resultSet.getString("account");
                        String balance = resultSet.getString("balance");
                        String dob = resultSet.getString("dob");

                        return new AccountDetails(accountNumber, fullName, address, emailId, account, balance, dob);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    
    public BigDecimal getBalance(String accountNumber) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT balance FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, accountNumber);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getBigDecimal("balance");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateBalance(String accountNumber, BigDecimal amount) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String updateQuery = "UPDATE customer SET balance = balance - ? WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setBigDecimal(1, amount);
                preparedStatement.setString(2, accountNumber);
                int rowsUpdated = preparedStatement.executeUpdate();
                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertTransaction(String accountNumber, BigDecimal amount, String transactionType) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String insertQuery = "INSERT INTO transactions (account_number, amount, transaction_type, transaction_time) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, accountNumber);
                preparedStatement.setBigDecimal(2, amount);
                preparedStatement.setString(3, transactionType);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean updateBalanceForDeposit(String accountNumber, BigDecimal amount) {

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String updateQuery = "UPDATE customer SET balance = balance + ? WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setBigDecimal(1, amount);
                preparedStatement.setString(2, accountNumber);
                int rowsUpdated = preparedStatement.executeUpdate();
                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertTransactionForDeposit(String accountNumber, BigDecimal amount, String transactionType) {

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String insertQuery = "INSERT INTO transactions (account_number, amount, transaction_type, transaction_time) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, accountNumber);
                preparedStatement.setBigDecimal(2, amount);
                preparedStatement.setString(3, transactionType);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean isBalanceZero(String accountNumber) {

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT balance FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, accountNumber);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    BigDecimal balance = resultSet.getBigDecimal("balance");
                    return balance.compareTo(BigDecimal.ZERO) == 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteAccount(String accountNumber) {

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String deleteQuery = "DELETE FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setString(1, accountNumber);
                int rowsDeleted = preparedStatement.executeUpdate();
                return rowsDeleted > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public List<Transaction> getLast10Transactions(String accountNumber) {
        List<Transaction> transactions = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String selectQuery = "SELECT * FROM transactions WHERE account_number = ? ORDER BY transaction_time DESC LIMIT 10";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, accountNumber);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Transaction transaction = new Transaction();
                        transaction.setAccountNumber(resultSet.getString("account_number"));
                        transaction.setAmount(resultSet.getBigDecimal("amount"));
                        transaction.setTransactionType(resultSet.getString("transaction_type"));
                        transaction.setTransactionTime(resultSet.getString("transaction_time"));
                        transactions.add(transaction);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
    
    public Customer getCustomerDetails(String accountNumber) {
        Customer customer = null;

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT account_number, full_name, address, email_id, dob FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, accountNumber);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    customer = new Customer();
                    customer.setAccountNumber(resultSet.getString("account_number"));
                    customer.setFullName(resultSet.getString("full_name"));
                    customer.setAddress(resultSet.getString("address"));
                    customer.setEmailId(resultSet.getString("email_id"));
                    customer.setDob(resultSet.getString("dob"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }

    public void updateCustomerDetails(String accountNumber, String fullName, String address, String emailId, String dob) {
    	
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String updateQuery = "UPDATE customer SET full_name = ?, address = ?, email_id = ?, dob = ? WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setString(1, fullName);
                preparedStatement.setString(2, address);
                preparedStatement.setString(3, emailId);
                preparedStatement.setString(4, dob);
                preparedStatement.setString(5, accountNumber);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT account_number, full_name, address, email_id, dob FROM customer";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Customer customer = new Customer();
                    customer.setAccountNumber(resultSet.getString("account_number"));
                    customer.setFullName(resultSet.getString("full_name"));
                    customer.setAddress(resultSet.getString("address"));
                    customer.setEmailId(resultSet.getString("email_id"));
                    customer.setDob(resultSet.getString("dob"));
                    customers.add(customer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }
    public boolean deleteCustomer(String accountNumber) {

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String deleteQuery = "DELETE FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setString(1, accountNumber);
                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }
    
    
}

