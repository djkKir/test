package ru.dodonov.kirill.nachalo.service;

import ru.dodonov.kirill.nachalo.entity.User;

import java.util.List;

/**
 * Created by djk on 19.11.2016.
 */
public interface UserService {

    public int createUser(User user);
    public User updateUser(User user);
    public void deleteUser(int id);
    public List<User> getAllUsers();
    public User getUser(int id);
    public List<User> getAllUsers(String userName);
}
