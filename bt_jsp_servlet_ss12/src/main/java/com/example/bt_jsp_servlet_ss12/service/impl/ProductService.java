package com.example.bt_jsp_servlet_ss12.service.impl;

import com.example.bt_jsp_servlet_ss12.model.Product;
import com.example.bt_jsp_servlet_ss12.repository.IProductRepository;
import com.example.bt_jsp_servlet_ss12.repository.impl.ProductRepository;
import com.example.bt_jsp_servlet_ss12.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> getAllProduct() {
        return iProductRepository.getAllProduct();
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRepository.updateProduct(product);
    }

    @Override
    public void createProduct(Product product) {
        iProductRepository.createProduct(product);
    }
}
