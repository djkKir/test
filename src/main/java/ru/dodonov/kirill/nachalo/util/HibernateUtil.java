package ru.dodonov.kirill.nachalo.util;
import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HibernateUtil {

    @Autowired
    private SessionFactory sessionFactory;

    public <T> Serializable create(final T user) {
        return sessionFactory.getCurrentSession().save(user);
    }

    public <T> T update(final T user) {
        sessionFactory.getCurrentSession().update(user);
        return user;
    }

    public <T> void delete(final T user) {
        sessionFactory.getCurrentSession().delete(user);
    }

    public <T> void delete(Serializable id, Class<T> userClass) {
        T user = fetchById(id, userClass);
        delete(user);
    }

    @SuppressWarnings("unchecked")
    public <T> List<T> fetchAll(Class<T> userClass) {
        return sessionFactory.getCurrentSession().createQuery(" FROM "+userClass.getName()).list();
    }

    @SuppressWarnings("rawtypes")
    public <T> List fetchAll(String query) {
        return sessionFactory.getCurrentSession().createSQLQuery(query).list();
    }

    @SuppressWarnings("unchecked")
    public <T> T fetchById(Serializable id, Class<T> userClass) {
        return (T)sessionFactory.getCurrentSession().get(userClass, id);
    }
}