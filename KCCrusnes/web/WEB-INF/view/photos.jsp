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
        <jsp:include page="includes/loading.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
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
                        <h3>Nouvel Album indépendant</h3>
                    </div>
                    <form id="newAlbumForm" action="NewAlbumInde" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputNom">Nom</label>
                                <div class="controls">
                                    <input type="text" name="nom" id="inputNom" placeholder="Nom de l'album"/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="newAlbumForm" value="Confirmer" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>

            <div id="deleteAlbum" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>Non Connecté(e)</h3>
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
                        <h3 id="myModalLabel">Suppression d'album</h3>
                    </div>
                    <form id="deleteAlbumForm" action="DeleteAlbumInde" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idAlbumDelete" value="">
                            <p>Vous êtes sur le point de supprimer définitivement un album</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="deleteAlbumForm" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="modifAlbum" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Edition album</h3>
                    </div>
                    <form id="modifAlbumForm" action="ModifAlbum" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idAlbum" value="">
                            <div class="control-group">
                                <label class="control-label" for="inputModifNom">Nom</label>
                                <div class="controls">
                                    <input type="text" name="nom" id="inputModifNom"/>
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
            <!-- Fin modal-->

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span7">
                <div class="page-header">
                    <h1>Photos</h1>
                </div>


                <blockquote class="">
                    <p>
                        « Une photographie, c'est un fragment de temps qui ne reviendra pas. »</p>
                    <small><cite title="Source Title">Martine Franck</cite></small>
                </blockquote>
                <ul class="pager">
                    <s:set name="pageNumberVar" value="pageNumber"/>
                    <li id="previous" class="previous">
                        <a id="lienPrevious">&larr; Albums plus R&eacute;cents</a>
                    </li>
                    <s:set name="size" value="albums.size"/>
                    <s:set name="nbAlbums" value="nbAlbums"/>
                    <li id="next" class="next">
                        <a id="lienNext" >Albums plus Anciens &rarr;</a>
                    </li>
                </ul>
            </div>
            <div class="row"></div>
            <s:if test="#session.logined == 'true'">
                <div class="row">
                    <div class="span3"></div><button data-toggle="modal" data-target="#newAlbum" class="btn btn-primary">Ajouter un album indépendant</button>
                </div>
                <br>
            </s:if>
            <div id="containeurPhotos" class="container">
                <s:iterator value="albums" status="albumsStatus">
                    <s:if test="#albumsStatus.index % 3 == 0 && (#size <= #nbAlbums || #albumsStatus.index + 1 < #size)">
                        <div class="row" >
                            <ul class="thumbnails">
                            </s:if>
                            <s:if test="#size <= #nbAlbums || #albumsStatus.index + 1 < #size">
                                <s:set name="photo1" value="%{photos[0]}"/>
                                <s:set name="event" value="%{evenement}"/>
                                <s:if test="#photo1.lien != null">
                                    <s:set name="src" value="'albums/'+id+'/'+#photo1.lien"/>
                                </s:if>
                                <s:elseif test="#event != null">
                                    <s:set name="src" value="'evenement/'+evenement.photoPrincipale"/>
                                </s:elseif>
                                <s:else>
                                    <s:set name="src" value="'defaut_album.jpg'"/>
                                </s:else>
                                <li class="span4" >
                                    <a style="max-height:200px;overflow:hidden;" href="<s:url value='AlbumPhoto?idAlbum=%{id}'/>" class="thumbnail">
                                        <img style="width:100%;min-height:200px;" src="<s:url value='resources/img/%{src}'/>" alt="">
                                    </a>
                                    <div class="caption">
                                        <s:set name="nom" value="%{nom}"/>
                                        <s:if test="#nom != null">
                                            <h3 class="nomAlbum"><s:property value="nom"/></h3>
                                        </s:if>
                                        <s:else>
                                            <h3><s:property value="evenement.nom"/></h3>
                                        </s:else>

                                        <a href="<s:url value='AlbumPhoto?idAlbum=%{id}'/>" class="btn btn-primary">Voir l'Album</a>
                                        <s:if test="#session.logined == 'true'"><button onclick="deleteModal(<s:property value="id"/>)" class="btn btn-danger">Supprimer</button>
                                            <button onclick="modifModal(<s:property value="id"/>,<s:property value="#albumsStatus.index"/>)" class="btn btn-primary">Modifier</button></s:if>
                                        </div>
                                    </li>
                            </s:if>
                            <s:if test="#albumsStatus.count % 3 == 0">
                            </ul>
                        </div>
                    </s:if>

                </s:iterator>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
                                                $(".multi").addClass("active");
                                                $(function() {
                                                    $('a').tooltip();
                                                });
                                                var pageNumber = <s:property value="#pageNumberVar" escapeXml="true"/>;
                                                var nbAlbums = <s:property value="#nbAlbums" escapeXml="true"/>;
                                                var size = <s:property value="#size" escapeXml="true"/>;
                                                var first = true;
                                                if (size > nbAlbums) {
                                                    if ($('#next').hasClass("disabled") || first) {
                                                        $('#next').removeClass("disabled");
                                                        $('#next').on('click', '#lienNext', getNextAlbums);
                                                    }
                                                } else {
                                                    $('#next').addClass("disabled");
                                                    $('#next').off('click', '#lienNext');
                                                }
                                                if (pageNumber > 1) {
                                                    if ($('#previous').hasClass("disabled") || first) {
                                                        $('#previous').removeClass("disabled");
                                                        $('#previous').on('click', '#lienPrevious', getPreviousAlbums);
                                                    }
                                                } else {
                                                    $('#previous').addClass("disabled");
                                                    $('#previous').off('click', '#lienPrevious');
                                                }
                                                first = false;
                                                function getPreviousAlbums() {
                                                    pageNumber = pageNumber - 1;
                                                    $('#loadModal').modal('show');
                                                    request = $.ajax({
                                                        url: "Albums",
                                                        type: "post",
                                                        data: {pageNumber: pageNumber, nbAlbums: nbAlbums},
                                                        success: function(data) {
                                                            $('#barAlbum').css({width: "40%"});
                                                            var height = $('#containeurPhotos').height();
                                                            $('#containeurPhotos').children().remove();
                                                            var ligne = 0;
                                                            $('#barAlbum').css({width: "50%"});
                                                            for (var i = 0; i < data.albums.length; i++) {
                                                                if (i % 3 === 0 && i + 1 <= nbAlbums) {
                                                                    ligne++;
                                                                    $('#containeurPhotos').append("<div class='row'><ul id='id" + ligne + "' class = 'thumbnails' >");
                                                                }
                                                                if (i + 1 <= nbAlbums) {
                                                                    var image;
                                                                    if (typeof data.albums[i].evenement !== 'undefined' && data.albums[i].evenement !== null) {
                                                                        image = "evenements/" + data.albums[i].evenement.photoPrincipale;
                                                                    } else if (typeof data.albums[i].photos[0] !== 'undefined' && data.albums[i].photos[0] !== null) {
                                                                        image = "albums/" + data.albums[i].id + "/" + data.albums[i].photos[0].lien;
                                                                    } else {
                                                                        image = "defaut_album.jpg";
                                                                    }
                                                                    $('#id' + ligne).append("<li class = 'span4'><a href = \"AlbumPhoto?idAlbum=" + data.albums[i].id + "'\" class = 'thumbnail' ><img src = \"resources/img/" + image + "\" data - src = 'holder.js/300x200' alt = '' ></a><div class = 'caption' ><h3 class='nomAlbum'>" + data.albums[i].nom + "</h3><a href = 'AlbumPhoto?idAlbum=" + data.albums[i].id + "' class = 'btn btn-primary' > Voir l\'Album</a>" +
                                                                            "<s:if test="#session.logined == 'true'"><button onclick=\"deleteModal(" + data.albums[i].id + ")\" class=\"btn btn-danger\">Supprimer</button>" +
                                                                            "<button onclick=\"modifModal(" + data.albums[i].id + "," + i + ")\" class=\"btn btn-primary\">Modifier</button></s:if></div></li>");
                                                                }
                                                                if (i + 1 % 3 === 0) {
                                                                    $('#containeurPhotos').append("</ul></div>");
                                                                }
                                                            }
                                                            $('#barAlbum').css({width: "80%"});
                                                            if (pageNumber === 1) {
                                                                $('#previous').addClass("disabled");
                                                                $('#previous').off('click', '#lienPrevious');
                                                            }
                                                            $('#barAlbum').css({width: "90%"});
                                                            if ($('#next').hasClass("disabled")) {
                                                                $('#next').removeClass("disabled");
                                                                $('#next').on('click', '#lienNext', getNextAlbums);
                                                            }
                                                            $('#barAlbum').css({width: "100%"});
                                                            $('#loadModal').modal('hide');
                                                        }
                                                    });
                                                }
                                                function getNextAlbums() {
                                                    pageNumber = pageNumber + 1;
                                                    $('#loadModal').modal('show');
                                                    //$('#containeurPhotos')
                                                    request = $.ajax({
                                                        url: "Albums",
                                                        type: "post",
                                                        data: {pageNumber: pageNumber, nbAlbums: nbAlbums},
                                                        success: function(data) {
                                                            $('#barAlbum').css({width: "40%"});
                                                            var height = $('#containeurPhotos').height();
                                                            $('#containeurPhotos').children().remove();
                                                            var ligne = 0;
                                                            $('#barAlbum').css({width: "50%"});
                                                            for (var i = 0; i < data.albums.length; i++) {
                                                                if (i % 3 === 0 && i + 1 <= nbAlbums) {
                                                                    ligne++;
                                                                    $('#containeurPhotos').append("<div class='row'><ul id='id" + ligne + "' class = 'thumbnails' >");
                                                                }
                                                                if (i + 1 <= nbAlbums) {
                                                                    var image;
                                                                    if (typeof data.albums[i].evenement !== 'undefined' && data.albums[i].evenement !== null) {
                                                                        image = "albums/" + data.albums[i].evenement.photoPrincipale;
                                                                    } else if (typeof data.albums[i].photos[0] !== 'undefined' && data.albums[i].photos[0] !== null) {
                                                                        image = "albums/" + data.albums[i].id + "/" + data.albums[i].photos[0].lien;
                                                                    } else {
                                                                        image = "albums/defaut_album.jpg";
                                                                    }
                                                                    $('#id' + ligne).append("<li class = 'span4'><a href = \"AlbumPhoto?idAlbum=" + data.albums[i].id + "'\" class = 'thumbnail' ><img src = \"resources/img/" + image + "\" data - src = 'holder.js/300x200' alt = '' ></a><div class = 'caption' ><h3 class='nomAlbum'>" + data.albums[i].nom + "</h3><a href = 'AlbumPhoto?idAlbum=" + data.albums[i].id + "' class = 'btn btn-primary' > Voir l\'Album</a>" +
                                                                            "<s:if test="#session.logined == 'true'"><button onclick=\"deleteModal(" + data.albums[i].id + ")\" class=\"btn btn-danger\">Supprimer</button>" +
                                                                            "<button onclick=\"modifModal(" + data.albums[i].id + "," + i + ")\" class=\"btn btn-primary\">Modifier</button></s:if></div></li>");
                                                                }
                                                                if (i + 1 % 3 === 0) {
                                                                    $('#containeurPhotos').append("</ul></div>");
                                                                }
                                                            }
                                                            $('#barAlbum').css({width: "80%"});
                                                            if (data.albums.length <= nbAlbums) {
                                                                $('#next').addClass("disabled");
                                                                $('#next').off('click', '#lienNext');
                                                            }
                                                            $('#barAlbum').css({width: "90%"});
                                                            if ($('#previous').hasClass("disabled")) {
                                                                $('#previous').removeClass("disabled");
                                                                $('#previous').on('click', '#lienPrevious', getPreviousAlbums);
                                                            }
                                                            $('#barAlbum').css({width: "100%"});
                                                            $('#loadModal').modal('hide');
                                                        }
                                                    });
                                                }

                                                function deleteModal(index) {
                                                    $("#idAlbumDelete").attr("value", index);
                                                    $("#deleteAlbum").modal();
                                                }

                                                function modifModal(index, indexStatus) {
                                                    $("#idAlbum").attr("value", index);
                                                    $("#inputModifNom").val($('.nomAlbum').eq(indexStatus).text());
                                                    $("#modifAlbum").modal();
                                                }


        </script>
    </body>
</html>