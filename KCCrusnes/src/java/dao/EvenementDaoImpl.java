/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
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

    public static EvenementDao uniqueInstance;

    public static EvenementDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new EvenementDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Evenement obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Evenement obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Evenement> findByMonthYear(Integer month, Integer year) {
        Calendar from = new GregorianCalendar();
        Calendar to = new GregorianCalendar();
        if (month > 8) {
            from.set(Calendar.YEAR, year - 1);
            to.set(Calendar.YEAR, year - 1);
        } else {
            from.set(Calendar.YEAR, year);
            to.set(Calendar.YEAR, year);
        }
        from.set(Calendar.DAY_OF_MONTH, 1);
        Integer dernierJour;
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
            dernierJour = 31;
        } else if (month == 2) {
            if (to.get(Calendar.YEAR) % 4 == 0) {
                dernierJour = 29;
            } else {
                dernierJour = 28;
            }
        } else {
            dernierJour = 30;
        }
        to.set(Calendar.DAY_OF_MONTH, dernierJour);
        from.set(Calendar.MONTH, month - 1);
        to.set(Calendar.MONTH, month - 1);
        Query query = super.getSession().createQuery("from " + Evenement.class.getName()
                + " as c where c.date >= :dateFrom and c.date <= :dateTo order by date asc");
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

    @Override
    public List<String> findAnnees() {
        Query query = super.getSession().createQuery("select distinct date from " + Evenement.class.getName() + ""
                + " order by date desc");
        List<Calendar> calendars = query.list();
        List<String> annees = new ArrayList<String>();
        for (Calendar calendar : calendars) {
            String annee = "" + calendar.get(Calendar.YEAR);
            if (!annees.contains(annee)) {
                annees.add(annee);
            }
        }
        return annees;
    }

}
