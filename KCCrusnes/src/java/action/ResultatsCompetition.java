/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Competition;
import model.Resultat;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class ResultatsCompetition extends ActionSupport {

    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    private List<Resultat> resultats;
    private Competition competition;
    private List<Competition> competitions;
    private String dateString;
    private String lieu;
    private String niveau;
    private String resultatString;

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String idCompetitionString = request.getParameter("idCompetition");
        long idCompetition = Long.valueOf(idCompetitionString);
        competition = competitionDao.find(idCompetition);
        resultats = resultatDao.findByCompet(idCompetition);
        return SUCCESS;
    }

    public String executeSearch() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        dateString = request.getParameter("date");
        lieu = request.getParameter("lieu");
        niveau = request.getParameter("niveau");
        resultatString = request.getParameter("resultat");
        Long resultat = Long.valueOf(resultatString);
        Calendar date = null;
        if (dateString != null && !dateString.equals("")) {
            String[] strings = dateString.split("/");
            if (strings.length == 3) {
                try {
                    date = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                } catch (NumberFormatException e) {
                    date = null;
                }
            }
        }
        competitions = competitionDao.findByDateLieuNiveau(date, lieu, niveau);
        if (competitions == null || competitions.isEmpty()) {
            return ActionUtils.NO_RESULT;
        }
        if (competitions.size() > 1) {
            return ERROR;
        } else {
            competition = competitions.get(0);
            resultats = resultatDao.findByCompetResultat(competition.getId(), resultat);
            return SUCCESS;
        }

    }

    public String getDateString() {
        return dateString;
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public String getResultatString() {
        return resultatString;
    }

    public void setResultatString(String resultatString) {
        this.resultatString = resultatString;
    }

    public List<Competition> getCompetitions() {
        return competitions;
    }

    public void setCompetitions(List<Competition> competitions) {
        this.competitions = competitions;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public List<Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(List<Resultat> resultats) {
        this.resultats = resultats;
    }

}
