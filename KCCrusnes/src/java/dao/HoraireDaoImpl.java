/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Horaire;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class HoraireDaoImpl extends HoraireDao {

    public static HoraireDao uniqueInstance;

    public static HoraireDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new HoraireDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Horaire obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Horaire obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Horaire find(long id) {
        Horaire horaire = (Horaire) super.getSession().get(Horaire.class, id);
        return horaire;
    }

    @Override
    public List<Horaire> findAll() {
        Query query = super.getSession().createQuery("from " + Horaire.class.getName());
        List<Horaire> horaires = query.list();
        return horaires;
    }

}
