/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.ResultatDao;
import dao.ResultatDaoImpl;
import java.util.List;
import model.Competition;

/**
 *
 * @author mathieu_canzerini
 */
public class DerniersResultats extends ActionSupport {

    private List<Competition> competitions;
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    public static final ResultatDao resultatDao = ResultatDaoImpl.getInstance();

    public String execute() throws Exception {
        competitions = competitionDao.findLastCompetitions(6);

        return SUCCESS;
    }

    public List<Competition> getCompetitions() {
        return competitions;
    }

    public void setCompetitions(List<Competition> dernieresCompetitions) {
        this.competitions = dernieresCompetitions;
    }

}
