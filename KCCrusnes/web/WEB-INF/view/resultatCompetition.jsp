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
        <jsp:include page="includes/loading.jsp"/>
        <div class="row-fluid" id="minimum">
            <!-- Modal -->
            <div id="deleteResultat" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Suppression de Résultat</h3>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="idResultat" value="">
                        <p>Vous êtes sur le point de supprimer définitivement un résultat</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <button onclick="deleteResultatModal()" data-dismiss="modal" class="btn btn-danger">Confirmer</button>
                    </div>
                </s:else>
            </div>
            <!-- Fin Modal -->
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">

                <div class="page-header">
                    <h1>R&eacute;sultats : <s:property value="competition.nom"/></h1>
                </div>
                <div class="span11"></div>

                <div class="span2"></div>

                <s:if test="#session.logined == 'true'">
                    <button onclick="nouvelleLigneIndividuelle(<s:property value="competition.id"/>)" class="btn btn-primary">Ajouter un résultat individuel</button>
                </s:if>
                <div class="row">&nbsp;</div>
                <s:if test="#session.logined != 'true' && resultats.isEmpty()"><h2>Les résultats ne sont pas encore disponibles</h2></s:if><s:else>
                    <table class="table table-hover table-bordered table-striped">

                        <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Prenom</th>
                                <th>R&eacute;sultat</th>

                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="resultats" status="resultatsStatuts">
                                <s:set value="individuel" name="isIndividuel"/>
                                <tr>
                                    <td><s:if test="#isIndividuel == true"><s:property value="licencie.nom"/></s:if><s:else><s:property value="equipe"/></s:else></td>
                                    <td><s:if test="#isIndividuel == true"><s:property value="licencie.prenom"/></s:if></td>
                                    <td><s:property value="place"/> <s:if test="#session.logined == 'true'"><button onclick="deleteResultat(<s:property value='id'/>)" class="pull-right btn btn-danger">Supprimer</button><button onclick="modifierResultat(<s:property value='id'/>,<s:property value="#resultatsStatuts.index"/>,<s:property value="place"/>)" class="pull-right btn btn-primary">Modifier</button></s:if></td>
                                    </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </s:else>
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
                                        var ligne = false;
                                        function nouvelleLigneIndividuelle(idCompetition) {
                                            if (!ligne) {
                                                ligne = true;
                                                $('tbody').append("<tr><td><input id='individuel' type='hidden' value='true'/><input oninput='checkAdd()' onBlur='getFirstNames()' autocomplete='off' data-provide='typeahead' data-source='' id='inputNom' type='text'/></td><td><input onBlur='getNames()' autocomplete='off' data-provide='typeahead' data-source='' id='inputPrenom' oninput='checkAdd()'  type='text'/></td><td><input id='place' oninput='checkAdd()' type='number'/><button id='add' disabled onclick='submit(" + idCompetition + ")' class='btn btn-primary pull-right'>Valider</button><button onclick='annulerNouvelleLigne()' class='btn btn-primary pull-right'>Annuler</button></td></tr>");
                                                getNamesFirstNames();
                                            }
                                        }

                                        function annulerNouvelleLigne() {
                                            if (ligne) {
                                                ligne = false;
                                                $('tr').last().detach();
                                            }
                                        }

                                        function submit(idC) {
                                            //chargement
                                            $('#loadModal').modal('show');
                                            var nomLicencie = $("#inputNom").val();
                                            var prenomLicencie = $("#inputPrenom").val();
                                            var place = $("#place").val();
                                            var individuel = $("#individuel").val();
                                            $('tbody').empty();
                                            //alert("licencie : " + idL + " place : " + place + " individuel : " + individuel + " competition : " + idC);
                                            $('#barAlbum').css({width: "40%"});
                                            request = $.ajax({
                                                url: "NewResultat",
                                                type: "post",
                                                data: {idCompetition: idC, nomLicencie: nomLicencie, prenomLicencie: prenomLicencie, place: place, individuel: individuel},
                                                success: function(data) {
                                                    $('#barAlbum').css({width: "80%"});
                                                    //var autocomplete = $('#inputNomEntraineur').typeahead();
                                                    /*alert(data);
                                                     var obj = jQuery.parseJSON(data);
                                                     $.each(obj, function() {

                                                     });*/
                                                    //alert(typehead[1]);
                                                    //autocomplete.data('typeahead').source = typehead;
                                                    $('tbody').append(data);
                                                    //fin chargement
                                                    ligne = false;
                                                    $('#loadModal').modal('hide');
                                                }
                                            });
                                        }

                                        function getFirstNames() {
                                            if ($('#inputNom').val() != "") {
                                                request = $.ajax({
                                                    url: "Prenoms",
                                                    type: "post",
                                                    data: {data: $('#inputNom').val()},
                                                    success: function(data) {
                                                        /*if (data.length === 0) {
                                                         data = $("#typeHeadFirstName").val();
                                                         }*/
                                                        var autocomplete = $('#inputPrenom').typeahead();
                                                        autocomplete.data('typeahead').source = data.split(",");
                                                    }
                                                });
                                            }
                                        }
                                        function getNames() {
                                            if ($('#inputPrenom').val() != "") {
                                                request = $.ajax({
                                                    url: "Noms",
                                                    type: "post",
                                                    data: {data: $('#inputPrenom').val()},
                                                    success: function(data) {
                                                        /*if (data.length === 0) {
                                                         data = $("#typeHeadName").val();
                                                         }*/
                                                        var autocomplete = $('#inputNom').typeahead();
                                                        autocomplete.data('typeahead').source = data.split(",");
                                                    }
                                                });
                                            }
                                        }
                                        var noms = new Array();
                                        var prenoms = new Array();
                                        var nomsPrenoms = new Array();
                                        function getNamesFirstNames() {
                                            request = $.ajax({
                                                url: "NomsPrenoms",
                                                type: "post",
                                                data: {},
                                                success: function(data) {
                                                    var autocompleteName = $('#inputNom').typeahead();
                                                    var autocompleteFirstName = $('#inputPrenom').typeahead();
                                                    //alert(data);
                                                    var obj = jQuery.parseJSON(data);
                                                    var i = 0;
                                                    noms = [];
                                                    prenoms = [];
                                                    nomsPrenoms = [];
                                                    $.each(obj, function() {
                                                        //if ($.inArray(this['prenom'], prenoms) === -1) {
                                                        prenoms[i] = this['prenom'];
                                                        //}
                                                        //if ($.inArray(this['nom'], noms) === -1) {
                                                        noms[i] = this['nom'];
                                                        nomsPrenoms[i] = this['prenom'] + " " + this['nom'];
                                                        //}
                                                        i++;
                                                    });
                                                    //alert(typehead[1]);
                                                    autocompleteName.data('typeahead').source = noms;
                                                    autocompleteFirstName.data('typeahead').source = prenoms;
                                                }
                                            });
                                        }

                                        function deleteResultat(index) {
                                            $("#idResultat").attr("value", index);
                                            $("#deleteResultat").modal();
                                        }

                                        function deleteResultatModal() {
                                            $('#loadModal').modal('show');
                                            //chargement
                                            var idResultat = $("#idResultat").val();
                                            $('tbody').empty();
                                            //alert("licencie : " + idL + " place : " + place + " individuel : " + individuel + " competition : " + idC);
                                            request = $.ajax({
                                                url: "DeleteResultat",
                                                type: "post",
                                                data: {id: idResultat},
                                                success: function(data) {
                                                    //var autocomplete = $('#inputNomEntraineur').typeahead();
                                                    /*alert(data);
                                                     var obj = jQuery.parseJSON(data);
                                                     $.each(obj, function() {

                                                     });*/
                                                    //alert(typehead[1]);
                                                    //autocomplete.data('typeahead').source = typehead;
                                                    $('tbody').append(data);
                                                    //fin chargement
                                                    ligne = false;
                                                    $('#loadModal').modal('hide');
                                                }
                                            });
                                        }

                                        function modifierResultat(id, index, place) {
                                            $('tbody tr').eq(index).children().eq(2).empty();
                                            $('tbody tr').eq(index).children().eq(2).append("<input id='place" + id + "' oninput='checkModif(" + id + ")' value='" + place + "' type='number'/> <button id='modif" + id + "' class='btn btn-primary pull-right' onclick='modifier(" + id + ")'>Valider</button><button class='btn btn-primary pull-right' onclick='annuler(" + id + " , " + place + ")'>Annuler</button>");
                                        }

                                        function checkModif(id) {
                                            var val = $('#place' + id).val();
                                            if (!val.match(/^[0-9]+/)) {
                                                $('#modif' + id).attr('disabled', true);
                                                //$('#modif' + id).click();
                                            } else {
                                                $('#modif' + id).removeAttr('disabled');
                                            }
                                        }

                                        function checkAdd() {
                                            var val = $('#place').val();
                                            var nom = $('#inputNom').val();
                                            var prenom = $('#inputPrenom').val();
                                            if (!val.match(/^[0-9]+/) || -1 == $.inArray(prenom + " " + nom, nomsPrenoms)) {
                                                $('#add').attr('disabled', true);
                                                //$('#modif' + id).click();
                                            } else {
                                                $('#add').removeAttr('disabled');
                                            }
                                        }

                                        function annuler(id, place) {
                                            $('#loadModal').modal('show');
                                            $('tbody').empty();
                                            //alert("licencie : " + idL + " place : " + place + " individuel : " + individuel + " competition : " + idC);
                                            request = $.ajax({
                                                url: "ModifResultat",
                                                type: "post",
                                                data: {id: id, place: place},
                                                success: function(data) {
                                                    //var autocomplete = $('#inputNomEntraineur').typeahead();
                                                    /*alert(data);
                                                     var obj = jQuery.parseJSON(data);
                                                     $.each(obj, function() {

                                                     });*/
                                                    //alert(typehead[1]);
                                                    //autocomplete.data('typeahead').source = typehead;
                                                    $('tbody').append(data);
                                                    //fin chargement
                                                    ligne = false;
                                                    $('#loadModal').modal('hide');
                                                },
                                            });
                                        }

                                        function modifier(id) {
                                            //chargement
                                            $('#loadModal').modal('show');
                                            var place = $("#place").val();
                                            $('tbody').empty();
                                            //alert("licencie : " + idL + " place : " + place + " individuel : " + individuel + " competition : " + idC);
                                            request = $.ajax({
                                                url: "ModifResultat",
                                                type: "post",
                                                data: {id: id, place: place},
                                                success: function(data) {
                                                    //var autocomplete = $('#inputNomEntraineur').typeahead();
                                                    /*alert(data);
                                                     var obj = jQuery.parseJSON(data);
                                                     $.each(obj, function() {

                                                     });*/
                                                    //alert(typehead[1]);
                                                    //autocomplete.data('typeahead').source = typehead;
                                                    $('tbody').append(data);
                                                    //fin chargement
                                                    ligne = false;
                                                    $('#loadModal').modal('hide');
                                                }
                                            });
                                        }
        </script>
    </body>
</html>