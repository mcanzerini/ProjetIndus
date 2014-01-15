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

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div  id="minimum" class="row-fluid">
            <!-- Modal -->
            <div id="modifHistoire" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="connexion.jsp" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edition histoire</h3>
                    </div>
                    <form id="modifInfoForm" action="ModifHistoire" method="POST" class="form-inline">
                        <div class="modal-body">

                            <!--                            <div class="control-group">
                                                            <label class="control-label" for="inputPriorite">Priorite</label>
                                                            <div class="controls">
                                                                <input type="radio" value="1" name="priorite" form="modifInfoForm"/> Information<br>
                                                                <input type="radio" value="2" name="priorite" form="modifInfoForm"/> Attention<br>
                                                                <input type="radio" value="3" name="priorite" checked form="modifInfoForm"/> Défaut
                                                            </div>
                                                        </div>-->
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Contenu</label>
                                <div class="controls">
                                    <textarea style="width:97%;height:100px;max-width: 97%" name="contenu" id="inputContenu"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>

            <!-- Fin modal -->

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>L'Histoire du Club <s:if test="#session.logined == 'true'"><button onclick="showModifHistoire()" class="btn btn-primary">Modifier</button></s:if></h1>
                    </div>
                </div>




                <div  class="span2"></div>


                <div class="span7">



                    <p><s:property escape="false" value="histoire.content"/></p>



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

                        function showModifHistoire() {
                            $("textarea").text('<s:property escape="false" value="histoire.content"/>');
                            $("#modifHistoire").modal();
                        }
        </script>
    </body>
</html>