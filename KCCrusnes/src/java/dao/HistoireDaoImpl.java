/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import model.Histoire;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class HistoireDaoImpl extends HistoireDao{

    @Override
    public Histoire find(long id) {
        Histoire histoire = (Histoire) super.getSession().get(Histoire.class, id);
        return histoire;
    }

    @Override
    public List<Histoire> findAll() {
        Query query = super.getSession().createQuery("from " + Histoire.class.getName());
        List histoires = query.list();
        return histoires;
    }

    @Override
    public void create(Histoire obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Histoire obj) {
        saveOrUpdate(obj);
    }
    
}
