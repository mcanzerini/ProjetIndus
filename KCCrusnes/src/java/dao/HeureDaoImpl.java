/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Heure;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class HeureDaoImpl extends HeureDao {

    public static HeureDao uniqueInstance;

    public static HeureDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new HeureDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Heure obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Heure obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Heure find(long id) {
        Heure heure = (Heure) super.getSession().get(Heure.class, id);
        return heure;
    }

    @Override
    public List<Heure> findAll() {
        Query query = super.getSession().createQuery("from " + Heure.class.getName());
        List<Heure> heures = query.list();
        return heures;
    }

}
