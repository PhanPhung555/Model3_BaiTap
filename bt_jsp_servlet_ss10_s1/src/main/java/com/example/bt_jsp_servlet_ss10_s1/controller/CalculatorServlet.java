package com.example.bt_jsp_servlet_ss10_s1.controller;

import com.example.bt_jsp_servlet_ss10_s1.service.ICalculatorService;
import com.example.bt_jsp_servlet_ss10_s1.service.impl.CalculatorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    ICalculatorService iCalculatorService = new CalculatorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        double firstoperand = Double.parseDouble(request.getParameter("firstoperand"));
        String culculator = request.getParameter("culculator");
        double secondoperand = Double.parseDouble(request.getParameter("secondoperand"));

        Double results = iCalculatorService.getCalcutor(firstoperand, culculator, secondoperand);

        if (iCalculatorService.division(firstoperand,secondoperand) == 0.0) {
            response.sendRedirect("/views/exception404.jsp");
        }
        request.setAttribute("results", results);
        request.getRequestDispatcher("/views/displayCalculator.jsp").forward(request, response);
    }
}
