/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Photo;
import org.hibernate.Query;

/**
 *
 * @author mathieu_canzerini
 */
public class PhotoDaoImpl extends PhotoDao {

    public static PhotoDao uniqueInstance;

    public static PhotoDao getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new PhotoDaoImpl();
        }
        return uniqueInstance;
    }

    @Override
    public void create(Photo obj) {
        saveOrUpdate(obj);
    }

    @Override
    public void update(Photo obj) {
        saveOrUpdate(obj);
    }

    @Override
    public List<Photo> findByAlbum(Long idAlbum) {
        Query query = super.getSession().createQuery("from " + Photo.class.getName() + " p "
                + " where p.album.id = " + idAlbum);
        List<Photo> photos = query.list();
        return photos;
    }

    @Override
    public Photo find(long id) {
        Photo photo = (Photo) super.getSession().get(Photo.class, id);
        return photo;
    }

    @Override
    public List<Photo> findAll() {
        Query query = super.getSession().createQuery("from " + Photo.class.getName());
        List<Photo> photos = query.list();
        return photos;
    }

}
