/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Licencie;
import model.Membre;
import model.PosteComite;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class MembreDaoImpl extends MembreDao {

    public static MembreDao uniqueInstance;

    public static MembreDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new MembreDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Membre obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public void update(Membre obj) {
        super.saveOrUpdate(obj);
    }

    @Override
    public Membre find(long id) {
        Membre membre = (Membre) super.getSession().get(Membre.class, id);
        return membre;
    }

    @Override
    public List<Membre> findAll() {
        Query query = super.getSession().createQuery("from " + Membre.class.getName());
        List membres = query.list();
        return membres;
    }

    @Override
    public Membre findActifByPoste(PosteComite poste) {
        Query q = super.getSession().createQuery("from " + Membre.class.getName() + " as m "
                + "where m.poste = :poste and m.dateFinActivite is null");
        q.setString("poste", poste.name());
        List<Membre> membres = q.list();
        return membres.get(0);
    }

    public Membre findByPoste(PosteComite poste) {
        Query q = super.getSession().createQuery("from " + Membre.class.getName() + " as m "
                + "where m.poste = :poste");
        q.setString("poste", poste.name());
        List<Membre> membres = q.list();
        return membres.get(0);
    }

    @Override
    public String getMdpByLogin(String login) {
        Membre membre;
        Query q = super.getSession().createQuery("from " + Membre.class.getName() + " as m "
                + "where m.login = :login");
        q.setString("login", login);
        membre = (Membre) q.uniqueResult();
        if (membre == null) {
            return null;
        } else {
            return membre.getMdp();
        }
    }

    @Override
    public Membre findByLicencie(Licencie licencie) {
        Membre membre;
        Query q = super.getSession().createQuery("from " + Membre.class.getName() + " as m "
                + "where m.licencie.id = :id");
        q.setString("id", "" + licencie.getId());
        membre = (Membre) q.uniqueResult();
        return membre;
    }

}
