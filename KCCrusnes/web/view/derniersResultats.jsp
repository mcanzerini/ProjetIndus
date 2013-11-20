<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


            <div class="span9">
                <div class="page-header">
                    <h1>R&eacute;sultats</h1>
                </div>

                <blockquote class="span9">
                    <p>Â« La diff&eacute;rence fondamentale entre l'homme ordinaire et le guerrier, c'est que le guerrier consid&egrave;re toute chose comme un d&eacute;fi, 
                        tandis que l'homme ordinaire voit en toute chose soit une b&eacute;n&eacute;diction, soit une mal&eacute;diction. Â»</p>
                    <small>Jean-Baptiste Poquelin <cite title="Source Title">dit Moli&egrave;re</cite></small>
                </blockquote>
            </div>
            <div class="span11"></div>
            <div id="containeurResultats" class="container">
                <ul class="thumbnails">
                    <li class="span4">
                        <a href="resultatCompetition.jsp" class="thumbnail">
                            <img src="resources/img/emma.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Lorraine 12/13</h3>
                            <p>Pluie de medailles a ces chamipnnats de lorraine</p>
                            <p><a href="resultatCompetition.jsp" class="btn btn-primary">Les R&eacute;sultats</a>
                        </div>
                    </li>
                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/myl.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>France Corpo 12/13</h3>
                            <p>Des combats epiques</p>
                            <p><a href="#" class="btn btn-primary">Les R&eacute;sultats</a>
                        </div>

                    </li>

                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/jo.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Premier League Frankfurt</h3>
                            <p>Le beau parcours de Jonathan</p>
                            <p><a href="#" class="btn btn-primary">Les R&eacute;sultats</a> 
                        </div>
                    </li>
                </ul>

                <ul class="thumbnails">
                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/2.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>Lorraine 11/12</h3>
                            <p>Pluie de medailles a ces chamipnnats de lorraine</p>
                            <p><a href="#" class="btn btn-primary">Les R&eacute;sultats</a>
                        </div>
                    </li>
                    <li class="span4">
                        <a href="#" class="thumbnail">
                            <img src="resources/img/3.jpg" data-src="holder.js/300x200" alt="">
                        </a>
                        <div class="caption">
                            <h3>D&eacute;partementales 11/12</h3>
                            <p>40 podiums !</p>
                            <p><a href="#" class="btn btn-primary">Les R&eacute;sultats</a>
                        </div>

                    </li>
                    <li class="span3"></li>

                </ul>
            </div>
        </div>


    <jsp:include page="includes/footer.jsp"/>  
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(".res").addClass("active");
        $(function() {
            $('a').tooltip();
        });
    </script>
</body>
</html>  	