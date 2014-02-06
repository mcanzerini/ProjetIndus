/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mathieu_canzerini
 */
public class ActionUtils {

    public static final String NO_RESULT = "noresult";
    public static final long ID_KATA_IN_DISCIPLINE = 0;
    public static final long ID_KUMITE_IN_DISCIPLINE = 1;
    public static final String DEFAULT_PHOTO_EVENEMENT = "defaut_evenement.jpg";
    public static final String PATH_TO_ALBUM = File.separator
            + "resources" + File.separator + "img" + File.separator
            + "albums" + File.separator;
    public static final String PATH_TO_LIEN = File.separator
            + "resources" + File.separator + "img" + File.separator
            + "liens" + File.separator;
    public static final String PATH_TO_EVENEMENT = File.separator
            + "resources" + File.separator + "img" + File.separator
            + "evenement" + File.separator;

    public static String md5Java(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(message.getBytes("UTF-8")); //converting byte array to Hexadecimal String
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(String.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(String.class.getName()).log(Level.SEVERE, null, ex);
        }
        return digest;
    }

}
