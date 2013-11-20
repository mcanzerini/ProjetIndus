/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Histoire;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class HistoireDao extends Dao<Histoire> {

    public HistoireDao() {
        super();
    }

    public abstract void create(Histoire obj);

    public abstract void update(Histoire obj);
}
