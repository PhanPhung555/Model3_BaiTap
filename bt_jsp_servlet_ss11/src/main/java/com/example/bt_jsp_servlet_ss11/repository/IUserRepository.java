package com.example.bt_jsp_servlet_ss11.repository;

import com.example.bt_jsp_servlet_ss11.model.User;

import java.util.List;

public interface IUserRepository {
    boolean createUser(User user);

    void updateUser(User user);

    void deleteUser(int id);

    List<User> display();
}
