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

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>  
        <div class="row-fluid">

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Les Horaires</h1>
                </div>
            </div>

            <div  class="span2"></div>

            <div id="contenuPresentation" class="span7">




                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Groupe</th>
                            <th>Jour</th>
                            <th>Heure</th>      
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Enfants (4-5 ans)</td>
                            <td>Mercredi</td>
                            <td>16h00 - 17h00</td>
                        </tr>
                        <tr>
                            <td>Enfants (4-5 ans)</td>
                            <td>Vendredi</td>
                            <td>17h15 - 18h15</td>
                        </tr>
                        <tr>
                            <td>Enfants &agrave; partir de 6 ans</td>
                            <td>Mercredi</td>
                            <td>17h00 - 18h30</td>
                        </tr>
                        <tr>
                            <td>Enfants &agrave; partir de 6 ans</td>
                            <td>Vendredi</td>
                            <td>18h15 - 19h30</td>
                        </tr>
                        <tr>
                            <td>Adultes</td>
                            <td>Mardi</td>
                            <td>19h30 - 21h00</td>
                        </tr>
                        <tr>
                            <td>Adultes</td>
                            <td>Vendredi</td>
                            <td>19h30 - 21h00</td>
                        </tr>
                        <tr>
                            <td>Comp&eacute;titeurs Kata</td>
                            <td>Samedi</td>
                            <td>10h00 - 11h30</td>
                        </tr>


                    </tbody>
                </table>

                <div class="span12"></div>                 
            </div> </div> 	

        <jsp:include page="includes/footer.jsp"/> 

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>

        <script type="text/javascript">
            $(".club").addClass("active");
            $(function() {
                $('a').tooltip();
                $('#navbar').affix();
            });
        </script>
    </body>
</html>  	