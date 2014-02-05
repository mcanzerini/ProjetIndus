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
            <div id="newEntraineur" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Nouvel Entraineur</h3>
                    </div>
                    <form id="newEntraineurForm" action="NewEntraineur" method="POST" class="form-horizontal">
                        <div class="modal-body">

                            <div class="control-group">
                                <label class="control-label" for="inputNom">Nom</label>
                                <div class="controls">
                                    <input type="text" onChange="getIdFromNomPrenom()" autocomplete="off" data-provide="typeahead" name="nom" id="inputNomEntraineur"/>
                                    <input type="hidden" id="id" name="idEntraineur"/>
                                    <input type="hidden" id="idLicencie" name="idLicencie"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Diplôme</label>
                                <div class="controls">
                                    <input type="text" autocomplete="off" data-provide="typeahead" name="diplome" id="inputDiplomeEntraineur"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Kata</label>
                                <div class="controls">
                                    <input type="checkbox" name="kata" id="inputKata"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Kumité</label>
                                <div class="controls">
                                    <input type="checkbox" name="kumite" id="inputKumite"/>
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
            <div id="modifEntraineur" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Modification Entraineur</h3>
                    </div>
                    <form id="modifEntraineurForm" action="ModifEntraineur" method="POST" class="form-horizontal">
                        <div class="modal-body">


                            <div class="control-group">
                                <label class="control-label" for="inputDiplomeEntraineur">Diplôme</label>
                                <div class="controls">
                                    <input type="hidden" id="idEntraineurModif" name="idEntraineur"/>
                                    <input type="text" autocomplete="off" data-provide="typeahead" name="diplome" id="inputDiplomeEntraineurModif"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Kata</label>
                                <div class="controls">
                                    <input type="checkbox" name="kata" id="inputKataModif"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputContenu">Kumité</label>
                                <div class="controls">
                                    <input type="checkbox" name="kumite" id="inputKumiteModif"/>
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
            <div id="deleteEntraineur" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <h3 id="myModalLabel">Suppression d'Entraineur</h3>
                    </div>
                    <form id="deleteInfoForm" action="DeleteEntraineur" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="id" id="idEntraineur" value="">
                            <p>Vous êtes sur le point de supprimer définitivement un entraineur</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <!-- Modal fin -->
            <div class="visible-desktop span11"></div>
            <div class="visible-desktop span11"></div>
            <img id="logo" alt="" src="resources/img/logo_petit.png"/>
            <div class="span2"></div>
            <div class="span9">
                <div class="page-header">

                    <h1>Les Entraineurs</h1>
                    <s:if test="#session.logined == 'true'"><button data-toggle="modal" data-target="#newEntraineur" class="btn btn-primary">Ajouter un entraineur</button></s:if>
                    </div>

                    <blockquote class="span10">
                        <p>« Le disciple n’est pas au-dessus de son maître, mais tout disciple bien formé sera comme son maître. »</p>
                        <small>Luc 6,39-42</small>
                    </blockquote>
                </div>
                <div class="visible-desktop span11"></div>
                <div class="visible-desktop span11"></div>

                <br>
                <div class="span1"></div>
                <div id="contenuPresentation" class="span10">



                <s:iterator value="entraineurs" status="entraineursStatus">
                    <s:if test="#entraineursStatus.index % 3 == 0">
                        <div class="row-fluid">
                            <ul class="thumbnails">
                            </s:if>
                            <li class="span3">
                                <a href="#" class="thumbnail">
                                    <img src="<s:url value='resources/img/%{licencie.photo}'/>" data-src="holder.js/300x200" alt="">
                                </a>
                                <div class="caption">
                                    <h3><s:property value="licencie.nom"/> <s:property value="licencie.prenom"/></h3>
                                    <s:set name="kataVar" value="kata"/>
                                    <s:set name="kumiteVar" value="kumite"/>
                                    <s:set name="diplomeVar" value="diplome"/>
                                    <h4>Entraineur <b class="kataClass"><s:if test="#kataVar">Kata</s:if></b> <b class="kumiteClass"><s:if test="#kumiteVar">Kumite</s:if></b></h4>
                                        <dl>
                                            <dt>N&eacute; le</dt>
                                                <dd><s:date format="dd/MM/yyyy" name="licencie.dateNaissance"/></dd>
                                        <dt><s:text name="message.grade.%{licencie.grade}"/></dt>
                                        <dt><s:if test="#diplomeVar != ''">Titulaire du <b class="diplomeClass"><s:property value="diplome"/></b></s:if><s:else><b class="diplomeClass"></b></s:else></dt>
                                            <dd>&nbsp;</dd>
                                        </dl>
                                        <p><a href="#" class="btn btn-primary">Consulter ses R&eacute;sultats</a></p>
                                    <s:if test="#session.logined == 'true'">
                                        <button onclick="showDeleteEntraineur(<s:property value='id'/>)" class="btn btn-danger">Supprimer</button>
                                        <button onclick='showModifEntraineur(<s:property value='id'/>,<s:property value='#entraineursStatus.index'/>)' class="btn btn-primary">Modifier</button>
                                    </s:if>
                                </div>
                            </li>

                            <s:if test="#entraineursStatus.count % 3 == 0">
                            </ul>
                        </div>
                    </s:if>
                    <s:else>
                        <li class="span1"></li>
                        </s:else>
                    </s:iterator>
                <div class="span12"></div>
            </div> </div></div>

    <jsp:include page="includes/footer.jsp"/>

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">
                                            $(".club").addClass("active");
                                            $(function() {
                                                $('a').tooltip();
                                                $('#navbar').affix();
                                            });

                                            function showDeleteEntraineur(index) {
                                                $("#idEntraineur").attr("value", index);
                                                $("#deleteEntraineur").modal();
                                            }
                                            function showModifEntraineur(index, indexStatus) {
                                                $("#idEntraineurModif").attr("value", index);
                                                $("#inputDiplomeEntraineurModif").val($('.diplomeClass').eq(indexStatus).text());
                                                if ($('.kataClass').eq(indexStatus).text() == 'Kata') {
                                                    $('#inputKataModif').attr('checked', true);

                                                }
                                                if ($('.kumiteClass').eq(indexStatus).text() == 'Kumite') {
                                                    $('#inputKumiteModif').attr('checked', true);
                                                }
                                                $("#modifEntraineur").modal();
                                            }

                                            var typehead = new Array();
                                            var tab = new Array();

                                            function getLicencies() {
                                                request = $.ajax({
                                                    url: "NomsPrenoms",
                                                    type: "post",
                                                    data: {},
                                                    success: function(data) {
                                                        var autocomplete = $('#inputNomEntraineur').typeahead();
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

                                            $('#newEntraineur').on('show', function(e) {
                                                getLicencies();
                                                // autocomplete Diplome (option)
                                            });

                                            function getIdFromNomPrenom() {
                                                var i = 0;
                                                var idIndex;
                                                $.each(typehead, function() {
                                                    if (this == $('#inputNomEntraineur').val()) {
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