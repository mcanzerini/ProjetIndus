/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.util.List;
import model.Grade;

/**
 *
 * @author mathieu_canzerini
 */
public class Resultat extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    private String typeHeadName;
    private String typeHeadFirstName;
    private String typeHeadPlace;
    private List<Grade> grades;

    @Override
    public String execute() throws Exception {
        typeHeadName = licencieDao.getAllNameTypeHead();
        typeHeadFirstName = licencieDao.getAllFirstNameTypeHead();
        typeHeadPlace = competitionDao.getAllPlaceTypeHead();
        grades = licencieDao.selectAllExistingGrades();
        return SUCCESS;
    }

    public List<Grade> getGrades() {
        return grades;
    }

    public void setGrades(List<Grade> grades) {
        this.grades = grades;
    }

    public String getTypeHeadPlace() {
        return typeHeadPlace;
    }

    public void setTypeHeadPlace(String typeHeadPlace) {
        this.typeHeadPlace = typeHeadPlace;
    }

    public String getTypeHeadFirstName() {
        return typeHeadFirstName;
    }

    public void setTypeHeadFirstName(String typeHeadFirstName) {
        this.typeHeadFirstName = typeHeadFirstName;
    }

    public String getTypeHeadName() {
        return typeHeadName;
    }

    public void setTypeHeadName(String typeHeadName) {
        this.typeHeadName = typeHeadName;
    }

}
