/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Album;

/**
 *
 * @author mathieu_canzerini
 */
public abstract class AlbumDao extends Dao<Album> {

    public abstract void create(Album obj);

    public abstract void update(Album obj);

    public abstract List<Album> findByRange(Integer pageNumber, Integer length);
}
