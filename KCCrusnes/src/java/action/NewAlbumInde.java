/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import exception.NotLoggedException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Photo;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class NewAlbumInde extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    private String idAlbum;
    private String nomAlbum;

    @Override
    public String execute() throws NotLoggedException {
        Map session = ActionContext.getContext().getSession();
        if (session.get("logined") != null && session.get("logined").equals("true")) {
            HttpServletRequest request = ServletActionContext.getRequest();
            nomAlbum = request.getParameter("nom");
            Album album = new Album();
            //album.setEvenement(evenement);
            album.setNom(nomAlbum);
            album.setDateAjout(Calendar.getInstance());
            album.setPhotos(new ArrayList<Photo>());

            albumDao.create(album);
            idAlbum = "" + album.getId();
            return SUCCESS;

        } else {
            // L'utilisateur n'est pas connecte
            // Gerer les erreurs
            throw new NotLoggedException();
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
