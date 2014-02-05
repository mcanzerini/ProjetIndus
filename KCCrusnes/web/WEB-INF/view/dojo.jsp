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
        <link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />

        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Le Dojo</h1>
                </div>
            </div>

            <div  class="span2"></div>

            <div id="contenuPresentation" class="span7">

                <div class="span12">
                    <ul class="thumbnails">
                        <li class="span3">
                            <a href="<s:url value='resources/img/%{dojo.photo1}'/>" class="fancybox thumbnail">
                                <img src="<s:url value='resources/img/%{dojo.photo1}'/>" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span3">
                            <a href="<s:url value='resources/img/%{dojo.photo2}'/>" class="fancybox thumbnail">
                                <img src="<s:url value='resources/img/%{dojo.photo2}'/>" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span3">
                            <a href="<s:url value='resources/img/%{dojo.photo3}'/>" class="fancybox thumbnail">
                                <img src="<s:url value='resources/img/%{dojo.photo3}'/>" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span3">
                            <a href="<s:url value='resources/img/%{dojo.photo4}'/>" class="fancybox thumbnail">
                                <img src="<s:url value='resources/img/%{dojo.photo4}'/>" data-src="holder.js/300x200" alt="">
                            </a>


                        </li>


                    </ul>
                    <div id="adresse" class="row-fluid">
                        <address>
                            <strong>Karate Club Crusnes</strong><br>
                            <s:property escape="false" value="dojo.adresse.nomVoie"/><br>
                            <s:property escape="false" value="dojo.adresse.codePostal"/> <s:property escape="false" value="dojo.adresse.ville"/><br>
                        </address>
                    </div>
                    <div id="map" class="hidden-phone row-fluid">
                        <iframe width="100%" height="350" src="https://maps.google.fr/maps?q=6%C3%A8me+avenue+-+54680+Crusnes+Cit%C3%A9s&amp;ie=UTF8&amp;hq=6%C3%A8me+avenue+-+54680+Crusnes+Cit%C3%A9s&amp;hnear=&amp;radius=15000&amp;ll=49.43042,5.933227&amp;spn=0.006295,0.006295&amp;t=m&amp;output=embed"></iframe><br /><div></div>
                        <div class="span12"></div>
                    </div> </div></div></div>

        <jsp:include page="includes/footer.jsp"/>

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

        <script type="text/javascript">
            $(".club").addClass("active");
            $(function() {
                $('a').tooltip();
                $('#navbar').affix();
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