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
        <link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    </head>

    <body>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
            <div id="deleteLicencie" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Suppression de Licencié</h3>
                    </div>
                    <form id="deleteForm" action="DeleteLicencie" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" id="idLicencieDelete" name="idLicencie">
                            <p>Vous êtes sur le point de supprimer définitivement un Licencie et toutes les activités qui sont liées à ce dernier. Cette action est irréversible</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="deleteForm" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>

            <div id="uploadPhoto" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Modifier la photo du licencié</h3>
                    </div>
                    <form id="uploadPhotoForm" action="UploadPhotoLicencie" enctype="multipart/form-data" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="inputFile">Photo</label>
                                <div class="controls">
                                    <input type="file" id="inputFile" name="file" />
                                    <input type="hidden" id="idLicenciePhoto" name="idLicenciePhoto"/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" id="submitNewEvenement" value="Valider" class="btn btn-primary">
                        </div>
                    </form>
                </s:else>
            </div>
            <!-- Fin Modal -->
            <jsp:include page="includes/logo.jsp"/>

            <div class="span2"></div>
            <div class="span7">
                <div class="page-header">
                    <h1>Gestion des licenciés</h1>
                </div>
            </div>
            <div class="span11"></div>
            <div class="row">
                <div class="span2"></div>
                <div class="span6">
                    <form action="Licencies" method="POST" class="form-inline">
                        <div class="control-group">
                            <label class="control-label" for="inputNom">Nom</label>
                            <div class="controls">
                                <input type="text" onchange="getIdFromNomPrenom()" autocomplete="off" placeholder="Nom et Prénom du licencié" data-provide="typeahead" name="nom" id="inputNomLicencie"/>
                                <input type="hidden" id="idLicencie" name="id"/>
                                <input type="submit" class="btn btn-primary" value="Rechercher"/>
                            </div>
                        </div>
                    </form>
                    <div>
                        <a href="AjoutLicencie" class="btn btn-primary">Ajouter un licencié</a>
                    </div>
                </div>
            </div>
            <div class="span2"></div>
            <div class="span6">
                <ul class="pager">
                    <s:set name="pageVar" value="page"/>
                    <s:if test="#pageVar == null || #pageVar == 0">
                        <s:set name="pageVar" value="1"/>
                    </s:if>
                    <s:if test="#pageVar > 1">
                        <li id="previous" class="previous">
                            <a href="<s:url value='Licencies?page=%{#pageVar-1}'/>" id="lienPrevious">Précédents</a>
                        </li>
                    </s:if>
                    <s:set name="size" value="licencies.size"/>
                    <s:if test="#size > 10">
                        <li id="next" class="next">
                            <a href="<s:url value='Licencies?page=%{#pageVar+1}'/>" id="lienNext" >Suivants</a>
                        </li>
                    </s:if>
                </ul>
            </div>
            <div class="span11"></div>

            <ul class="thumbnails">
                <s:iterator value="licencies" status="licenciesStatus">
                    <s:if test="#licenciesStatus.index < 10">
                        <li class="row-fluid">
                            <div class="span2"></div>
                            <img onclick="showUploadPhoto(<s:property value="id"/>)" class="span2 thumbnail" src='<s:url value="resources/img/licencies/%{photo}"/>' alt="">
                            <div class="span2"></div>
                            <div class="span3">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th><s:property value="nom"/> <s:property value="prenom"/><button onclick="showDeleteLicencie(<s:property value='id'/>)" class="pull-right btn btn-danger">Supprimer</button><a href="<s:url value='PreModifLicencie?idLicencie=%{id}'/>" class="btn btn-primary pull-right">Modifier</a></th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><dl>
                                                    <dt>N&eacute;e le</dt>
                                                    <dd>
                                                        <s:date format="dd/MM/yyyy" name="dateNaissance"/>
                                                    </dd>
                                                    <dt>Actif :</dt>
                                                    <dd><s:text name="message.actif.%{actif}"/></dd>
                                                    <dt>Adresse</dt>
                                                    <dd><address class="comite">
                                                            <s:property escape="false" value="adresse.numVoie"/> <s:property escape="false" value="adresse.nomVoie"/><br>
                                                            <s:property escape="false" value="adresse.codePostal"/> <s:property escape="false" value="adresse.ville"/>
                                                        </address></dd>
                                                    <dt>T&eacute;l&eacute;phone</dt>
                                                    <dd><s:property escape="false" value="telephone"/></dd>
                                                    <dt>Grade</dt>
                                                    <dd><s:text name="message.grade.%{grade}"/></dd>
                                                    <dt>Poids</dt>
                                                    <dd><s:property escape="false" value="poids"/></dd>
                                                    <dt>Sexe</dt>
                                                    <dd><s:property escape="false" value="sexe"/></dd>
                                                    <dt>Étudiant</dt>
                                                    <dd><s:text name="message.etudiant.%{etudiant}"/></dd>
                                                    <dt>N° Licence</dt>
                                                    <dd><s:property escape="false" value="numLicence"/></dd>
                                                </dl></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </s:if>
                </s:iterator>
            </ul>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://platform.twitter.com/widgets.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script type="text/javascript">

                                                $(document).ready(function() {
                                                    getLicencies();
                                                });

                                                $(".fancybox")
                                                        .attr('rel', 'gallery')
                                                        .fancybox({
                                                            beforeShow: function() {
                                                                /* Disable right click */
                                                                $.fancybox.wrap.bind("contextmenu", function(e) {
                                                                    return false;
                                                                });
                                                            }
                                                        });
                                                var typehead = new Array();
                                                var tab = new Array();
                                                function getLicencies() {
                                                    request = $.ajax({
                                                        url: "NomsPrenoms",
                                                        type: "post",
                                                        data: {},
                                                        success: function(data) {
                                                            var autocomplete = $('#inputNomLicencie').typeahead();
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
                                                        if (this == $('#inputNomLicencie').val()) {
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

                                                function showUploadPhoto(index) {
                                                    $("#idLicenciePhoto").attr("value", index);
                                                    $("#uploadPhoto").modal();
                                                }

                                                function showDeleteLicencie(id) {
                                                    $("#idLicencieDelete").attr("value", id);
                                                    $("#deleteLicencie").modal();
                                                }
        </script>
    </body>
</html>