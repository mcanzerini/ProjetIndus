/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Reference;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class ReferenceDao extends Dao<Reference> {

    public abstract void create(Reference obj);

    public abstract void update(Reference obj);
}
