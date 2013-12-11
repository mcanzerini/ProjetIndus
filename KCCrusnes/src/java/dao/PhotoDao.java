/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Photo;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class PhotoDao extends Dao<Photo> {

    public abstract void create(Photo obj);

    public abstract void update(Photo obj);

    public abstract List<Photo> findByAlbum(Long idAlbum);
}
