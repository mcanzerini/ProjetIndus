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
public class Entraineur extends Membre {

    private List<Discipline> disciplines;
    private List<Entrainement> entrainements;
    private boolean enfants;
    private boolean adultes;
    private String diplome;

    public Entraineur() {

    }

    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public List<Discipline> getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(List<Discipline> disciplines) {
        this.disciplines = disciplines;
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
