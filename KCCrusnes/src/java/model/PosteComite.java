/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.EnumMap;
import java.util.Map;

/**
 *
 * @author mathieu_canzerini
 */
public enum PosteComite {

    PRESIDENT,
    VICE_PRESIDENT,
    SECRETAIRE,
    SECRETAIRE_ADJOINT,
    TRESORIER,
    TRESORIER_ADJOINT,
    SANS_POSTE;
    public static Map<PosteComite, String> customizedNames;

}
