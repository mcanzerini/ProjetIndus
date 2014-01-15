/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Reference;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class ReferenceDaoImpl extends ReferenceDao {

    public static ReferenceDao uniqueInstance;

    public static ReferenceDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new ReferenceDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Reference obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Reference obj) {
        saveOrUpdate(obj);
    }

    @Override
    public Reference find(long id) {
        Reference reference = (Reference) super.getSession().get(Reference.class, id);
        return reference;
    }

    @Override
    public List<Reference> findAll() {
        Query query = super.getSession().createQuery("from " + Reference.class.getName());
        List<Reference> references = query.list();
        return references;
    }

}
