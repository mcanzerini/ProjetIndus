/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Competition;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class CompetitionDao extends Dao<Competition> {

    public abstract void create(Competition obj);

    public abstract void update(Competition obj);

    public abstract List<Competition> findLastCompetitions(Integer nbCompets);
}
