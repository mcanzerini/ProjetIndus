/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Calendar;
import java.util.List;
import model.Competition;
import model.Resultat;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class CompetitionDaoImpl extends CompetitionDao {

    public static CompetitionDao uniqueInstance;

    public static CompetitionDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new CompetitionDaoImpl();
        }
        return uniqueInstance;
    }
    private StringBuilder StringBuilder;

    @Override
    public void create(Competition obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Competition obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Competition> findLastCompetitions(Integer nbCompets) {
        Query query = super.getSession().createQuery(
                "select distinct r.competition from " + Resultat.class.getName() + " as r order by r.competition.date desc");
        query.setMaxResults(nbCompets);
        List<Competition> competitions = query.list();
        return competitions;
    }

    @Override
    public Competition find(long id) {
        Competition competition = (Competition) super.getSession().get(Competition.class, id);
        return competition;
    }

    @Override
    public List<Competition> findAll() {
        Query query = super.getSession().createQuery("from " + Competition.class.getName());
        List<Competition> competitions = query.list();
        return competitions;
    }

    @Override
    public List<String> selectAllDistinctPlaces() {
        Query query = super.getSession().createQuery("select distinct c.lieu.ville from " + Competition.class.getName() + " c "
                + "order by c.lieu.ville desc");
        List lieux = query.list();
        return lieux;
    }

    @Override
    public String getAllPlaceTypeHead() {
        StringBuilder res = new StringBuilder("");
        List<String> places = selectAllDistinctPlaces();
        boolean first = true;
        for (String place : places) {
            if (first) {
                first = false;
                res.append(place);
            } else {
                res.append(",");
                res.append(place);
            }
        }
        return res.toString();
    }

    @Override
    public List<Competition> findByDateLieuNiveau(Calendar date, String lieu, String niveau) {
        StringBuilder q = new StringBuilder("from " + Competition.class.getName() + " c ");
        boolean first = true;
        if (date != null) {
            q.append(" where c.date = :date ");
            first = false;
        }
        if (lieu != null && !lieu.equals("")) {
            if (first) {
                q.append(" where ");
                first = false;
            } else {
                q.append(" and ");
            }
            q.append(" c.lieu.ville = '");
            q.append(lieu);
            q.append("'");
        }
        if (niveau != null && !niveau.equals("")) {
            if (first) {
                q.append(" where ");
            } else {
                q.append(" and ");
            }
            q.append(" c.niveau = '");
            q.append(niveau);
            q.append("'");
        }

        Query query = super.getSession().createQuery(q.toString());
        query.setParameter("date", date);
        List<Competition> competitions = query.list();
        return competitions;
    }

}
