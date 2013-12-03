/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Competition;
import model.Resultat;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class CompetitionDaoImpl extends CompetitionDao {

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

}
