/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Membre;
import model.PosteComite;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class MembreDao extends Dao<Membre> {

    public abstract void create(Membre obj);

    public abstract void update(Membre obj);

    public abstract Membre findActifByPoste(PosteComite poste);
}
