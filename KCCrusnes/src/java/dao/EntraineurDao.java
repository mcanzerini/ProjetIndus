/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Entraineur;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class EntraineurDao extends Dao<Entraineur> {

    public abstract void create(Entraineur obj);

    public abstract void update(Entraineur obj);
}
