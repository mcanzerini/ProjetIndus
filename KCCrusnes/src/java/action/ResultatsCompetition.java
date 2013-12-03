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

    private static final ResultatDao resultatDao = new ResultatDaoImpl();
    private static final CompetitionDao competitionDao = new CompetitionDaoImpl();
    private List<Resultat> resultats;
    private Competition competition;

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String idCompetitionString = request.getParameter("idCompetition");
        long idCompetition = Long.valueOf(idCompetitionString);
        competition = competitionDao.find(idCompetition);
        resultats = resultatDao.findByCompet(idCompetition);
        return SUCCESS;
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
