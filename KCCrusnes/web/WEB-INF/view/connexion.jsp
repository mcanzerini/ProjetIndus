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
        <div id="fenetreConnexion" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <s:if test="#session.logined == 'true'">
                <div class="modal-header">
                    <h3 id="myModalLabel">Déjà Connecté(e)</h3>
                </div>
                <div class="modal-body"><p>Vous êtes déjà connecté(e) en tant que <s:property value="#session.login"/></p></div>

                <div class="modal-footer">
                    <a class="btn" href="Index">Fermer</a>
                    <a href="Deconnexion" class="btn btn-danger">Deconnexion</a>
                </div>
            </s:if>
            <s:else>
                <div class="modal-header">
                    <h3 id="myModalLabel">Connexion</h3>
                </div>
                <form id="connexion" action="Connecter" method="POST" class="form-horizontal">
                    <div class="modal-body">

                        <div class="control-group">
                            <label class="control-label" for="inputLogin">Identifiant</label>
                            <div class="controls">
                                <input name="login" type="text" id="inputLogin" placeholder="">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">Mot de passe</label>
                            <div class="controls">
                                <input name="password" type="password" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
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
                        <input type="submit" value="Connexion" class="btn btn-primary">
                    </div>
                </form>
            </s:else>
        </div>

        <jsp:include page="includes/footer.jsp"/>
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