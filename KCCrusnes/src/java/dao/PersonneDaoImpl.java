/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Personne;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class PersonneDaoImpl extends PersonneDao {

    public static PersonneDao uniqueInstance;

    public static PersonneDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new PersonneDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Personne obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public void update(Personne obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public Personne find(long id) {
        Personne personne = (Personne) super.getSession().get(Personne.class, id);
        return personne;
    }

    @Override
    public List<Personne> findAll() {
        Query query = super.getSession().createQuery("from " + Personne.class.getName());
        List personnes = query.list();
        return personnes;
    }

}
