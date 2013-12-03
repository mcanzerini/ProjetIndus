/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Dojo;
import model.Entraineur;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class DojoDao extends Dao<Dojo> {

    public abstract void create(Dojo obj);

    public abstract void update(Dojo obj);
}
