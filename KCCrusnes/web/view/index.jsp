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

        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">


            <!-- Modal -->
            <div id="newInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="connexion.jsp" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Nouvelle information</h3>
                    </div>
                    <form id="newInfoForm" action="NewInfo" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputPriorite">Priorite</label>
                                <div class="controls">
                                    <input type="radio" value="1" name="priorite" form="newInfoForm"/> Information<br>
                                    <input type="radio" value="2" name="priorite" form="newInfoForm"/> Attention<br>
                                    <input type="radio" value="3" checked name="priorite" form="newInfoForm"/> Défaut
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Contenu</label>
                                <div class="controls">
                                    <textarea name="contenu" id="inputContenu" placeholder="Écrire ici le contenu de l'information"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="modifInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="connexion.jsp" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edition information</h3>
                    </div>
                    <form id="modifInfoForm" action="ModifInfo" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idInfo" value="">

                            <!--                            <div class="control-group">
                                                            <label class="control-label" for="inputPriorite">Priorite</label>
                                                            <div class="controls">
                                                                <input type="radio" value="1" name="priorite" form="modifInfoForm"/> Information<br>
                                                                <input type="radio" value="2" name="priorite" form="modifInfoForm"/> Attention<br>
                                                                <input type="radio" value="3" name="priorite" checked form="modifInfoForm"/> Défaut
                                                            </div>
                                                        </div>-->
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Contenu</label>
                                <div class="controls">
                                    <textarea name="contenu" id="inputContenu"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="deleteInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="connexion.jsp" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Suppression d'information</h3>
                    </div>
                    <form id="deleteInfoForm" action="DeleteInfo" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idInfo" value="">
                            <p>Vous êtes sur le point de supprimer définitivement une information</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <!-- Modal fin -->



            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <div class="page-header">
                    <h1>Accueil</h1>
                </div>

                <div class = "span7">
                    <div id="introCarousel" class="carousel slide">
                        <div class="carousel-inner">
                            <s:iterator value="actualites" var="object" status="actuStatus">
                                <s:if test="#actuStatus.count <= 3">
                                    <s:if test="%{ #object instanceof model.Album }">
                                        <s:set name="photo1" value="%{#object.photos[0]}"/>
                                        <s:set name="event" value="%{#object.evenement}"/>
                                        <s:if test="#event != null" >
                                            <s:set name="src" value="evenement.photoPrincipale"/>
                                        </s:if>
                                        <s:elseif test="#photo1.lien != null">
                                            <s:set name="src" value="'albums/'+id+'/'+#photo1.lien"/>
                                        </s:elseif>
                                        <s:else>
                                            <s:set name="src" value="'defaut_evenement.jpg'"/>
                                        </s:else>
                                        <div class="item"> <img alt="" src="<s:url value='resources/img/%{src}'/>"/>
                                            <div class="carousel-caption">
                                                <p> Album : <s:property value="#object.nom"/> </p>
                                            </div>
                                        </div>
                                    </s:if>
                                    <s:elseif test="%{ #object instanceof model.Competition }">
                                        <div class="item"> <img alt="" src="<s:url value='resources/img/%{#object.photoPrincipale}'/>"/>
                                            <div class="carousel-caption">
                                                <p> <s:property value="#object.nom"/> </p>
                                            </div>
                                        </div>
                                    </s:elseif>
                                </s:if>
                            </s:iterator>
                        </div>
                        <a class="carousel-control left" data-slide="prev" href="#introCarousel">&lsaquo;</a>
                        <a class="carousel-control right" data-slide="next" href="#introCarousel">&rsaquo;</a>
                    </div>
                </div>
                <div class = "span1"> </div>
                <div class = "span4"> <div id="Desc" class="hero-unit">
                        <h3>Karat&eacute; Club Crusnes</h3>
                        <p>Bienvenue sur le site du Karate Club de Crusnes cr&eacute;&eacute; en 1985</p>
                        <p>
                            <a href="HistoireClub" class="btn btn-primary btn-large">
                                Plus d'infos
                            </a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="span11"></div>
            <div class="span2"></div>

            <div class="span7">
                <s:set name="webInformations" value="informations"/>
                <s:if test="%{#webInformations!=null}">
                    <h3>Informations &nbsp;&nbsp;&nbsp;&nbsp;<s:if test="#session.logined == 'true'"><button data-toggle="modal" data-target="#newInfo" class="btn btn-primary">Ajouter une info</button></s:if></h3>

                    <s:iterator value="informations" var="object" status="infoStatus">
                        <div class="well">
                            <s:property escape="false" value="type"/> :
                            <text class="contenuInfo"><s:property escape="false" value="content"/></text>
                            <s:if test="#session.logined == 'true'">
                                <button onclick="showDeleteInfo(<s:property value='numero'/>)" class="btn btn-danger pull-right">Supprimer</button>
                                <button onclick='showModifInfo(<s:property value='numero'/>,<s:property value='#infoStatus.index'/>)' class="btn btn-primary pull-right">Modifier</button>
                            </s:if>
                        </div>
                    </s:iterator>

                </s:if>
            </div>

            <div class="span11"></div>
            <div class="span2"></div>
            <div class="span8">
                <s:iterator value="actualites" var="object" status="actuStatus2">
                    <s:if test="#actuStatus2.index % 3 == 0">
                        <ul class="thumbnails">
                        </s:if>
                        <s:if test="%{ #object instanceof model.Album }">
                            <s:set name="photo1" value="%{#object.photos[0]}"/>
                            <s:set name="event" value="%{#object.evenement}"/>
                            <s:if test="#event != null" >
                                <s:set name="src" value="evenement.photoPrincipale"/>
                            </s:if>
                            <s:elseif test="#photo1.lien != null">
                                <s:set name="src" value="'albums/'+id+'/'+#photo1.lien"/>
                            </s:elseif>
                            <s:else>
                                <s:set name="src" value="'defaut_evenement.jpg'"/>
                            </s:else>
                            <li class="span4">
                                <a href="<s:url value='AlbumPhoto?idAlbum=%{#object.id}&nomAlbum=%{#object.nom}'/>" class="thumbnail">
                                    <img src="<s:url value='resources/img/%{src}'/>" data-src="holder.js/300x200" alt="">
                                </a>
                                <div class="caption">
                                    <span class="badge badge-inverse"><s:date name="#object.dateAjout" format="dd/MM/yyyy" /></span>
                                    <h4>Album photos : <s:property value="#object.nom"/></h4>
                                    <p><a href="<s:url value='AlbumPhoto?idAlbum=%{#object.id}&nomAlbum=%{#object.nom}'/>" class="btn btn-primary">Voir les photos</a></p>
                                </div>
                            </li>
                        </s:if>
                        <s:elseif test="%{ #object instanceof model.Competition }">
                            <li class="span4">
                                <a href="<s:url action='ResultatsCompetition.action'><s:param name='idCompetition'><s:property value='#object.id'/></s:param></s:url>" class="thumbnail">
                                    <img src="<s:url value='resources/img/%{#object.photoPrincipale}'/>" data-src="holder.js/300x200" alt="">
                                </a>
                                <div class="caption">
                                    <span class="badge badge-inverse"><s:date name="#object.date" format="dd/MM/yyyy" /></span>
                                    <h4><s:property value="#object.nom"/></h4>
                                    <p><s:property value="#object.commentaires"/></p>
                                    <p><a href="<s:url action='ResultatsCompetition.action'><s:param name='idCompetition'><s:property value='#objectid'/></s:param></s:url>" class="btn btn-primary">Voir les Résutats</a></p>
                                        </div>
                                    </li>
                        </s:elseif>
                        <s:if test="#actuStatus2.count % 3 == 0">
                        </ul>
                    </s:if>
                </s:iterator>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
                                    $(".index").addClass("active");
                                    $(".carousel-inner").children().first().addClass("active");
                                    function showDeleteInfo(index) {
                                        $("#idInfo").attr("value", index);
                                        $("#deleteInfo").modal();
                                    }
                                    function showModifInfo(index, indexStatus) {
                                        $("#idInfo").attr("value", index);
                                        $("textarea").text($('.contenuInfo').eq(indexStatus).text());
                                        $("#modifInfo").modal();
                                    }
                                    $(function() {
                                        $('a').tooltip();
                                    });
        </script>

    </body>

</html>