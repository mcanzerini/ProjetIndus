/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Calendar;
import java.util.List;
import model.Resultat;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatDaoImpl extends ResultatDao {

    public static ResultatDao uniqueInstance;

    public static ResultatDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new ResultatDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Resultat obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Resultat obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Resultat> findLastResults(Integer nbResults) {
        Query query = super.getSession().createQuery("from " + Resultat.class.getName() + " as r "
                + "order by r.id desc ");
        query.setMaxResults(nbResults);
        List<Resultat> resultats = query.list();
        return resultats;
    }

    @Override
    public Resultat find(long id) {
        Resultat resultat = (Resultat) super.getSession().get(Resultat.class, id);
        return resultat;
    }

    @Override
    public List<Resultat> findAll() {
        Query query = super.getSession().createQuery("from " + Resultat.class.getName());
        List<Resultat> resultats = query.list();
        return resultats;
    }

    @Override
    public List<Resultat> findByCompet(long idCompetition) {
        Query query = super.getSession().createQuery("from " + Resultat.class.getName() + " r "
                + " where r.competition.id = " + idCompetition + " order by r.place asc, r.licencie.nom asc, r.licencie.prenom asc");
        List<Resultat> resultats = query.list();
        return resultats;
    }

    @Override
    public List<Resultat> findByLicencie(String nomLicencie, String prenomLicencie, Long resultat) {
        StringBuilder q = new StringBuilder("from " + Resultat.class.getName() + " r ");
        boolean first = true;
        if (nomLicencie != null && !nomLicencie.equals("")) {
            q.append(" where ");
            first = false;
            q.append(" r.licencie.nom = '");
            q.append(nomLicencie);
            q.append("'");
        }
        if (prenomLicencie != null && !prenomLicencie.equals("")) {
            if (first) {
                q.append(" where ");
                first = false;
            } else {
                q.append(" and ");
            }
            q.append(" r.licencie.prenom = '");
            q.append(prenomLicencie);
            q.append("'");
        }
        if (resultat != null && resultat > 0) {
            if (first) {
                q.append(" where ");
                first = false;
            } else {
                q.append(" and ");
            }
            q.append(" r.place <= ");
            q.append(resultat);
        }
        q.append(" order by r.place asc, r.licencie.nom asc, r.licencie.prenom asc");
        Query query = super.getSession().createQuery(q.toString());
        List<Resultat> resultats = query.list();
        return resultats;
    }

    @Override
    public List<Resultat> findByCompetResultat(long idCompetition, Long resultat) {
        Query query = super.getSession().createQuery("from " + Resultat.class.getName() + " r "
                + " where r.competition.id = " + idCompetition + " "
                + " and r.place <= " + resultat + " order by r.place asc, r.licencie.nom asc, r.licencie.prenom asc");
        List<Resultat> resultats = query.list();
        return resultats;
    }

    @Override
    public List<Resultat> findByAnnee(Integer annee) {
        Calendar from = Calendar.getInstance();
        from.set(Calendar.YEAR, annee - 1);
        from.set(Calendar.MONTH, Calendar.SEPTEMBER);
        from.set(Calendar.DAY_OF_MONTH, 1);
        Calendar to = Calendar.getInstance();
        to.set(Calendar.YEAR, annee);
        to.set(Calendar.MONTH, Calendar.AUGUST);
        to.set(Calendar.DAY_OF_MONTH, 31);
        Query query = super.getSession().createQuery("from " + Resultat.class.getName() + " r "
                + " where r.competition.date >= :dateFrom"
                + " and r.competition.date < :dateTo"
                //+ " group by r.licencie "
                + " order by r.licencie.nom asc, r.licencie.prenom asc, r.competition.date asc");
        query.setParameter("dateFrom", from);
        query.setParameter("dateTo", to);
        List<Resultat> resultats = query.list();
        return resultats;
    }

}
