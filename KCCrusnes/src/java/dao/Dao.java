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
        //tx = session.beginTransaction();
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
            tx = session.beginTransaction();
            session.saveOrUpdate(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("saveOrUpdate Problem");
            he.printStackTrace();
        }
        /**
         * finally { HibernateFactory.closeSession(); }*
         */
    }

    public void merge(T obj) {
        try {
            tx = session.beginTransaction();
            session.merge(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("merge Problem");
            he.printStackTrace();
        }
    }

    public void updateReally(T obj) {
        try {
            tx = session.beginTransaction();
            session.update(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("update Problem");
            he.printStackTrace();
        }
    }

    /**
     * Permet la suppression d'une entrée de la base
     *
     * @param obj
     */
    public void delete(T obj) {
        try {
            tx = session.beginTransaction();
            session.delete(obj);
            tx.commit();
        } catch (HibernateException he) {
            System.out.println("delete Problem");
            he.printStackTrace();
        } /*finally {
         HibernateFactory.closeSession();
         }*/

    }

    public Session getSession() {
        return session;
    }

    public Transaction getTransaction() {
        return tx;
    }

    public void openSession() {
        session = HibernateFactory.currentSession();
    }

}
