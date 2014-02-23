/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.AdresseDao;
import dao.AdresseDaoImpl;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import exception.NotLoggedException;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Adresse;
import model.Competition;
import model.Evenement;
import model.NiveauCompetition;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import util.FilesUtil;

/**
 *
 * @author mathieu_canzerini
 */
public class NewEvenement extends ActionSupport implements ServletContextAware {

    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    public static final AdresseDao adresseDao = AdresseDaoImpl.getInstance();

    private File file;
    private String fileContentType;
    private String fileFileName;
    private String filePath;
    private ServletContext context;
    private String annee;

    @Override
    public String execute() throws NotLoggedException, IOException {
        System.out.println("1");
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            boolean photo = true;
            try {
                HttpServletRequest request = ServletActionContext.getRequest();
                String numeroRue = request.getParameter("numRue");
                String nom = request.getParameter("nom");
                String dateString = request.getParameter("date");
                String nomRue = request.getParameter("nomRue");
                if (numeroRue != null && numeroRue.equals("")) {
                    numeroRue = null;
                }
                if (nomRue != null && nomRue.equals("")) {
                    nomRue = null;
                }
                String ville = request.getParameter("ville");
                if (ville != null && ville.equals("")) {
                    ville = null;
                }
                String pays = request.getParameter("pays");
                if (pays != null && pays.equals("")) {
                    pays = null;
                }
                String CP = request.getParameter("CP");
                if (CP != null && CP.equals("")) {
                    CP = null;
                }
                String type = request.getParameter("type");
                System.out.println("2");
                if (fileFileName == null || fileFileName.equals("") || file == null) {
                    fileFileName = ActionUtils.DEFAULT_PHOTO_EVENEMENT;
                    photo = false;
                    System.out.println("3");
                }
                Adresse adresse = adresseDao.findByLieu(numeroRue, nomRue, CP, ville, pays);
                if (adresse == null) {
                    adresse = new Adresse();
                    adresse.setCodePostal(CP);
                    adresse.setNomVoie(nomRue);
                    adresse.setNumVoie(numeroRue);
                    adresse.setPays(pays);
                    adresse.setVille(ville);
                    adresseDao.create(adresse);
                }
                if (type.equals("competition")) {
                    Competition evenement = new Competition();
                    String programme = request.getParameter("programme");
                    if (programme != null && programme.equals("")) {
                        programme = null;
                    }
                    String niveau = request.getParameter("niveau");
                    if (niveau != null && niveau.equals("")) {
                        niveau = null;
                    }
                    evenement.setLienProgramme(programme);
                    evenement.setNiveau(NiveauCompetition.valueOf(niveau));
                    evenement.setLieu(adresse);
                    evenement.setNom(nom);
                    evenement.setPhotoPrincipale(fileFileName);
                    Calendar date = null;
                    if (dateString != null && !dateString.equals("")) {
                        String[] strings = dateString.split("/");
                        if (strings.length == 3) {
                            try {
                                date = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                                Integer anneeInt = date.get(Calendar.YEAR);
                                Integer month = date.get(Calendar.MONTH) + 1;
                                if (month >= 9) {
                                    anneeInt++;
                                }
                                annee = "" + anneeInt;
                            } catch (NumberFormatException e) {
                                date = null;
                            }
                        }
                    }
                    evenement.setDate(date);
                    evenementDao.update(evenement);
                } // Rajouter les tests pour stage et sorties
                else {
                    Evenement evenement = new Evenement();
                    evenement.setLieu(adresse);
                    evenement.setNom(nom);
                    evenement.setPhotoPrincipale(fileFileName);
                    Calendar date = null;
                    if (dateString != null && !dateString.equals("")) {
                        String[] strings = dateString.split("/");
                        if (strings.length == 3) {
                            try {
                                date = new GregorianCalendar(Integer.parseInt(strings[2]), Integer.parseInt(strings[1]) - 1, Integer.parseInt(strings[0]));
                                Integer anneeInt = date.get(Calendar.YEAR);
                                Integer month = date.get(Calendar.MONTH) + 1;
                                if (month >= 9) {
                                    anneeInt++;
                                }
                                annee = "" + anneeInt;
                            } catch (NumberFormatException e) {
                                date = null;
                            }
                        }
                    }
                    evenement.setDate(date);
                    evenementDao.update(evenement);
                }
                System.out.println("4");
                if (photo) {
                    System.out.println("5");
                    context = ServletActionContext.getServletContext();
                    String fileName = fileFileName;
                    System.out.print("\nFile ");
                    System.out.print("; name:" + fileName);
                    System.out.print("; contentType: " + fileContentType);
                    System.out.print("; length: " + file.length());
                    System.out.println("; path: " + context.getRealPath(""));
                    String path = context.getRealPath("") + ActionUtils.PATH_TO_EVENEMENT;
                    FilesUtil.saveFile(file, fileFileName, path);
                }
            } catch (NumberFormatException e) {
                // donnees ne sont pas des int
                return ERROR;
            }
            return SUCCESS;
        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
        }
    }

    public void setServletContext(ServletContext sc) {
        this.context = sc;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public ServletContext getContext() {
        return context;
    }

    public void setContext(ServletContext context) {
        this.context = context;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

}
