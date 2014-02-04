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
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.EvenementDao;
import dao.EvenementDaoImpl;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Evenement;
import model.Photo;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewAlbum extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    public static final EvenementDao evenementDao = EvenementDaoImpl.getInstance();
    private String idAlbum;
    private String nomAlbum;

    @Override
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String idEvenementString = request.getParameter("id");
            try {
                Integer idEvenement = Integer.parseInt(idEvenementString);
                Evenement evenement = evenementDao.find(idEvenement);
                Album album = new Album();
                //album.setEvenement(evenement);
                album.setNom(evenement.getNom());
                album.setDateAjout(Calendar.getInstance());
                album.setPhotos(new ArrayList<Photo>());
                albumDao.create(album);
                evenement.setAlbum(album);
                evenementDao.update(evenement);
                idAlbum = "" + album.getId();
                nomAlbum = album.getNom();
                return SUCCESS;
            } catch (NumberFormatException e) {
                // l'id n'est pas un int
                return ERROR;
            }

        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            return ERROR;
        }
    }

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public String getNomAlbum() {
        return nomAlbum;
    }

    public void setNomAlbum(String nomAlbum) {
        this.nomAlbum = nomAlbum;
    }

}
