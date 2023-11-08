package com.example.bt_jsp_servlet_ss12.controller;

import com.example.bt_jsp_servlet_ss12.model.Product;
import com.example.bt_jsp_servlet_ss12.service.IProductService;
import com.example.bt_jsp_servlet_ss12.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "ControllerProductServlet", urlPatterns = "/ControllerProductServlet")
public class ControllerProductServlet extends HttpServlet {
    private  IProductService iProductService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "transfer" :
                transfer(request,response);
                break;
            case "information" :
                informationvcProduct(request,response);
                break;
            default:
                getAllProduct(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create" :
                createProduct(request,response);
                break;
            case "update" :
                updateProduct(request,response);
                break;
            case "delete" :
                deleteProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
            default:
                getAllProduct(request,response);
        }
    }

    protected void transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int id = Integer.parseInt(request.getParameter("idupdate"));
        List<Product> product = iProductService.getAllProduct().stream().filter(e -> e.getIdProduct() == id).collect(Collectors.toList());
        request.setAttribute("lists",product);
        request.getRequestDispatcher("views/update.jsp").forward(request,response);
    }
    protected void informationvcProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> list = iProductService.getAllProduct().stream()
                .filter(e -> e.getIdProduct() == id)
                .collect(Collectors.toList());
        request.setAttribute("listinformation",list);
        request.getRequestDispatcher("views/information.jsp").forward(request,response);
    }
    protected void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        Double priceProduct = Double.valueOf(request.getParameter("searchProduct"));
        List<Product> list = iProductService.getAllProduct().stream()
                .filter(e -> e.getPriceProduct() == priceProduct)
                .collect(Collectors.toList());
        request.setAttribute("lists",list);
        request.getRequestDispatcher("views/home.jsp").forward(request,response);

    }
    protected void getAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        request.setAttribute("lists",iProductService.getAllProduct());
        request.getRequestDispatcher("views/home.jsp").forward(request,response);
    }
    protected void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        String nameProduct = request.getParameter("nameProduct");
        Double priceProduct = Double.valueOf(request.getParameter("priceProduct"));
        String evaluateProduct = request.getParameter("evaluateProduct");
        iProductService.createProduct(new Product(nameProduct,priceProduct,evaluateProduct));
        response.sendRedirect("/ControllerProductServlet");
    }
    protected void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        Double priceProduct = Double.valueOf(request.getParameter("priceProduct"));
        String evaluateProduct = request.getParameter("evaluateProduct");
        iProductService.updateProduct(new Product(id,nameProduct,priceProduct,evaluateProduct));
        response.sendRedirect("/ControllerProductServlet");
    }
    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        int iddelete = Integer.parseInt(request.getParameter("idHidden"));
        iProductService.deleteProduct(iddelete);
        response.sendRedirect("/ControllerProductServlet");
    }
}
