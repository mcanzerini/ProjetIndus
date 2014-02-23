<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Le site officiel du Karate Club de Crusnes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <meta charset="UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/datepicker.css" rel="stylesheet" media="screen">
        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
        <style>
            .datepicker{z-index:1151;}
        </style>
    </head>

    <body id="calendrier">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
            <div id="newEvenement" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Nouvel Evénement</h3>
                    </div>
                    <form id="newEvenementForm" action="NewEvenement" enctype="multipart/form-data" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputNom">Nom</label>
                                <div class="controls">
                                    <input type="text" name="nom" id="inputNomEvenement"/>
                                    <input type="hidden" value="competition" name="type"/>
                                </div>
                            </div>
                            <div class="control-group" id="controlinputDate">
                                <label class="control-label" for="inputDate">Date</label>
                                <div class="controls">

                                    <div class="input-append date" id="dp3" data-date="01/01/2013" data-date-format="dd/mm/yyyy">
                                        <input class="span9" oninput="checkDateFormat('inputDate')" id="inputDate" autocomplete="off" size="10" type="text" name="date" value="01/01/2013">
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                    </div>  </div></div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">n° voie</label>
                                <div class="controls">
                                    <input type="text" name="numRue" id="inputNumRueEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Nom de la voie</label>
                                <div class="controls">
                                    <input type="text" name="nomRue" id="inputNomRueEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Code Postal</label>
                                <div class="controls">
                                    <input type="text" name="CP" id="inputCodePostalEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Ville</label>
                                <div class="controls">
                                    <input type="text" name="ville" id="inputVilleEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Pays</label>
                                <div class="controls">
                                    <input type="text" name="pays" id="inputPaysEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputFile">Image</label>
                                <div class="controls">
                                    <input type="file" id="inputFile" name="file" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Lien Programme</label>
                                <div class="controls">
                                    <input type="text" name="programme" id="inputProgrammeEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputType">Niveau</label>
                                <div class="controls">
                                    <select id="inputNiveau" name="niveau">
                                        <option value="DEPARTEMENTAL">Championnat D&eacute;partemental</option>
                                        <option value="REGIONAL">Championnat Lorraine</option>
                                        <option value="NATIONAL">Championnat National</option>
                                        <option selected value="DIVERS">Divers (Open, ...)</option>
                                    </select>    </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" id="submitNewEvenement" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="modifEvenement" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Modification Evénement</h3>
                    </div>
                    <form id="modifEvenementForm" action="ModifEvenement" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputNom">Nom</label>
                                <div class="controls">
                                    <input type="text" name="nom" id="inputModifNomEvenement"/>
                                    <input type="hidden" value="competition" name="type"/>
                                    <input type="hidden" id="idEvenementModif" name="idEvenement"/>
                                </div>
                            </div>
                            <div class="control-group" id="controlinputModifDate">
                                <label class="control-label" for="inputDate">Date</label>
                                <div class="controls">

                                    <div class="input-append date" id="dp4" data-date="01/01/2013" data-date-format="dd/mm/yyyy">
                                        <input class="span9" oninput="checkDateFormat('inputModifDate')" id="inputModifDate" autocomplete="off" size="10" type="text" name="date" value="01/01/2013">
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                    </div>  </div></div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">n° voie</label>
                                <div class="controls">
                                    <input type="text" name="numRue" id="inputModifNumRueEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Nom de la voie</label>
                                <div class="controls">
                                    <input type="text" name="nomRue" id="inputModifNomRueEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Code Postal</label>
                                <div class="controls">
                                    <input type="text" name="CP" id="inputModifCodePostalEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Ville</label>
                                <div class="controls">
                                    <input type="text" name="ville" id="inputModifVilleEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Pays</label>
                                <div class="controls">
                                    <input type="text" name="pays" id="inputModifPaysEvenement"/>
                                </div>
                            </div>
                            <!--                            <div class="control-group">
                                                            <label class="control-label" for="inputModifFile">Image</label>
                                                            <div class="controls">
                                                                <input type="file" id="inputModifFile" name="file" />
                                                            </div>
                                                        </div>-->
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Lien Programme</label>
                                <div class="controls">
                                    <input type="text" name="programme" id="inputModifProgrammeEvenement"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputType">Niveau</label>
                                <div class="controls">
                                    <select id="inputModifNiveau" name="niveau">
                                        <option value="DEPARTEMENTAL">Championnat D&eacute;partemental</option>
                                        <option value="REGIONAL">Championnat Lorraine</option>
                                        <option value="NATIONAL">Championnat National</option>
                                        <option selected value="DIVERS">Divers (Open, ...)</option>
                                    </select>    </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" id="submitModifEvenement" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="deleteEvenement" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Suppression d'Evénement</h3>
                    </div>
                    <form id="deleteEvenementForm" action="DeleteEvenement" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idEvenement" value="">
                            <p>Vous êtes sur le point de supprimer définitivement un événement</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="deleteEvenementForm" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="newAlbum" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Création d'album</h3>
                    </div>
                    <form id="newAlbumForm" action="NewAlbum" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idAlbumEvenement" value="">
                            <p>Cet événement n'a pas encore d'album photo. En créer un ?</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="newAlbumForm" value="Confirmer" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <div class="page-header">
                    <h1>Calendrier</h1>
                </div>

                <blockquote class="span10">
                    <p>« Le temps se rétrécit ou semble s'accélérer à mesure qu'approche la date du but à atteindre. »</p>
                    <small>Eric Tabarly</small>
                </blockquote>


                <s:if test="#session.logined == 'true'"><button data-toggle="modal" data-target="#newEvenement" class="btn btn-primary">Ajouter un événement</button></s:if>
                <br><br><br><div class="pull-right"><s:iterator value="annees" var="annee"><a href="<s:url value="VoirCalendrier.action?annee=%{annee}"/>"><b><s:property value="annee"/></b> </a></s:iterator></div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><h3 class="grosMois">Septembre</h3>
                        <h3 class="petitMois">Sep</h3></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <th>&Eacute;v&eacute;nement</th> <!-- Créer une vue pour iPhone en minimisant les caractères. Ex : 09 au lieu de Septembre-->
                            <th>Lieu</th>
                            <th>Liens</th>
                        </tr>
                        </thead>
                        <tbody class="septembre">
                        <s:iterator value="evenementsSeptembre" var="evenement" status="septembreStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date  name="date" format="dd" /> Septembre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/> <s:property escape="false" value="lieu.pays"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 9)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Octobre</h3>
                    <h3 class="petitMois">Oct</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="octobre">
                        <s:iterator value="evenementsOctobre" var="evenement" status="octobreStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <s:set name="aujourdhuiVar" value="aujourdhui"/>
                            <tr>
                                <td><s:date name="date" format="dd" /> Octobre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 10)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>

                        </s:iterator>
                        <tr>
                            <td>20-21 Octobre</td>
                            <td>Open Luxembourg</td>
                            <td>Kayl, Luxembourg</td>
                            <td><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="#"><i class="icon-file"></i></a>
                                <a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="#"><i class="icon-star-empty"></i></a>
                                <a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></td>
                        </tr>

                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Novembre</h3>
                    <h3 class="petitMois">Nov</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>

                    <tbody class="novembre">
                        <s:iterator value="evenementsNovembre" var="evenement"  status="novembreStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Novembre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 11)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">D&eacute;cembre</h3>
                    <h3 class="petitMois">Déc</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="decembre">
                        <s:iterator value="evenementsDecembre"  var="evenement" status="decembreStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Décembre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 12)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Janvier</h3>
                    <h3 class="petitMois">Jan</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="janvier">
                        <s:iterator value="evenementsJanvier"  var="evenement" status="janvierStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Janvier</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 1)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Février</h3>
                    <h3 class="petitMois">Fév</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="fevrier">
                        <s:iterator value="evenementsFevrier"  var="evenement" status="fevrierStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Février</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 2)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Mars</h3>
                    <h3 class="petitMois">Mar</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="mars">
                        <s:iterator value="evenementsMars" var="evenement"  status="marsStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Mars</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 3)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>

                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Avril</h3>
                    <h3 class="petitMois">Avr</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="avril">
                        <s:iterator value="evenementsAvril" var="evenement"  status="avrilStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Avril</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 4)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Mai</h3>
                    <h3 class="petitMois">Mai</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="mai">
                        <s:iterator value="evenementsMai"  var="evenement" status="maiStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Mai</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 5)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Juin</h3>
                    <h3 class="petitMois">Jui</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="juin">
                        <s:iterator value="evenementsJuin"  var="evenement" status="juinStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Juin</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 6)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Juillet</h3>
                    <h3 class="petitMois">Jul</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="juillet">
                        <s:iterator value="evenementsJuillet"  var="evenement" status="juilletStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Juillet</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 7)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Aout</h3>
                    <h3 class="petitMois">Aou</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody class="aout">
                        <s:iterator value="evenementsAout"  var="evenement" status="aoutStatus">
                            <s:if test="%{#evenement instanceof model.Competition}">
                                <s:set var="type" value="0"/>
                            </s:if>
                            <s:elseif test="%{#evenement instanceof model.Stage}">
                                <s:set var="type" value="1"/>
                            </s:elseif>
                            <s:else>
                                <s:set var="type" value="2"/>
                            </s:else>
                            <tr>
                                <td><s:date name="date" format="dd" /> Aout</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:if test="#evenement.lienProgramme != null && #evenement.lienProgramme != ''"><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="<s:url value='%{#evenement.lienProgramme}'/>"><i class="icon-file"></i></a></s:if>
                                    <s:if test="#session.logined == 'true' || (#type == 0 && #evenement.date < #aujourdhuiVar)"><a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="<s:url value='ResultatsCompetition.action?idCompetition=%{#evenement.id}'/>"><i class="icon-star-empty"></i></a></s:if>
                                    <s:if test="#evenement.album != null"><a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='AlbumPhoto.action?idAlbum=%{album.id}&nomAlbum=%{album.nom}'/>"><i class="icon-camera"></i></a></s:if>
                                    <s:elseif test="#session.logined == 'true'"><a rel="tooltip" data-placement="right" onclick="showNewAlbum(<s:property value='id'/>)" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></s:elseif></td>
                                        <s:if test="#session.logined == 'true'">
                                    <td><button onclick="showDeleteEvenement(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEvenement(<s:property value='id'/>,<s:property value='#type'/>, 8)' class="btn btn-primary">Modifier</button>
                                    </td>
                                </s:if>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </div>
        </div>

        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">

                                            $(document).ready(function() {
                                                $('#dp3').datepicker().on('changeDate', function(ev) {
                                                    checkDateFormat('inputDate');
                                                    $('#dp3').datepicker('hide');
                                                });
                                                $('#dp4').datepicker().on('changeDate', function(ev) {
                                                    checkDateFormat('inputModifDate');
                                                    $('#dp4').datepicker('hide');
                                                });

                                                $('#dp3').datepicker({
                                                    weekStart: 1,
                                                    language: "fr"
                                                });
                                                $('#dp4').datepicker({
                                                    weekStart: 1,
                                                    language: "fr"
                                                });
                                                $(".cal").addClass("active");
                                                $(function() {
                                                    $('a').tooltip();
                                                });
                                            });

                                            var mois = ['janvier', 'fevrier', 'mars', 'avril', 'mai', 'juin', 'juillet', 'aout', 'septembre', 'octobre', 'novembre', 'decembre'];

                                            var error = false;
                                            function checkDateFormat(id) {
                                                var date = $("#" + id).val();
                                                if (!date.match(/^(0?[1-9]|[12][0-9]|3[01])[/](0?[1-9]|1[012])[/](19|20)[0-9][0-9]/)) {
                                                    $('#control' + id).addClass('error');
                                                    //$('#formCompet').removeClass('span6');
                                                    //$('#formCompet').addClass('span10');
                                                    if (!error) {
                                                        $(id).after("<span id='helpDateFormat' class='help-inline'>Attention ! La doit doit être de type jj/mm/aaaa </span>");
                                                        error = true;
                                                    }
                                                    if (id == "inputDate") {
                                                        $('#submitNewEvenement').attr('disabled', true);
                                                    } else {
                                                        $('#submitModifEvenement').attr('disabled', true);
                                                    }
                                                } else {
                                                    if (error) {
                                                        $('#controlDate').removeClass('error');
                                                        $('#helpDateFormat').remove();
                                                        //$('#formCompet').removeClass('span10');
                                                        //$('#formCompet').addClass('span6');
                                                    }
                                                    error = false;
                                                    if (id == "inputDate") {
                                                        $('#submitNewEvenement').removeAttr('disabled');
                                                    } else {
                                                        $('#submitModifEvenement').removeAttr('disabled');
                                                    }
                                                }
                                            }

                                            function showDeleteEvenement(index) {
                                                $("#idEvenement").attr("value", index);
                                                $("#deleteEvenement").modal();
                                            }

                                            function showNewAlbum(index) {
                                                $("#idAlbumEvenement").attr("value", index);
                                                $("#newAlbum").modal();
                                            }

                                            function showModifEvenement(index, type, numMois) {
                                                $("#idEvenementModif").attr("value", index);
                                                if (type == 0) {
                                                    request = $.ajax({
                                                        url: "FindCompetition",
                                                        type: "post",
                                                        data: {data: index},
                                                        success: function(data) {
                                                            var obj = jQuery.parseJSON(data);
                                                            if (obj['codePostal'] != 'null')
                                                                $("#inputModifCodePostalEvenement").val(obj['codePostal']);
                                                            if (obj['niveau'] != 'null')
                                                                $("#inputModifNiveau").val(obj['niveau']);
                                                            if (obj['nom'] != 'null')
                                                                $("#inputModifNomEvenement").val(obj['nom']);
                                                            if (obj['nomVoie'] != 'null')
                                                                $("#inputModifNomRueEvenement").val(obj['nomVoie']);
                                                            if (obj['numVoie'] != 'null')
                                                                $("#inputModifNumRueEvenement").val(obj['numVoie']);
                                                            if (obj['pays'] != 'null')
                                                                $("#inputModifPaysEvenement").val(obj['pays']);
                                                            if (obj['ville'] != 'null')
                                                                $("#inputModifVilleEvenement").val(obj['ville']);
                                                            if (obj['photo'] != 'null')
                                                                $("#inputModifFile").val(obj['photo']);
                                                            if (obj['programme'] != 'null')
                                                                $("#inputModifProgrammeEvenement").val(obj['programme']);
                                                            if (obj['date'] != 'null')
                                                                $("#inputModifDate").val(obj['date']);
                                                        }
                                                    });
                                                    $("#modifEvenement").modal();
                                                } else {
                                                    alert('stage ou sortie pas encore fait');
                                                }
                                            }
        </script>
    </body>
</html>