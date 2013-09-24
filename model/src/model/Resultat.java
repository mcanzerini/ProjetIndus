/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class Resultat{
    private Competition competition;
    private int place;

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public Resultat(Competition competition, int place) {
        this.competition = competition;
        this.place = place;
    }

}
