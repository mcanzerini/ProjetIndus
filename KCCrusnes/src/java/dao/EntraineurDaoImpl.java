/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Entraineur;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class EntraineurDaoImpl extends EntraineurDao {

    @Override
    public void create(Entraineur obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Entraineur obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Entraineur find(long id) {
        Entraineur entraineur = (Entraineur) super.getSession().get(Entraineur.class, id);
        return entraineur;
    }

    @Override
    public List<Entraineur> findAll() {
        Query query = super.getSession().createQuery("from " + Entraineur.class.getName()
                + " as e order by e.id");
        List<Entraineur> entraineurs = query.list();
        return entraineurs;
    }

}
