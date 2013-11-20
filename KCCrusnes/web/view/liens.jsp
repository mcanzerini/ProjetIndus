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

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span7">
                <div class="page-header">
                    <h1>R&eacute;f&eacute;rences</h1>
                </div>



            </div>
            <div class="span1"></div>

            <div class="span11"></div>
            <div class="span4"></div>
            <div class="span4">
                <div class="row">
                    <ul class="thumbnails">
                        <li>
                            <a target="_blank" href="http://ffkarate.fr">
                                <img src="resources/img/liens/ffkarate.png" data-src="holder.js/300x200" alt=""><br><br>
                            </a>

                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul class="thumbnails">
                        <li>
                            <a target="_blank" href="http://ffkarate.fr/lorraine">
                                <img src="resources/img/liens/ligue.png" data-src="holder.js/300x200" alt=""><br><br><br><br>
                            </a>

                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul class="thumbnails">
                        <li>
                            <a target="_blank" href="http://www.jt-difarma.net/">
                                <img src="resources/img/liens/JTDIFARMA.png" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(".lien").addClass("active");
            $(function() {
                $('a').tooltip();
            });
        </script>
    </body>
</html>  	