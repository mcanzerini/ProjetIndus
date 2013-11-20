/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Information;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class InformationDaoImpl extends InformationDao {

    public InformationDaoImpl(){
        super();
    }
    
    @Override
    public Information find(long id) {
        Information information = (Information) super.getSession().get(Information.class, id);
        return information;
    }

    @Override
    public List<Information> findAll() {
        Query query = super.getSession().createQuery("from " + Information.class.getName());
        List informations = query.list();
        return informations;
    }

    @Override
    public void create(Information obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public void update(Information obj) {
        super.saveOrUpdate(obj);
    }

}
