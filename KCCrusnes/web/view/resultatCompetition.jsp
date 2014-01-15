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
        <div class="row-fluid">
            <!-- Modal -->
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">

                <div class="page-header">
                    <h1>R&eacute;sultats : <s:property value="competition.nom"/></h1>
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
                        <s:iterator value="resultats">
                            <tr>
                                <td><s:property value="licencie.nom"/></td>
                                <td><s:property value="licencie.prenom"/></td>
                                <td><s:property value="place"/></td>
                            </tr>
                        </s:iterator>
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