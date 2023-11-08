package com.example.bt_jsp_servlet_ss12.service;

import com.example.bt_jsp_servlet_ss12.model.Product;

import java.util.List;

public interface IProductService {

    List<Product> getAllProduct();

    void deleteProduct(int id);

    void updateProduct(Product product);

    void createProduct(Product product);
}
