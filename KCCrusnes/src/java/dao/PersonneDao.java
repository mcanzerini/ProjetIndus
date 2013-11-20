/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Personne;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class PersonneDao extends Dao<Personne> {

    public abstract void create(Personne obj);

    public abstract void update(Personne obj);
}
