package com.market.dao;

import com.market.dto.Product;
import com.market.dto.User;

import java.sql.*;
import java.util.ArrayList;

public class UserRepository {
    private static UserRepository instance;

    static {
        try {
            instance = new UserRepository();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    private Connection conn = null;

    UserRepository() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/market?serverTimezone=UTC";
        String user = "root";
        String password = "spring";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    }

    public static UserRepository getInstance() {
        return instance;
    }

    public void addUser(User user) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO USER (name, age, address, login_id, login_password, role) VALUES (?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, user.getName());
        stmt.setInt(2, user.getAge());
        stmt.setString(3, user.getAddress());
        stmt.setString(4, user.getLoginId());
        stmt.setString(5, user.getLoginPassword());
        stmt.setString(6, user.getRole());
        stmt.executeUpdate();
    }

    public User login(String id, String password) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "select * from User where login_id=? and login_password=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            User user = new User();
            user.setRole(rs.getString("role"));
            user.setName(rs.getString("name"));
            user.setUserId(rs.getInt("user_id"));
            return user;
        }
        else{
            return null;
        }
    }

    public User getUser(int userID) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "select * from User where user_id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userID);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            User user = new User();
            user.setRole(rs.getString("role"));
            user.setName(rs.getString("name"));
            user.setUserId(rs.getInt("user_id"));
            return user;
        }
        else{
            return null;
        }
    }
}
