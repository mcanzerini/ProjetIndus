/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Discipline;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class DisciplineDaoImpl extends DisciplineDao {

    public static DisciplineDao uniqueInstance;

    public static DisciplineDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new DisciplineDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Discipline obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Discipline obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Discipline find(long id) {
        Discipline discipline = (Discipline) super.getSession().get(Discipline.class, id);
        return discipline;
    }

    @Override
    public List<Discipline> findAll() {
        Query query = super.getSession().createQuery("from " + Discipline.class.getName()
                + " as d order by d.id");
        List<Discipline> disciplines = query.list();
        return disciplines;
    }

}
