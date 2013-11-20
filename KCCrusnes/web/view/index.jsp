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
            <!-- Modal -->

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <div class="page-header">
                    <h1>Accueil</h1>
                </div>

                <div class = "span7">


                    <div id="introCarousel" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active"> <img alt="" src="resources/img/carousel/1.jpg"/>
                                <div class="carousel-caption">
                                    <p> blabli kbkzdj jhvze dhjv </p>
                                </div>
                            </div>
                            <div class="item"> <img alt="" src="resources/img/carousel/2.jpg"/>
                                <div class="carousel-caption">
                                    <p> L'actu Karat&eacute; </p>
                                </div>
                            </div>
                            <div class="item"> <img alt="" src="resources/img/carousel/3.jpg"/>
                                <div class="carousel-caption">
                                    <p> La galerie photo du Barbec' </p>
                                </div>
                            </div>
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
                            <a href="histoire.jsp" class="btn btn-primary btn-large">
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
                    <h3>Informations</h3>
                    
                    <s:iterator value="informations">
                        <div class="well">
                            <s:property escape="false" value="type"/> :
                            <s:property escape="false" value="content"/>
                        </div>
                    </s:iterator>

                </s:if>
            </div>

            <div class="span11"></div>
            <div class="span2"></div>
            <div class="span8">
                <ul class="thumbnails">
                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/2.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                        </div>
                    </li>
                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/3.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                        </div>

                    </li>

                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/1.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(".index").addClass("active");
            $(function() {
                $('a').tooltip();
            });
        </script>

    </body>

</html>