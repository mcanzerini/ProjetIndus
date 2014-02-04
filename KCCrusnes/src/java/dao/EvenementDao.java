/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Evenement;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class EvenementDao extends Dao<Evenement> {

    public abstract void create(Evenement obj);

    public abstract void update(Evenement obj);

    public abstract List<Evenement> findByMonthYear(Integer month, Integer year);

    public abstract List<String> findAnnees();
}
