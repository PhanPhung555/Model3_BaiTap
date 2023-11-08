package com.example.bt_jsp_servlet_ss12.repository;

import com.example.bt_jsp_servlet_ss12.model.Product;

import java.util.List;

public interface IProductRepository {

    void createProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(int id);

    List<Product> getAllProduct();
}
