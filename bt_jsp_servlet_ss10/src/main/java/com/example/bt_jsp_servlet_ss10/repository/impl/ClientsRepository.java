package com.example.bt_jsp_servlet_ss10.repository.impl;

import com.example.bt_jsp_servlet_ss10.model.Clients;
import com.example.bt_jsp_servlet_ss10.repository.IClientsRepository;

import java.util.ArrayList;
import java.util.List;

public class ClientsRepository implements IClientsRepository {
    private static List<Clients> clientsList = new ArrayList<>();

    static {
        clientsList.add(new Clients("Mai Văn Hoàn","1983-08-20","Hà Nội"));
        clientsList.add(new Clients("Nguyễn Văn Nam","1983-08-21","Hà Nội"));
        clientsList.add(new Clients("Nguyễn Thái Hòa","1983-08-22","Nam Định"));
        clientsList.add(new Clients("Trần Đăng Khoa","1983-08-22","Hà Tây"));
    }

    @Override
    public List<Clients> getAll() {
        return clientsList;
    }
}
