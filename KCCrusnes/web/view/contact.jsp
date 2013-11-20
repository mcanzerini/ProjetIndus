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
        <link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />

        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>  
        <div id="minimum" class="row-fluid">
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Nous Contacter</h1>
                </div>
            </div>
            
            
            <div class="container">
                <div  class="span2"></div>
                <div class="row-fluid span10">
                    <div  class="span4"></div>







                    <dl class="span4">
                        <dt><h4>E-Mail <i class="icon-envelope"></i></h4></dt>
                        <dd><a href="mailto:kc-crusnes@hotmail.fr">kc-crusnes@hotmail.fr</a></dd>
                    </dl>
                    <div  class="span4"></div>
                </div>
                <div  class="span1"></div>
                <div class="row-fluid span10">
                    <dl class="span4">
                        <dt><h4>T&eacute;l&eacute;phone Pr&eacute;sidente :</h4></dt>
                        <dd>&rarr; 03 82 89 05 52</dd>
                    </dl>
                    <div  class="span4"></div>
                    <dl class="span4">
                        <dt><h4>T&eacute;l&eacute;phone Secr&eacute;taire :</h4></dt>
                        <dd>&rarr; 03 82 91 85 73</dd>
                    </dl>
                </div>
                <div  class="span1"></div>
                <div class="row-fluid span10">
                    <div  class="span4"></div>
                    <dl class="span4">
                        <dt><h4>Karate Club Crusnes</h4></dt>
                        <dd>6&egrave;me Avenue<br>
                            54680 Crusnes Cit&eacute;s<br> &rarr;<a class="fancybox fancybox.iframe" href="https://maps.google.fr/maps?q=6%C3%A8me+avenue+-+54680+Crusnes+Cit%C3%A9s&amp;ie=UTF8&amp;hq=6%C3%A8me+avenue+-+54680+Crusnes+Cit%C3%A9s&amp;hnear=&amp;radius=15000&amp;ll=49.43042,5.933227&amp;spn=0.006295,0.006295&amp;t=m&amp;output=embed"><i class="icon-map-marker"></i></a></dd>
                    </dl>
                    <div  class="span4"></div>

                </div>
            </div>
        </div>
        <div class="span12"></div>                 


        <jsp:include page="includes/footer.jsp"/>

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

        <script type="text/javascript">
            $(".contact").addClass("active");
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