package com.example.bt_jsp_servlet_ss12.repository.impl;

import com.example.bt_jsp_servlet_ss12.model.Product;
import com.example.bt_jsp_servlet_ss12.repository.IProductRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GETALLPRODUCT = "SELECT * FROM PRODUCTS";
    private static final String DELETEPRODUCT = "DELETE FROM PRODUCTS WHERE idProduct = ?";
    private static final String CREATEPRODUCT = "INSERT INTO PRODUCTS (nameProduct, priceProduct, evaluateProduct)\n" +
            "VALUES (?,?,?);";
    private static final String UPDATEPRODUCT = "update products set nameProduct = ? ,priceProduct = ?, evaluateProduct = ? where idProduct = ?;";

    @Override
    public void createProduct(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement(CREATEPRODUCT);
            preparedStatement.setString(1,product.getNameProduct());
            preparedStatement.setDouble(2,product.getPriceProduct());
            preparedStatement.setString(3, product.getEvaluateProduct());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement(UPDATEPRODUCT);
            preparedStatement.setString(1,product.getNameProduct());
            preparedStatement.setDouble(2,product.getPriceProduct());
            preparedStatement.setString(3,product.getEvaluateProduct());
            preparedStatement.setInt(4,product.getIdProduct());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB().prepareStatement(DELETEPRODUCT);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
            ResultSet resultSet = statement.executeQuery(GETALLPRODUCT);
            while (resultSet.next()) {
                Product product = new Product();
                product.setIdProduct(resultSet.getInt(1));
                product.setNameProduct(resultSet.getString(2));
                product.setPriceProduct(resultSet.getDouble(3));
                product.setEvaluateProduct(resultSet.getString(4));
                list.add(new Product(product.getIdProduct(), product.getNameProduct(), product.getPriceProduct(), product.getEvaluateProduct()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
