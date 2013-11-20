/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mathieu_canzerini
 * @param <T>
 */
public abstract class Dao<T> {

    private Session session;
    private Transaction tx;

    public Dao() {
        session = HibernateFactory.currentSession();
        tx = session.beginTransaction();
    }

    /**
     * Permet de récupérer un objet via son ID
     *
     * @param id
     * @return
     */
    public abstract T find(long id);
    
    public abstract List<T> findAll();

    protected void saveOrUpdate(T obj) {
        try {
            session.saveOrUpdate(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("saveOrUpdate Problem");
        } finally {
            HibernateFactory.closeSession();
        }
    }

    /**
     * Permet la suppression d'une entrée de la base
     *
     * @param obj
     */
    protected void delete(T obj) {
        try {
            session.delete(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("delete Problem");
        } finally {
            HibernateFactory.closeSession();
        }
    }

    public Session getSession() {
        return session;
    }

    public Transaction getTransaction() {
        return tx;
    }

}
