package com.example.bt_jsp_servlet_ss11.repository.impl;

import com.example.bt_jsp_servlet_ss11.model.User;
import com.example.bt_jsp_servlet_ss11.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String DISPLAY = "SELECT * FROM USERS";
    private static final String CREATE = "INSERT INTO users (fullnaem, email, country) VALUES (?,?,?)";
    private static final String DELETE = "DELETE FROM users WHERE ID = ?";
    @Override
    public boolean createUser(User user) {
        boolean check = false;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement(CREATE);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());

            if(preparedStatement.executeUpdate() > 0){
                check = true;
            }else {
                check = false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    @Override
    public void updateUser(User user) {
        try {
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(int id) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> display() {
        List<User> list = new ArrayList<>();
        try {
            User user = new User();
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
            ResultSet resultSet = statement.executeQuery(DISPLAY);

            while (resultSet.next()){
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setCountry(resultSet.getString(4));
                list.add(new User(user.getId(), user.getName(), user.getEmail(), user.getCountry()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
