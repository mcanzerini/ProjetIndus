/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.LicencieDao;
import dao.LicencieDaoImpl;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.CategorieAge;
import model.Grade;
import model.Licencie;
import model.Sexe;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class Licencies extends ActionSupport {

    public static final LicencieDao licencieDao = LicencieDaoImpl.getInstance();
    private List<Licencie> licencies;
    private Integer page;

    @Override
    public String execute() {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idString = request.getParameter("id");
            if (idString != null && !idString.equals("")) {
                try {
                    Long id = Long.valueOf(idString);
                    licencies = new ArrayList<Licencie>();
                    licencies.add(licencieDao.find(id));
                } catch (NumberFormatException e) {
                    // l'id n'est pas un entier
                    return ERROR;
                }
            } else {
                String categorieAgeString = request.getParameter("categorieAge");
                String isEtudiantString = request.getParameter("isEtudiant");
                String isActifString = request.getParameter("isActif");
                String gradeString = request.getParameter("grade");
                String sexeString = request.getParameter("sexe");
                String pageString = request.getParameter("page");
                Integer pageInt = null;
                Grade grade = null;
                Sexe sexe = null;
                Boolean isActif = null;
                Boolean isEtudiant = null;
                CategorieAge categorieAge = null;
                try {
                    if (pageString != null && !pageString.equals("")) {
                        pageInt = Integer.valueOf(pageString);
                    }
                } catch (NumberFormatException e) {
                    // La page n'est pas un entier
                    return ERROR;
                }
                try {
                    if (gradeString != null && !gradeString.equals("")) {
                        grade = Grade.valueOf(gradeString);
                    }
                    if (sexeString != null && !sexeString.equals("")) {
                        sexe = Sexe.valueOf(sexeString);
                    }
                    if (isActifString != null && !isActifString.equals("")) {
                        isActif = Boolean.valueOf(isActifString);
                    }
                    if (isEtudiantString != null && !isEtudiantString.equals("")) {
                        isEtudiant = Boolean.valueOf(isEtudiantString);
                    }
                    if (categorieAgeString != null && !categorieAgeString.equals("")) {
                        categorieAge = CategorieAge.valueOf(categorieAgeString);
                    }
                } catch (IllegalArgumentException e) {
                    // Les enum ne matchent pas
                    System.out.println("enum");
                    return ERROR;
                }
                licencies = licencieDao.findForAdmin(pageInt, grade, sexe, isActif, isEtudiant, categorieAge);
                page = pageInt;
            }
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }

    public List<Licencie> getLicencies() {
        return licencies;
    }

    public void setLicencies(List<Licencie> licencies) {
        this.licencies = licencies;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
