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
        <link href="timepicker/css/bootstrap-timepicker.css" rel="stylesheet" media="screen">
        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
            <div id="newHoraire" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Nouvel Horaire</h3>
                    </div>
                    <form id="newHoraireForm" action="NewHoraire" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputPriorite">Groupe</label>
                                <div class="controls">
                                    <input type="text" id="groupeId" autocomplete="off" data-provide="typeahead" name="groupe" form="newHoraireForm"/>
                                </div>
                            </div>
                            <div class="control-group" id="controlJour">
                                <label id="labelJour" class="control-label" for="inputPriorite">Jour</label>
                                <div class="controls">
                                    <input type="text" id="jourId" autocomplete="off" data-provide="typeahead" name="jour" form="newHoraireForm"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Heure de Début</label>
                                <div class="controls">
                                    <div class="bootstrap-timepicker">
                                        <input id="timepicker3" name="debut" type="text" class="input-small">
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Heure de Fin</label>
                                <div class="controls">
                                    <div class="bootstrap-timepicker">
                                        <input id="timepicker4" name="fin" type="text" class="input-small">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="button" onclick="validerHoraire()" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>

            <div id="deleteHoraire" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Suppression d'horaire</h3>
                    </div>
                    <form id="deleteInfoForm" action="DeleteHoraire" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idHoraire" value="">
                            <p>Vous êtes sur le point de supprimer définitivement cet horaire d'entrainement</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <!-- Modal fin -->
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Les Horaires </h1>
                </div>
            </div>

            <div  class="span2"></div>

            <div id="contenuPresentation" class="span7">

                <s:if test="#session.logined == 'true'"> <button onclick="showNewHoraire()" class="btn btn-primary">Ajouter un horaire</button></s:if>


                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Groupe</th>
                                <th>Jour</th>
                                <th>Heure</th>
                            </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="horaires" status="horairesStatus">
                            <s:set name="minuteDebut" value="heureDebut.minute"/>
                            <s:set name="minuteFin" value="heureFin.minute"/>
                            <tr>
                                <td class="groupe"><s:property escape="false" value="groupe"/></td>
                                <td class="jour"><s:text name="message.horaires.%{jour}"/></td>
                                <td><s:property escape="false" value="heureDebut.heure"/>H<s:property escape="false" value="heureDebut.minute"/><s:if test="%{#minuteDebut==0}"><s:property escape="false" value="heureDebut.minute"/></s:if> - <s:property escape="false" value="heureFin.heure"/>H<s:property escape="false" value="heureFin.minute"/><s:if test="%{#minuteFin==0}"><s:property escape="false" value="heureFin.minute"/></s:if>
                                    <s:if test="#session.logined == 'true'"> <button onclick="showDeleteHoraire(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button></s:if></td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>

                <div class="span12"></div>
            </div> </div>

        <jsp:include page="includes/footer.jsp"/>

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="timepicker/js/bootstrap-timepicker.js"></script>
        <script type = "text/javascript">
                                        $(".club").addClass("active");
                                        $(function() {
                                            $('a').tooltip();
                                            $('#navbar').affix();
                                        });
                                        var jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
                                        var joursMaj = ['LUNDI', 'MARDI', 'MERCREDI', 'JEUDI', 'VENDREDI', 'SAMEDI', 'DIMANCHE'];
                                        function showNewHoraire() {
                                            var groupes = $('.groupe').toArray();
                                            var groupesString = new Array();
                                            for (i = 0; i < groupes.length; i++)
                                            {
                                                var groupe = $('.groupe').eq(i).text();
                                                if ($.inArray(groupe, groupesString) === -1) {
                                                    groupesString.push($('.groupe').eq(i).text());
                                                }
                                            }
                                            $('#groupeId').typeahead({source: groupesString});
                                            $("#newHoraire").modal();
                                            $('#jourId').typeahead({source: jours});
                                        }

                                        function showDeleteHoraire(index) {
                                            $("#idHoraire").attr("value", index);
                                            $("#deleteHoraire").modal();
                                        }
                                        function showModifHoraire(index, indexStatus) {
                                            $("#idHoraire").attr("value", index);
                                            $("#modifHoraire").modal();
                                        }
                                        $('#timepicker3').timepicker({
                                            minuteStep: 5,
                                            showInputs: false,
                                            template: 'modal',
                                            disableFocus: true,
                                            showMeridian: false,
                                            defaultTime: "18:00"
                                        });
                                        $('#timepicker4').timepicker({
                                            minuteStep: 5,
                                            showInputs: false,
                                            template: 'modal',
                                            disableFocus: true,
                                            showMeridian: false,
                                            defaultTime: "18:00"
                                        });

                                        function validerHoraire() {
                                            var jourMaj = $('#jourId').val().toUpperCase();
                                            if ($.inArray(jourMaj, joursMaj) === -1) {
                                                $('#controlJour').addClass('error');
                                                $('#labelJour').text("Jour invalide");
                                            } else {
                                                $('#newHoraireForm').submit();
                                            }
                                        }
        </script>
    </body>
</html>