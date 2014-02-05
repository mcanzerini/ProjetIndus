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
        <div class="row-fluid">
            <!-- Modal -->
            <div id="modifMembre" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Modification</h3>
                    </div>
                    <form id="modifMembreForm" action="ModifMembre" method="POST" class="form-horizontal">
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
                                <label class="control-label" for="inputNomMembre">Nom</label>
                                <div class="controls">
                                    <input type="text" onChange="getIdFromNomPrenom()" autocomplete="off" data-provide="typeahead" name="nom" id="inputNomMembre"/>
                                    <input type="hidden" id="idPoste" name="poste"/>
                                    <input type="hidden" id="idLicencie" name="idLicencie"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputProfessionMembre">Profession</label>
                                <div class="controls">
                                    <input type="text" name="profession" id="inputProfessionMembre"/>
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

                    <h1>Le Comit&eacute;</h1>
                </div>
            </div>
            <div  class="span2"></div>



            <div id="contenuPresentation" class="span7">


                <s:iterator value="comite" status="comiteStatus">
                    <s:if test="#comiteStatus.index % 3 == 0">
                        <div class="row">
                        </s:if>
                        <div class="span4">

                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th><s:text name="message.comite.%{poste}"/>
                                            <s:if test="#session.logined == 'true'">
                                                <button onclick='showModifMembre("<s:property value='poste'/>")' class="btn btn-primary pull-right">Modifier</button>
                                            </s:if></th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td><dl>
                                                <dt>
                                                <s:property escape="false" value="licencie.nom"/>
                                                <s:property escape="false" value="licencie.prenom"/>
                                                </dt>
                                                <dd>&nbsp;</dd>
                                                <dt>N&eacute;e le</dt>
                                                <dd>
                                                    <s:date format="dd/MM/yyyy" name="licencie.dateNaissance"/>
                                                    <s:set name="webVilleNaissance" value="licencie.villeNaissance"/>
                                                    <s:if test="%{#webVilleNaissance!=null && webVilleNaissance!=''}">
                                                        &agrave; <s:property escape="false" value="licencie.villeNaissance"/>
                                                    </s:if>
                                                </dd>
                                                <dt>Profession</dt>
                                                <dd><s:property escape="false" value="profession"/></dd>
                                                <dt>Adresse</dt>
                                                <dd><address class="comite">
                                                        <s:property escape="false" value="licencie.adresse.numVoie"/> <s:property escape="false" value="licencie.adresse.nomVoie"/><br>
                                                        <s:property escape="false" value="licencie.adresse.codePostal"/> <s:property escape="false" value="licencie.adresse.ville"/>
                                                    </address></dd>
                                                <dt>T&eacute;l&eacute;phone</dt>
                                                <dd><s:property escape="false" value="licencie.telephone"/></dd>
                                            </dl></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <s:if test="#comiteStatus.count % 3 == 0">
                        </div>
                    </s:if>
                </s:iterator>
            </div>
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
                                                    var typehead = new Array();
                                                    var tab = new Array();
                                                    function showModifMembre(poste) {
                                                        $("#myModalLabel").html("Modifier le : " + poste);
                                                        $("#idPoste").attr("value", poste);
                                                        $("#modifMembre").modal();
                                                        getLicencies();
                                                    }



                                                    //degueulasse y surement mieux

                                                    function getLicencies() {
                                                        request = $.ajax({
                                                            url: "NomsPrenoms",
                                                            type: "post",
                                                            data: {},
                                                            success: function(data) {
                                                                var autocomplete = $('#inputNomMembre').typeahead();
                                                                //alert(data);
                                                                var obj = jQuery.parseJSON(data);
                                                                var nomprenom = "";
                                                                var i = 0;
                                                                $.each(obj, function() {
                                                                    nomprenom = this['prenom'] + " " + this['nom'];
                                                                    typehead[i] = nomprenom;
                                                                    tab[i] = this['id'];
                                                                    i++;
                                                                });
                                                                //alert(typehead[1]);
                                                                autocomplete.data('typeahead').source = typehead;
                                                            }
                                                        });
                                                    }

                                                    function getIdFromNomPrenom() {
                                                        var i = 0;
                                                        var idIndex;
                                                        $.each(typehead, function() {
                                                            if (this == $('#inputNomMembre').val()) {
                                                                //alert('ok');
                                                                //alert($('#inputNomMembre').val());
                                                                idIndex = i;
                                                                return false;
                                                            } else {
                                                                i++;
                                                            }
                                                        });
                                                        $('#idLicencie').val(tab[idIndex]);
                                                    }
    </script>
</body>
</html>