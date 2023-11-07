package com.example.bt_jsp_servlet_ss11.service.impl;

import com.example.bt_jsp_servlet_ss11.model.User;
import com.example.bt_jsp_servlet_ss11.repository.IUserRepository;
import com.example.bt_jsp_servlet_ss11.repository.impl.UserRepository;
import com.example.bt_jsp_servlet_ss11.service.IUserService;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();

    @Override
    public boolean createUser(User user) {
        if (userRepository.createUser(user)){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void updateUser(User user) {
        userRepository.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public List<User> display() {
        return userRepository.display();
    }

    @Override
    public List<User> search(String country) {
//        List<String> list = Arrays.asList("V","v","Viet Nam","viet nam");
        List<User> listCountry = userRepository.display().stream()
                .filter(e -> e.getCountry().equals(country))
                .collect(Collectors.toList());
        return listCountry;
    }
}
