package com.market.dao;

import com.market.dto.Order;
import com.market.dto.OrderProduct;
import com.market.dto.Product;
import com.market.dto.User;

import java.sql.*;
import java.util.ArrayList;

public class OrderRepository {
    private static OrderRepository instance;

    static {
        try {
            instance = new OrderRepository();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    private Connection conn = null;

    OrderRepository() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/market?serverTimezone=UTC";
        String user = "root";
        String password = "spring";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    }

    public static OrderRepository getInstance() {
        return instance;
    }

    public int createOrder(Order order, ArrayList<OrderProduct> orderProducts) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO Orders (name, country, zipcode, address, delivery_date, total_price) VALUES (?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, order.getName());
        stmt.setString(2, order.getCountry());
        stmt.setString(3, order.getZipcode());
        stmt.setString(4, order.getAddress());
        stmt.setString(5, order.getDelivery_date());
        stmt.setInt(6, order.getTotal_price());
        stmt.executeUpdate();
        String sql2 = "SELECT LAST_INSERT_ID()";
        ResultSet rs = conn.createStatement().executeQuery(sql2);
        rs.next();
        int idx =  rs.getInt(1);
        for(OrderProduct orderProduct: orderProducts){
            sql = "INSERT INTO order_product (product_id, order_id, count) VALUES (?,?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderProduct.getProduct_id());
            stmt.setInt(2, idx);
            stmt.setInt(3, orderProduct.getCount());
            stmt.executeUpdate();
            sql = "UPDATE Product SET stock=(select stock from(select stock from Product as c where product_id=?) as a)-? where product_id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderProduct.getProduct_id());
            stmt.setInt(2, orderProduct.getCount());
            stmt.setInt(3, orderProduct.getProduct_id());
            stmt.executeUpdate();
        }
        return idx;
    }

    public Order getOrder(int orderId) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "select * from Orders where order_id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, orderId);
        ResultSet rs = stmt.executeQuery();

        if(rs.next()){
            Order order = new Order();
            order.setZipcode(rs.getString("zipcode"));
            order.setName(rs.getString("name"));
            order.setCountry(rs.getString("country"));
            order.setAddress(rs.getString("address"));
            order.setDelivery_date(rs.getString("delivery_date"));
            order.setTotal_price(rs.getInt("total_price"));
            return order;
        }
        else{
            return null;
        }
    }
}
