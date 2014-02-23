/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.HibernateFactory;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import model.Photo;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class AlbumPhoto extends ActionSupport {

    private String idAlbum;
    private String nomAlbum;
    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    private List<Photo> photos;

    @Override
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        idAlbum = request.getParameter("idAlbum");
        //try {
        HibernateFactory.currentSession().clear();
        Integer idAlbumInt = Integer.valueOf(idAlbum);
        Album album = albumDao.find(idAlbumInt);
        if (album != null) {
            photos = photoDao.findByAlbum(idAlbumInt.longValue());
            nomAlbum = album.getNom();
        } else {
            // erreur l'id ne coorespond a aucun album
            return ERROR;
        }
        // } catch (NumberFormatException e) {
        // erreur l'id n'est pas un int
        //   return ERROR;
        // }
        return SUCCESS;
    }

    public String getNomAlbum() {
        return nomAlbum;
    }

    public void setNomAlbum(String nomAlbum) {
        this.nomAlbum = nomAlbum;
    }

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

}
