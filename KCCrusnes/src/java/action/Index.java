/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.CompetitionDao;
import dao.CompetitionDaoImpl;
import dao.InformationDao;
import dao.InformationDaoImpl;
import java.util.ArrayList;
import java.util.List;
import model.Album;
import model.Competition;
import model.Information;

/**
 *
 * @author mathieu_canzerini
 */
public class Index extends ActionSupport {

    private List<Information> informations;
    private List<Object> actualites;
    public static final InformationDao informationDao = InformationDaoImpl.getInstance();
    public static final CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
    public static final AlbumDao albumDao = AlbumDaoImpl.getInstance();

    /**
     *
     * @return @throws Exception
     */
    @Override
    public String execute() throws Exception {
        setInformations(informationDao.findAll());
        List<Competition> competitions = competitionDao.findLastCompetitions(6);
        List<Album> albums = albumDao.findByRange(1, 6);
        actualites = new ArrayList<Object>();
        actualites.addAll(albums);
        int i;
        for (Competition competition : competitions) {
            boolean ajoute = false;
            i = 0;
            for (Object object : actualites) {
                if (object instanceof Album) {
                    Album album = (Album) object;
                    if (album.getDateAjout().before(competition.getDate())) {
                        actualites.add(i, competition);
                        ajoute = true;
                        break;
                    }
                }
                i++;
            }
            if (!ajoute) {
                actualites.add(competition);
            }
        }
        actualites = actualites.subList(0, Math.min(actualites.size(), 6));
        return SUCCESS;
    }

    public List<Object> getActualites() {
        return actualites;
    }

    public void setActualites(List<Object> actualites) {
        this.actualites = actualites;
    }

    public List<Information> getInformations() {
        return informations;
    }

    public void setInformations(List<Information> informations) {
        this.informations = informations;
    }

}
