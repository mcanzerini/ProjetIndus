/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import model.Evenement;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class EvenementDaoImpl extends EvenementDao {

    @Override
    public void create(Evenement obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Evenement obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Evenement> findByMonth(Integer month) {
        Calendar from = new GregorianCalendar();
        Calendar to = new GregorianCalendar();
        from.set(Calendar.MONTH, month - 1);
        to.set(Calendar.MONTH, month - 1);
        from.set(Calendar.DATE, 1);
        to.set(Calendar.DATE, to.getActualMaximum(Calendar.DAY_OF_MONTH));
        Query query = super.getSession().createQuery("from " + Evenement.class.getName()
                + " as c where c.date > :dateFrom and c.date < :dateTo order by date asc");
        query.setParameter("dateFrom", from);
        query.setParameter("dateTo", to);
        List<Evenement> evenements = query.list();
        return evenements;
    }

    @Override
    public Evenement find(long id) {
        Evenement evenement = (Evenement) super.getSession().get(Evenement.class, id);
        return evenement;
    }

    @Override
    public List<Evenement> findAll() {
        Query query = super.getSession().createQuery("from " + Evenement.class.getName());
        List<Evenement> evenements = query.list();
        return evenements;
    }

}
