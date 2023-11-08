package com.example.bt_jsp_servlet_ss12.model;

public class Product {
    private int idProduct;
    private String nameProduct;
    private double priceProduct;
    private String evaluateProduct;

    public Product(int idProduct, String nameProduct, double priceProduct, String evaluateProduct) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.evaluateProduct = evaluateProduct;
    }

    public Product(String nameProduct, double priceProduct, String evaluateProduct) {
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.evaluateProduct = evaluateProduct;
    }

    public Product() {
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getEvaluateProduct() {
        return evaluateProduct;
    }

    public void setEvaluateProduct(String evaluateProduct) {
        this.evaluateProduct = evaluateProduct;
    }
}
