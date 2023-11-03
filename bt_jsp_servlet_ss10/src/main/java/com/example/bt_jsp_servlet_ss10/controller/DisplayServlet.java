package com.example.bt_jsp_servlet_ss10.controller;

import com.example.bt_jsp_servlet_ss10.model.Clients;
import com.example.bt_jsp_servlet_ss10.service.IClientsService;
import com.example.bt_jsp_servlet_ss10.service.impl.ClientsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayServlet", urlPatterns = "/DisplayServlet")
public class DisplayServlet extends HttpServlet {
    IClientsService iClientsService = new ClientsService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create" :
                break;
            default:
                getAll(request,response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void getAll(HttpServletRequest request,HttpServletResponse response) throws  ServletException, IOException {
        List<Clients> list = iClientsService.getAll();
        request.setAttribute("listClients",list);
        request.getRequestDispatcher("views/display.jsp").forward(request,response);
    }
}
