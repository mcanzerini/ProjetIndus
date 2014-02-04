/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Discipline;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class DisciplineDao extends Dao<Discipline> {

    public abstract void create(Discipline obj);

    public abstract void update(Discipline obj);
}
