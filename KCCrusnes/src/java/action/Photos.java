/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Album;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author mathieu_canzerini
 */
public class Photos extends ActionSupport {

    private List<Album> albums;
    private Integer pageNumber;
    private Integer nbAlbums;
    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getNbAlbums() {
        return nbAlbums;
    }

    public void setNbAlbums(Integer nbAlbums) {
        this.nbAlbums = nbAlbums;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        } catch (NumberFormatException e) {
            pageNumber = 1;
        }

        try {
            nbAlbums = Integer.parseInt(request.getParameter("nbAlbums"));
        } catch (NumberFormatException e) {
            nbAlbums = 6;
        }

        albums = albumDao.findByRange(pageNumber, nbAlbums);
        return SUCCESS;
    }
}
