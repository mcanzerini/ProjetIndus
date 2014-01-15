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
            <div class="span11"></div>
            <div id="containeurPhotos" class="container">
                <s:iterator value="albums" status="albumsStatus">
                    <s:if test="#albumsStatus.index % 3 == 0 && (#size <= #nbAlbums || #albumsStatus.index + 1 < #size)">
                        <div class="row">
                            <ul class="thumbnails">
                            </s:if>
                            <s:if test="#size <= #nbAlbums || #albumsStatus.index + 1 < #size">
                                <s:set name="photo1" value="%{photos[0]}"/>
                                <s:set name="event" value="%{evenement}"/>
                                <s:if test="#photo1.lien != null">
                                    <s:set name="src" value="'albums/'+id+'/'+#photo1.lien"/>
                                </s:if>
                                <s:elseif test="#event != null">
                                    <s:set name="src" value="evenement.photoPrincipale"/>
                                </s:elseif>
                                <s:else>
                                    <s:set name="src" value="'defaut_evenement.jpg'"/>
                                </s:else>
                                <li class="span4">
                                    <a href="<s:url value='AlbumPhoto?idAlbum=%{id}&nomAlbum=%{nom}'/>" class="thumbnail">
                                        <img src="<s:url value='resources/img/%{src}'/>" data-src="holder.js/300x200" alt="">
                                    </a>
                                    <div class="caption">
                                        <s:set name="nom" value="%{nom}"/>
                                        <s:if test="#nom != null">
                                            <h3><s:property value="nom"/></h3>
                                        </s:if>
                                        <s:else>
                                            <h3><s:property value="evenement.nom"/></h3>
                                        </s:else>

                                        <a href="<s:url value='AlbumPhoto?idAlbum=%{id}&nomAlbum=%{nom}'/>" class="btn btn-primary">Voir l'Album</a>
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

            if (size > nbAlbums) {
                $('#next').removeClass("disabled");
                $('#next').on('click', '#lienNext', getNextAlbums);
            } else {
                $('#next').addClass("disabled");
                $('#next').off('click', '#lienNext');
            }
            if (pageNumber > 1) {
                $('#previous').removeClass("disabled");
                $('#previous').on('click', '#lienPrevious', getPreviousAlbums);
            } else {
                $('#previous').addClass("disabled");
                $('#previous').off('click', '#lienPrevious');
            }
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
                                    image = data.albums[i].evenement.photoPrincipale;
                                } else if (typeof data.albums[i].photos[0] !== 'undefined' && data.albums[i].photos[0] !== null) {
                                    image = "albums/" + data.albums[i].id + "/" + data.albums[i].photos[0].lien;
                                } else {
                                    image = "";
                                }
                                $('#id' + ligne).append("<li class = 'span4'><a href = \"AlbumPhoto?idAlbum=" + data.albums[i].id + "&nomAlbum=" + data.albums[i].nom + "'\" class = 'thumbnail' ><img src = \"resources/img/" + image + "\" data - src = 'holder.js/300x200' alt = '' ></a><div class = 'caption' ><h3>" + data.albums[i].nom + "</h3><a href = 'AlbumPhoto' class = 'btn btn-primary' > Voir l\'Album</a></div></li>");
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
                        $('#next').removeClass("disabled");
                        $('#next').on('click', '#lienNext', getNextAlbums);
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
                            if (i % 3 === 0) {
                                ligne++;
                                $('#containeurPhotos').append("<div class='row'><ul id='id" + ligne + "' class = 'thumbnails' >");
                            }
                            if (data.albums.length <= nbAlbums || i + 1 < nbAlbums) {
                                var image;
                                if (typeof data.albums[i].evenement !== 'undefined' && data.albums[i].evenement !== null) {
                                    image = data.albums[i].evenement.nom;
                                } else if (typeof data.albums[i].photos[0] !== 'undefined' && data.albums[i].photos[0] !== null) {
                                    image = "albums/" + data.albums[i].id + "/" + data.albums[i].photos[0].lien;
                                } else {
                                    image = "defaut_evenement.jpg";
                                }
                                $('#id' + ligne).append("<li class = 'span4'><a href = \"AlbumPhoto?idAlbum=" + data.albums[i].id + "&nomAlbum=" + data.albums[i].nom + "'\" class = 'thumbnail' ><img src = \"resources/img/" + image + "\" data - src = 'holder.js/300x200' alt = '' ></a><div class = 'caption' ><h3>" + data.albums[i].nom + "</h3><a href = 'AlbumPhoto' class = 'btn btn-primary' > Voir l\'Album</a></div></li>");
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
                        $('#previous').removeClass("disabled");
                        $('#previous').on('click', '#lienPrevious', getPreviousAlbums);
                        $('#barAlbum').css({width: "100%"});
                        $('#loadModal').modal('hide');
                    }
                });
            }
        </script>
    </body>
</html>