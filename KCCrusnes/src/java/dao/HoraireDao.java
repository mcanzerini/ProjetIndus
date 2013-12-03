/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Horaire;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class HoraireDao extends Dao<Horaire> {

    public abstract void create(Horaire obj);

    public abstract void update(Horaire obj);
}
