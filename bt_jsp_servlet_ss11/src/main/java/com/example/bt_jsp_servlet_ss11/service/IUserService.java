package com.example.bt_jsp_servlet_ss11.service;

import com.example.bt_jsp_servlet_ss11.model.User;

import java.util.List;

public interface IUserService {

    boolean createUser(User user);

    void updateUser(User user);

    void deleteUser(int id);

    List<User> display();

    List<User> search(String country);
}
