/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author mathieu_canzerini
 */
public class Entraineur {

    private Long id;
    private List<Entrainement> entrainements;
    private boolean enfants;
    private boolean adultes;
    private boolean kata;
    private boolean kumite;
    private String diplome;
    private Licencie licencie;

    public Entraineur() {

    }

    public boolean getKata() {
        return kata;
    }

    public void setKata(boolean kata) {
        this.kata = kata;
    }

    public boolean getKumite() {
        return kumite;
    }

    public void setKumite(boolean kumite) {
        this.kumite = kumite;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Licencie getLicencie() {
        return licencie;
    }

    public void setLicencie(Licencie licencie) {
        this.licencie = licencie;
    }

    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public boolean getEnfants() {
        return enfants;
    }

    public void setEnfants(boolean enfants) {
        this.enfants = enfants;
    }

    public boolean getAdultes() {
        return adultes;
    }

    public void setAdultes(boolean adultes) {
        this.adultes = adultes;
    }

    public List<Entrainement> getEntrainements() {
        return entrainements;
    }

    public void setEntrainements(List<Entrainement> entrainements) {
        this.entrainements = entrainements;
    }
}
