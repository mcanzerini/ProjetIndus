<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Bootstrap 101 Template</title>
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
                    <li class="previous disabled">
                        <a href="#">&larr; Albums plus R&eacute;cents</a>
                    </li>
                    <li class="next">
                        <a href="#">Albums plus Anciens &rarr;</a>
                    </li>
                </ul>
            </div>
            <div class="span11"></div>
            <div id="containeurPhotos" class="container">
                <s:iterator value="albums" status="albumsStatus">
                    <s:if test="#albumsStatus.index % 3 == 0">
                        <div class="row">
                            <ul class="thumbnails">
                            </s:if>
                            <li class="span4">
                                <a href="albumPhoto.jsp" class="thumbnail">
                                    <img src="<s:url value='resources/img/%{evenement.photoPrincipale}'/>" data-src="holder.js/300x200" alt="">
                                </a>
                                <div class="caption">
                                    <h3><s:property value="evenement.nom"/></h3>

                                    <a href="albumPhoto.jsp" class="btn btn-primary">Voir l'Album</a>
                                </div>
                            </li>
                            <s:if test="#albumsStatus.count % 3 == 0">
                            </ul>
                        </div>
                    </s:if>

                </s:iterator>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="#" class="thumbnail">
                                <img src="resources/img/2.jpg" data-src="holder.js/300x200" alt="">
                            </a>
                            <div class="caption">
                                <h3>Lorraine 11/12</h3>

                                <a href="albumPhoto.jsp" class="btn btn-primary">Voir l'Album</a>
                            </div>
                        </li>
                        <li class="span4">
                            <a href="#" class="thumbnail">
                                <img src="resources/img/3.jpg" data-src="holder.js/300x200" alt="">
                            </a>
                            <div class="caption">
                                <h3>D&eacute;partementales 11/12</h3>

                                <a href="albumPhoto.jsp" class="btn btn-primary">Voir l'Album</a>
                            </div>

                        </li>
                        <li class="span4">
                            <a href="#" class="thumbnail">
                                <img src="resources/img/3.jpg" data-src="holder.js/300x200" alt="">
                            </a>
                            <div class="caption">
                                <h3>D&eacute;partementales 11/12</h3>

                                <a href="albumPhoto.jsp" class="btn btn-primary">Voir l'Album</a>
                            </div>

                        </li>

                    </ul>
                </div>

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
        </script>
    </body>
</html>