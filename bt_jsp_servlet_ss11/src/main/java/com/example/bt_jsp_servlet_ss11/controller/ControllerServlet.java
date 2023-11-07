package com.example.bt_jsp_servlet_ss11.controller;

import com.example.bt_jsp_servlet_ss11.model.User;
import com.example.bt_jsp_servlet_ss11.service.IUserService;
import com.example.bt_jsp_servlet_ss11.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ControllerServlet", urlPatterns = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            action = "";
        }
        switch (action) {
            case "display":
                break;
            case "sort":
                sortName(request,response);
                break;
            default:
                display(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                display(request, response);
        }
    }

    protected void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ListUser", iUserService.display());
        request.getRequestDispatcher("views/display.jsp").forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(fullname, email, country);
        if(iUserService.createUser(user)){
            System.out.println("Tạo Thành Công");
        }else {
            System.out.println("Tạo Không Thành Công");
        }
        response.sendRedirect("/ControllerServlet");
    }

    protected void sortName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iUserService.display().stream().
                sorted(Comparator.comparing(User::getName)).collect(Collectors.toList());
        request.setAttribute("ListUser", userList);
        request.getRequestDispatcher("views/display.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idDelete = Integer.parseInt(request.getParameter("idHidden"));
        iUserService.deleteUser(idDelete);
        request.setAttribute("ListUser", iUserService.display());
        request.getRequestDispatcher("views/display.jsp").forward(request, response);
    }

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String countrySearch = request.getParameter("searchCountry");
        List<User> list = iUserService.search(countrySearch);
        request.setAttribute("ListUser", list);
        request.getRequestDispatcher("views/display.jsp").forward(request, response);
    }
}
