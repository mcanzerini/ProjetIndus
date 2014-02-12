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
        <link href="bootstrap/css/datepicker.css" rel="stylesheet" media="screen">
    </head>

    <body>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <jsp:include page="includes/logo.jsp"/>

            <div class="span2"></div>
            <div class="span7">
                <div class="page-header">
                    <h1>Ajout d'un licencie</h1>
                </div>
            </div>
            <div class="span11">
                <div class="span3"></div>
                <s:set var="myErrorsVar" value="myErrors"/>
                <s:if test="#myErrorsVar != null && #myErrorsVar.size > 0">
                    <div class="span4 alert alert-block alert-error fade in">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <ul>
                            <s:iterator value="myErrors" var="error">
                                <li><strong><s:property value="error"/></strong><br></li>
                                    </s:iterator>
                        </ul>
                    </div>
                </s:if>
            </div>
            <div class="row">
                <div class="span2"></div>
                <div class="span6">
                    <form id="newLicencieForm" action="ModifLicencie" enctype="multipart/form-data" method="POST" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="inputNom">Nom</label>
                            <div class="controls">
                                <input type="hidden" name="id" value="<s:property value='licencie.id'/>"/>
                                <input type="text" name="nom" id="inputNom" value="<s:property value='licencie.nom'/>"/> <span class=" badge badge-info">Obligatoire</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPrenom">Prénom</label>
                            <div class="controls">
                                <input type="text" name="prenom" id="inputPrenom" value="<s:property value='licencie.prenom'/>"/> <span class=" badge badge-info">Obligatoire</span>
                            </div>
                        </div>
                        <div class="control-group" id="controlDate">
                            <label class="control-label" for="inputDate">Date de Naissance</label>
                            <div class="controls">

                                <div class="input-append date" id="dp3" data-date="01/01/2013" data-date-format="dd/mm/yyyy">
                                    <input class="span9" oninput="checkDateFormat()" id="inputDate" autocomplete="off" size="10" type="text" name="date" value="<s:date name='licencie.dateNaissance' format='dd/MM/yyyy'/>">
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div> <span class=" badge badge-info">Obligatoire</span>  </div></div>
                        <div class="control-group">
                            <label class="control-label" for="inputVilleNaissance">Ville de naissance</label>
                            <div class="controls">
                                <input type="text" name="villeNaissance" id="inputVilleNaissance" value="<s:property value='licencie.villeNaissance'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputNumRue">n° voie</label>
                            <div class="controls">
                                <input type="text" name="numRue" id="inputNumRue" class="input-small" value="<s:property value='licencie.adresse.numVoie'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputNomRue">Nom de la voie</label>
                            <div class="controls">
                                <input type="text" name="nomRue" id="inputNomRue" value="<s:property value='licencie.adresse.nomVoie'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputCP">Code Postal</label>
                            <div class="controls">
                                <input type="text" name="CP" id="inputCP" class="input-small" value="<s:property value='licencie.adresse.codePostal'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputVille">Ville</label>
                            <div class="controls">
                                <input type="text" name="ville" id="inputVille" value="<s:property value='licencie.adresse.ville'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPays">Pays</label>
                            <div class="controls">
                                <input type="text" name="pays" id="inputPays" value="<s:property value='licencie.adresse.pays'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputTel">Téléphone</label>
                            <div class="controls">
                                <input type="text" name="telephone" id="inputTel"  value="<s:property value='licencie.telephone'/>"/> <span class=" badge badge-info">Obligatoire</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputSexe">Sexe</label>
                            <div class="controls">
                                <input type="radio" id="radioFem" value="FEMININ"  name="sexe"/> Féminin<br>
                                <input type="radio" id="radioMasc" value="MASCULIN" name="sexe"/> Masculin
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputNumLicence">N° Licencie</label>
                            <div class="controls">
                                <input type="text" name="numLicence" id="inputNumLicence" value="<s:property value='licencie.numLicence'/>"/> <span class=" badge badge-info">Obligatoire</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputStatut">Statut</label>
                            <div class="controls">
                                <input type="radio" id="radioActif" value="true"  name="actif"/> Actif<br>
                                <input type="radio" id="radioNoActif" value="false" name="actif"/> Non Actif
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPoids">Poids</label>
                            <div class="controls">
                                <input id="inputPoids" name="poids" type="number" class="input-small"  value="<s:property value='licencie.poids'/>"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputEtudiant">Étudiant</label>
                            <div class="controls" >
                                <input type="radio" id="radioEtudiant" value="false" name="etudiant" /> Non<br>
                                <input type="radio" id="radioNoEtudiant" value="true" name="etudiant" /> Oui
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputGrade">Grade</label>
                            <div class="controls">
                                <select id="inputGrade" name="grade">
                                    <option value="CEINTURE_BLANCHE">Ceinture blanche</option>
                                    <option value="CEINTURE_BLANCHE_JAUNE">Ceinture blanche-jaune</option>
                                    <option value="CEINTURE_JAUNE">Ceinture jaune</option>
                                    <option value="CEINTURE_JAUNE_ORANGE">Ceinture jaune-orange</option>
                                    <option value="CEINTURE_ORANGE">Ceinture orange</option>
                                    <option value="CEINTURE_ORANGE_VERTE">Ceinture orange-verte</option>
                                    <option value="CEINTURE_VERTE">Ceinture verte</option>
                                    <option value="CEINTURE_VERTE_BLEUE">Ceinture verte-bleue</option>
                                    <option value="CEINTURE_BLEUE">Ceinture bleue</option>
                                    <option value="CEINTURE_BLEUE_MARRON">Ceinture bleue-marron</option>
                                    <option value="CEINTURE_MARRON">Ceinture marron</option>
                                    <option value="CEINTURE_NOIRE_TECHNIQUE">Ceinture noire technique</option>
                                    <option value="CEINTURE_NOIRE_PREMIERE_DAN_TECHNIQUE">Ceinture noire 1er Dan technique</option>
                                    <option value="CEINTURE_NOIRE_PREMIERE_DAN">Ceinture noire 1er Dan</option>
                                    <option value="CEINTURE_NOIRE_DEUXIEME_DAN_TECHNIQUE">Ceinture noire 2e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_DEUXIEME_DAN">Ceinture noire 2e Dan</option>
                                    <option value="CEINTURE_NOIRE_TROISIEME_DAN_TECHNIQUE">Ceinture noire 3e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_TROISIEME_DAN">Ceinture noire 3e Dan</option>
                                    <option value="CEINTURE_NOIRE_QUATRIEME_DAN_TECHNIQUE">Ceinture noire 4e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_QUATRIEME_DAN">Ceinture noire 4e Dan</option>
                                    <option value="CEINTURE_NOIRE_CINQUIEME_DAN_TECHNIQUE">Ceinture noire 5e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_CINQUIEME_DAN">Ceinture noire 5e Dan</option>
                                    <option value="CEINTURE_NOIRE_SIXIEME_DAN_TECHNIQUE">Ceinture noire 6e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_SIXIEME_DAN">Ceinture noire 6e Dan</option>
                                    <option value="CEINTURE_NOIRE_SEPTIEME_DAN_TECHNIQUE">Ceinture noire 7e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_SEPTIEME_DAN">Ceinture noire 7e Dan</option>
                                    <option value="CEINTURE_NOIRE_HUITIEME_DAN_TECHNIQUE">Ceinture noire 8e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_HUITIEME_DAN">Ceinture noire 8e Dan</option>
                                    <option value="CEINTURE_NOIRE_NEUVIEME_DAN_TECHNIQUE">Ceinture noire 9e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_NEUVIEME_DAN">Ceinture noire 9e Dan</option>
                                    <option value="CEINTURE_NOIRE_DIXIEME_DAN_TECHNIQUE">Ceinture noire 10e Dan technique</option>
                                    <option value="CEINTURE_NOIRE_DIXIEME_DAN">Ceinture noire 10e Dan</option>
                                </select>    </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                                <input type="submit" id="submitNewEvenement" value="Valider" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://platform.twitter.com/widgets.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">

            $(document).ready(function() {
                var sexe = "<s:property value='licencie.sexe'/>";
                if (sexe === 'MASCULIN') {
                    $('#radioMasc').prop('checked', true);
                } else {
                    $('#radioFem').prop('checked', true);
                }
                var actif = "<s:property value='licencie.actif'/>";
                if (!actif) {
                    $('#radioNoActif').prop('checked', true);
                } else {
                    $('#radioActif').prop('checked', true);
                }
                var etudiant = "<s:property value='licencie.etudiant'/>";
                if (etudiant) {
                    $('#radioEtudiant').prop('checked', true);
                } else {
                    $('#radioNoEtudiant').prop('checked', true);
                }
                var grade = "<s:property value='licencie.grade'/>";
                $('#inputGrade option[value="' + grade + '"]').prop('selected', true);
            });

            $('#inputDate').datepicker({
                weekStart: 1,
                language: "fr"
            });

            var error = false;

            function checkDateFormat(id) {
                var date = $('#inputDate').val();
                if (!date.match(/^(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/](19|20)[0-9][0-9]/)) {
                    $('#controlDate').addClass('error');
                    //$('#formCompet').removeClass('span6');
                    //$('#formCompet').addClass('span10');
                    if (!error) {
                        $(id).after("<span id='helpDateFormat' class='help-inline'>Attention ! La doit doit être de type jj/mm/aaaa </span>");
                        error = true;
                    }
                    $('#submitNewEvenement').addClass('disabled');
                } else {
                    if (error) {
                        $('#controlDate').removeClass('error');
                        $('#helpDateFormat').remove();
                        //$('#formCompet').removeClass('span10');
                        //$('#formCompet').addClass('span6');
                    }
                    error = false;
                    $('#submitNewEvenement').removeClass('disabled');
                }
            }
        </script>
    </body>
</html>