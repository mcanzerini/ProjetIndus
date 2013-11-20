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
            <div class="span8">

                <div class="page-header">
                    <h1>R&eacute;sultats : Championnat de Lorraine 12/13</h1>
                </div>
                <div class="span11"></div>

                <div class="span2"></div>


                <table class="table table-hover table-bordered table-striped">

                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Prenom</th>      
                            <th>R&eacute;sultat</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Dona</td>
                            <td>Davy</td>
                            <td>1er</td>      
                        </tr>
                        <tr>
                            <td>Alexandra</td>
                            <td>Recchia</td>
                            <td>1er</td>      
                        </tr>
                        <tr>
                            <td>Da Costa</td>
                            <td>Logan</td>
                            <td>2er</td>      
                        </tr>
                        <tr>
                            <td>Gillet</td>
                            <td>Anthony</td>
                            <td>5e</td>      
                        </tr>

                    </tbody>
                </table>
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