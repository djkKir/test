package ru.dodonov.kirill.nachalo.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.dodonov.kirill.nachalo.dao.UserDAO;
import ru.dodonov.kirill.nachalo.entity.User;
import ru.dodonov.kirill.nachalo.util.HibernateUtil;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    public UserDAOImpl() {
        System.out.println("UserDAOImpl");
    }

    @Autowired
    private HibernateUtil hibernateUtil;


    @Override
    public int createUser(User user) {

        return (int) hibernateUtil.create(user);
    }

    @Override
    public User updateUser(User user) {
        return hibernateUtil.update(user);
    }

    @Override
    public void deleteUser(int id) {
        User user = new User();
        user.setId(id);
        hibernateUtil.delete(user);
          }

    @Override
    public List<User> getAllUsers() {
        //hibernateUtil.fetchAll("SET NAMES 'UTF8'");
        return hibernateUtil.fetchAll(User.class);
    }

    @Override
    public User getUser(int id) {
        return hibernateUtil.fetchById(id, User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName) {

        String query = "SELECT e.* FROM test.user e WHERE e.name like '%"+ userName +"%'";
        List<Object[]> userObjects = hibernateUtil.fetchAll(query);
        List<User> users = new ArrayList<>();
        for(Object[] userObject: userObjects) {

            User usertmp = new User();
            int id = (int) userObject[0];
            String name = (String) userObject[1];
            int age = (int) userObject[2];
            boolean isAdmin  = (boolean) userObject[3];
            Date createdDate = (Date) userObject[4];

            usertmp.setId(id);
            usertmp.setName(name);
            usertmp.setAge(age);
            usertmp.setAdmin(isAdmin);
            usertmp.setCreatedDate(createdDate);
            users.add(usertmp);

        }
        System.out.println(users);
        return users;
    }


}
