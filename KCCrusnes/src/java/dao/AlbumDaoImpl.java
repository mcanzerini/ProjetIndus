/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Album;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class AlbumDaoImpl extends AlbumDao {

    public static AlbumDao uniqueInstance;

    public static AlbumDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new AlbumDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Album obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Album obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Album> findByRange(Integer pageNumber, Integer length) {
        Query query = super.getSession().createQuery(
                "from  " + Album.class.getName() + " as a order by a.id desc");//" as a order by a.evenement.date desc");
        query.setFirstResult((pageNumber - 1) * length);
        query.setMaxResults(length + 1);
        List<Album> albums = query.list();
        return albums;
    }

    @Override
    public Album find(long id) {
        Album album = (Album) super.getSession().get(Album.class, id);
        return album;
    }

    @Override
    public List<Album> findAll() {
        Query query = super.getSession().createQuery("from " + Album.class.getName());
        List<Album> albums = query.list();
        return albums;
    }

}
