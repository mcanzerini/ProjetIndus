/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.PhotoDao;
import dao.PhotoDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Photo;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class AlbumPhoto extends ActionSupport {

    private String idAlbum;
    private String nomAlbum;
    public static final PhotoDao photoDao = PhotoDaoImpl.getInstance();
    private List<Photo> photos;

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        idAlbum = request.getParameter("idAlbum");
        nomAlbum = request.getParameter("nomAlbum");
        photos = photoDao.findByAlbum(Long.valueOf(idAlbum));
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
