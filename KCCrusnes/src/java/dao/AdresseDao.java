/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Adresse;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class AdresseDao extends Dao<Adresse> {

    public abstract void create(Adresse obj);

    public abstract void update(Adresse obj);

    public abstract Adresse findByLieu(String numVoie, String nomVoie, String codePostal, String ville, String pays);
}
