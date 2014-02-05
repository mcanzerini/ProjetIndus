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
        <link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
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
                    <h3>Plusieurs Compétiteurs correspondent à votre recherche</h3>
                </div>

                <blockquote class="span9">
                    <p>« La diff&eacute;rence fondamentale entre l'homme ordinaire et le guerrier, c'est que le guerrier consid&egrave;re toute chose comme un d&eacute;fi,
                        tandis que l'homme ordinaire voit en toute chose soit une b&eacute;n&eacute;diction, soit une mal&eacute;diction. »</p>
                    <small>Jean-Baptiste Poquelin <cite title="Source Title">dit Moli&egrave;re</cite></small>
                </blockquote>
            </div>
            <div class="span11"></div>
            <div id="containeurResultats" class="container">
                <s:set name="resultat" value="resultatString"/>
                <s:iterator value="licencies" status="resultatsStatus">
                    <s:if test="#resultatsStatus.index % 2 == 0">
                        <ul class="thumbnails">
                            <li class="span1"></li>
                            </s:if>
                        <li class="span4">
                            <a href="<s:url value='resources/img/%{photo}'/>" class="thumbnail fancybox">
                                <img src="<s:url value='resources/img/%{photo}'/>" alt="">
                            </a>
                            <div class="caption">
                                <h3><s:property value="nom"/> <s:property value="prenom"/></h3>
                                <p><s:form method="POST" action="ResultatsCompetiteur" >
                                        <input type="hidden" value="<s:property value='nom'/>" name="nom"/>
                                        <input type="hidden" value="<s:property value='prenom'/>" name="prenom"/>
                                        <input type="hidden" value="<s:property value='#resultat'/>" name="resultat"/>
                                        <input type="submit" value="Choisir" class="btn btn-primary"/>
                                    </s:form></p>
                            </div>
                        </li>
                        <s:if test="#resultatsStatus.count % 2 == 0">
                        </ul>
                    </s:if>
                    <s:else>
                        <li class="span2"></li>
                        </s:else>

                </s:iterator>
            </div>
        </div>


        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script type="text/javascript">
            $(".res").addClass("active");
            $(function() {
                $('a').tooltip();
            });

            $(".fancybox")
                    .attr('rel', 'gallery')
                    .fancybox({
                        beforeShow: function() {
                            /* Disable right click */
                            $.fancybox.wrap.bind("contextmenu", function(e) {
                                return false;
                            });
                        }
                    });
        </script>
    </body>
</html>