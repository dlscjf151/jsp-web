package com.market.dao;

import com.market.dto.Product;

import java.sql.*;
import java.util.ArrayList;


public class ProductRepository {
    private static ProductRepository instance;

    static {
        try {
            instance = new ProductRepository();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    private Connection conn = null;

    ProductRepository() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/market?serverTimezone=UTC";
        String user = "root";
        String password = "spring";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    }

    public static ProductRepository getInstance() {
        return instance;
    }

    public ArrayList<Product> getAllProducts() throws SQLException {
        Statement stmt = null;
        String sql = "select * from Product";
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        ArrayList<Product> products = new ArrayList<>();
        while(rs.next()){
            Product product = new Product();
            product.setProductId(rs.getInt("product_id"));
            product.setProductName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setManufacturer(rs.getString("manufacturer"));
            product.setUnitsInStock(rs.getLong("stock"));
            product.setUnitPrice(rs.getInt("price"));
            product.setFile(rs.getString("file"));
            product.setSellerId(rs.getInt("user_id"));
            products.add(product);
        }
        return products;
    }

    public void addProduct(Product product) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO Product (name, description, manufacturer, stock, price, file, user_id) VALUES (?,?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, product.getProductName());
        stmt.setString(2, product.getDescription());
        stmt.setString(3, product.getManufacturer());
        stmt.setLong(4, product.getUnitsInStock());
        stmt.setInt(5, product.getUnitPrice());
        stmt.setString(6, product.getFile());
        stmt.setInt(7, product.getSellerId());
        stmt.executeUpdate();
    }

    public Product getProduct(int productId) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "select * from Product where product_id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, productId);
        ResultSet rs = stmt.executeQuery();

        if(rs.next()){
            Product product = new Product();
            product.setProductId(rs.getInt("product_id"));
            product.setProductName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setManufacturer(rs.getString("manufacturer"));
            product.setUnitsInStock(rs.getLong("stock"));
            product.setUnitPrice(rs.getInt("price"));
            product.setFile(rs.getString("file"));
            product.setSellerId(rs.getInt("user_id"));
            return product;
        }
        else{
            return null;
        }
    }
}
