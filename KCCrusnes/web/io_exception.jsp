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
        <div id="fenetreConnexion" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

            <div class="modal-header">
                <h3 id="myModalLabel">Erreur</h3>
            </div>
            <div class="modal-body">

                <strong>Un problème d'écriture ou de lecture est survenu. Si l'erreur persiste, contactez un administrateur</strong>
                <!--<div class="control-group">
                    <div class="controls">
                        <label class="checkbox">
                            <input type="checkbox"> Se souvenir de moi
                        </label>
                    </div>
                </div>-->

            </div>
            <div class="modal-footer">
                <a class="btn" href="Index">Fermer</a>
            </div>
        </div>

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $('#fenetreConnexion').modal({
                keyboard: false
            });
            $(function() {
                $('a').tooltip();
            });
        </script>
    </body>
</html>