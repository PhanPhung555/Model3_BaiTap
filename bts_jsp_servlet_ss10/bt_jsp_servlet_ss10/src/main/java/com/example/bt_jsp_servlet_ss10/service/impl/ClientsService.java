package com.example.bt_jsp_servlet_ss10.service.impl;

import com.example.bt_jsp_servlet_ss10.model.Clients;
import com.example.bt_jsp_servlet_ss10.repository.IClientsRepository;
import com.example.bt_jsp_servlet_ss10.repository.impl.ClientsRepository;
import com.example.bt_jsp_servlet_ss10.service.IClientsService;

import java.util.List;

public class ClientsService implements IClientsService {
    IClientsRepository iClientsRepository = new ClientsRepository();
    @Override
    public List<Clients> getAll() {
        return iClientsRepository.getAll();
    }
}
