/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Dojo;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class DojoDaoImpl extends DojoDao {

    public static DojoDao uniqueInstance;

    public static DojoDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new DojoDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Dojo obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Dojo obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Dojo find(long id) {
        Dojo dojo = (Dojo) super.getSession().get(Dojo.class, id);
        return dojo;
    }

    @Override
    public List<Dojo> findAll() {
        Query query = super.getSession().createQuery("from " + Dojo.class.getName()
                + " as d order by d.id");
        List<Dojo> dojos = query.list();
        return dojos;
    }

}
