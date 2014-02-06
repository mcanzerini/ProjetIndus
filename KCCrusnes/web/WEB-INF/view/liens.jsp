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
            <div id="newLien" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>Nouveau lien</h3>
                    </div>
                    <s:form id="newLienForm" cssClass="form-horizontal" action="NewLien" enctype="multipart/form-data" >
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="inputFile">Image</label>
                                <div class="controls">
                                    <input type="file" id="inputFile" name="file" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputNom">Lien</label>
                                <div class="controls">
                                    <input type="text" name="lien" id="inputLien" placeholder="http://..."/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="newLienForm" value="Confirmer" class="btn btn-primary">
                        </div>
                    </s:form>
                </s:else>
            </div>

            <div id="deleteLien" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Suppression de lien</h3>
                    </div>
                    <form id="deleteLienForm" action="DeleteLien" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idLienDelete" value="">
                            <p>Vous êtes sur le point de supprimer définitivement un lien</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="deleteLienForm" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <!-- Fin modal -->

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
                <s:if test="#session.logined == 'true'"><button data-toggle="modal" data-target="#newLien" class="btn btn-primary">Ajouter un lien</button></s:if>
                <s:iterator value="references">
                    <div class="row">
                        <ul class="thumbnails">
                            <li>
                                <s:if test="#session.logined == 'true'">
                                    <button onclick="showDeleteLien(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                </s:if>
                                <a target="_blank" href="<s:property value='lien'/>">
                                    <img src="<s:url value='resources/img/liens/%{image}'/>" data-src="holder.js/300x200" alt=""><br><br>
                                </a>
                            </li>
                        </ul>
                    </div>
                </s:iterator>
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

                                        function showDeleteLien(index) {
                                            $("#idLienDelete").attr("value", index);
                                            $("#deleteLien").modal();
                                        }
        </script>
    </body>
</html>