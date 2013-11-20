/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Information;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class InformationDao extends Dao<Information> {

    public InformationDao() {
        super();
    }

    public abstract void create(Information obj);

    public abstract void update(Information obj);
}
