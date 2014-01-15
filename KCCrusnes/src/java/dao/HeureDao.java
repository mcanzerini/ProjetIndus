/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Heure;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class HeureDao extends Dao<Heure> {

    public abstract void create(Heure obj);

    public abstract void update(Heure obj);
}
