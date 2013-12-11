/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
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
public class Albums extends ActionSupport {

    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();
    private List<Album> albums;
    //private List<String> albums;

    @Override
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String pageNumber = request.getParameter("pageNumber");
        String nbAlbums = request.getParameter("nbAlbums");
        albums = albumDao.findByRange(Integer.parseInt(pageNumber), Integer.parseInt(nbAlbums));
        /*albums = new ArrayList<String>();
         albums.add("album1");
         albums.add("album2");
         albums.add("album3");*/
        return SUCCESS;
    }

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

}
