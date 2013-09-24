/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author mathieu_canzerini
 */
public class Heure {
    private int heure;
    private int minute;

    public Heure(int heure, int minute) {
        this.heure = heure;
        this.minute = minute;
    }

    public int getHeure() {
        return heure;
    }

    public void setHeure(int heure) {
        this.heure = heure;
    }

    public int getMinute() {
        return minute;
    }

    public void setMinute(int minute) {
        this.minute = minute;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Heure other = (Heure) obj;
        if (this.heure != other.heure) {
            return false;
        }
        if (this.minute != other.minute) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + this.heure;
        hash = 41 * hash + this.minute;
        return hash;
    }

}
