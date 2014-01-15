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
        <link href="bootstrap/css/datepicker.css" rel="stylesheet" media="screen">

        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body>
        <s:hidden id="typeHeadName" value="%{typeHeadName}" name="typeHeadName"/>
        <s:hidden id="typeHeadFirstName" value="%{typeHeadFirstName}" name="typeHeadFirstName"/>
        <s:hidden id="typeHeadPlace" value="%{typeHeadPlace}" name="typeHeadPlace"/>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>


            <div class="span8">
                <div class="page-header">
                    <h1>R&eacute;sultats</h1>

                    <h2>Moteur de Recherche</h2>
                </div>

                <div class="accordion" id="accordion2">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="" data-parent="" href="DerniersResultats">
                                <h4>Consulter les derniers r&eacute;sultats</h4>
                            </a>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a id="aCollapseOne" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                <h4>Rechercher les r&eacute;sultats d'un comp&eacute;titeur</h4>
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <div id="alertNoCompetiteur" class="hidden alert alert-block alert-error fade in">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>Aucun Résultat</strong> Vérifier les données saisies.
                                </div>
                                <form id="formCompetiteur" method="post" action="ResultatsCompetiteur" class="form-horizontal span9">
                                    <div class="control-group">
                                        <label class="control-label" for="inputNom">Nom</label>
                                        <div class="controls">
                                            <input type="text" onBlur="getFirstNames()" autocomplete="off" data-provide="typeahead" data-source='' id="inputNom" name="nom" placeholder="Dona"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPrenom">Pr&eacutenom</label>
                                        <div class="controls">
                                            <input type="text" onBlur="getNames()" autocomplete="off" data-provide="typeahead" data-source='' id="inputPrenom" name="prenom" placeholder="Davy"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <select id="inputResultat" name="resultat" form="formCompetiteur">
                                                <option value="1">Les m&eacute;dailles d'or</option>
                                                <option value="2">Les finales</option>
                                                <option value="3" selected="">Les podiums</option>
                                            </select>    </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" class="btn btn-primary">Lancer la recherche</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a id="aCollapseTwo" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                <h4>Rechercher les r&eacute;sultats d'une comp&eacute;tition</h4>
                            </a>
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <div id="alertNoCompetition" class="hidden alert alert-block alert-error fade in">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>Aucun Résultat</strong> Vérifier les données saisies.
                                </div>
                                <form id="formCompet" method="post" action="RechercheResultatsCompetition" class="span9 form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label" for="inputLieu">Lieu</label>
                                        <div class="controls">
                                            <input type="text" id="inputLieu" autocomplete="off" data-provide="typeahead" data-source='' name="lieu" placeholder="Pont-à-Mousson"/>
                                        </div>
                                    </div>

                                    <div class="control-group" id="controlDate">
                                        <label class="control-label" for="inputDate">Date</label>
                                        <div class="controls">

                                            <div class="input-append date" id="dp3" data-date="01/01/2013" data-date-format="dd/mm/yyyy">
                                                <input class="span9" oninput="checkDateFormat()" id="inputDate" autocomplete="off" size="10" type="text" name="date" value="01/01/2013">
                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                            </div>  </div></div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputType">Niveau</label>
                                        <div class="controls">
                                            <select id="inputNiveau" name="niveau" form="formCompet">
                                                <option selected value="">Tout niveau</option>
                                                <option value="DEPARTEMENTAL">Championnat D&eacute;partemental</option>
                                                <option value="REGIONAL">Championnat Lorraine</option>
                                                <option value="NATIONAL">Championnat National</option>
                                                <option value="DIVERS">Divers (Open, ...)</option>
                                            </select>    </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls">
                                            <select id="inputResultat2" form="formCompet" name="resultat">
                                                <option value="1">Les m&eacute;dailles d'or</option>
                                                <option value="2">Les finales</option>
                                                <option value="3" selected="">Les podiums</option>
                                            </select>    </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" id="submitCompetition" class="btn btn-primary">Lancer la recherche</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                                <h4>Rechercher les r&eacute;sultats annuels du club</h4>
                            </a>
                        </div>
                        <div id="collapseThree" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formAnnuel" action="ResultatsAnnee" class="form-horizontal">
                                    <div class="control-group" id="controlSaison">
                                        <label class="control-label" for="inputSaison">Saison</label>
                                        <div class="controls">

                                            <input type="text" name="saison" onchange="checkSaisonFormat()" oninput="checkSaisonFormat()" autocomplete="off" id="inputSaison" data-provide="typeahead" data-source="[&quot;2012/2013&quot;,&quot;2011/2012&quot;,&quot;2010/2011&quot]" placeholder="2012/2013"/>  </div></div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <select form="formAnnuel">
                                                <option value="1">Les m&eacute;dailles d'or</option>
                                                <option value="2">Les finales</option>
                                                <option value="3" selected="">Les podiums</option>
                                            </select>    </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" id="submitSaison" class="btn btn-primary">Lancer la recherche</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                                <h4> Rechercher les grades      </h4></a>
                        </div>
                        <div id="collapseFour" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formGrade" action="ResultatsGrade" class="form-horizontal">
                                    <!--<div class="control-group">
                                        <label class="control-label" for="inputNom">Nom</label>
                                        <div class="controls">

                                            <input type="text" placeholder="Perfetto">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPrenom">Pr&eacute;nom</label>
                                        <div class="controls">

                                            <input type="text" placeholder="Raphael">
                                        </div>
                                    </div>-->
                                    <div class="control-group">
                                        <label class="control-label" for="inputGrade">Ceinture</label>
                                        <div class="controls">
                                            <select name="grade" form="formGrade">
                                                <s:iterator value="grades" status="status">
                                                    <option value="<s:property value="grades[#status.index]"/>"><s:text name="message.grade.%{grades[#status.index]}"/></option>
                                                </s:iterator>

                                            </select>    </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" class="btn btn-primary">Lancer la recherche</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script src="bootstrap/js/bootstrap-datepicker.js"></script>
        <script src="resources/js/purl.js"></script>
        <script type="text/javascript">
                                                var errorSaison = false;
                                                function checkSaisonFormat() {
                                                    var date = $('#inputSaison').val();
                                                    if (!date.match(/^(19|20)[0-9][0-9][/](19|20)[0-9][0-9]/)) {
                                                        $('#controlSaison').addClass('error');
                                                        //$('#formCompet').removeClass('span6');
                                                        //$('#formCompet').addClass('span10');
                                                        if (!errorSaison) {
                                                            $('#inputSaison').after("<span id='helpSaisonFormat' class='help-inline'>Attention ! La date doit être de type année/année+1 </span>");
                                                            errorSaison = true;
                                                        }
                                                        $('#submitSaison').addClass('disabled');
                                                    } else {
                                                        if (errorSaison) {
                                                            $('#controlSaison').removeClass('error');
                                                            $('#helpSaisonFormat').remove();
                                                            //$('#formCompet').removeClass('span10');
                                                            //$('#formCompet').addClass('span6');
                                                        }
                                                        errorSaison = false;
                                                        $('#submitSaison').removeClass('disabled');
                                                    }
                                                }

                                                var error = false;
                                                function checkDateFormat() {
                                                    var date = $('#inputDate').val();
                                                    if (!date.match(/^(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/](19|20)[0-9][0-9]/)) {
                                                        $('#controlDate').addClass('error');
                                                        //$('#formCompet').removeClass('span6');
                                                        //$('#formCompet').addClass('span10');
                                                        if (!error) {
                                                            $('#dp3').after("<span id='helpDateFormat' class='help-inline'>Attention ! La doit doit être de type jj/mm/aaaa </span>");
                                                            error = true;
                                                        }
                                                        $('#submitCompetition').addClass('disabled');
                                                    } else {
                                                        if (error) {
                                                            $('#controlDate').removeClass('error');
                                                            $('#helpDateFormat').remove();
                                                            //$('#formCompet').removeClass('span10');
                                                            //$('#formCompet').addClass('span6');
                                                        }
                                                        error = false;
                                                        $('#submitCompetition').removeClass('disabled');
                                                    }
                                                }

                                                function getFirstNames() {
                                                    request = $.ajax({
                                                        url: "Prenoms",
                                                        type: "post",
                                                        data: {data: $('#inputNom').val()},
                                                        success: function(data) {
                                                            if (data.length === 0) {
                                                                data = $("#typeHeadFirstName").val();
                                                            }
                                                            var autocomplete = $('#inputPrenom').typeahead();
                                                            autocomplete.data('typeahead').source = data.split(",");
                                                        }
                                                    });
                                                }
                                                function getNames() {
                                                    request = $.ajax({
                                                        url: "Noms",
                                                        type: "post",
                                                        data: {data: $('#inputPrenom').val()},
                                                        success: function(data) {
                                                            if (data.length === 0) {
                                                                data = $("#typeHeadName").val();
                                                            }
                                                            var autocomplete = $('#inputNom').typeahead();
                                                            autocomplete.data('typeahead').source = data.split(",");
                                                        }
                                                    });
                                                }

                                                var data = $("#typeHeadName").val();
                                                var autocomplete = $('#inputNom').typeahead();
                                                autocomplete.data('typeahead').source = data.split(",");

                                                data = $("#typeHeadFirstName").val();
                                                autocomplete = $('#inputPrenom').typeahead();
                                                autocomplete.data('typeahead').source = data.split(",");

                                                data = $("#typeHeadPlace").val();
                                                autocomplete = $('#inputLieu').typeahead();
                                                autocomplete.data('typeahead').source = data.split(",");

                                                if ($.url().param('problem') === 'noCompetiteur') {
                                                    $("#collapseOne").collapse({
                                                        parent: '#accordion2'
                                                    });
                                                    $("#aCollapseOne").addClass("collapsed");
                                                    $("#alertNoCompetiteur").removeClass("hidden");
                                                    $("#inputNom").val($.url().param('nom'));
                                                    $("#inputPrenom").val($.url().param('prenom'));
                                                    $('#inputResultat').val($.url().param('resultat'));
                                                } else if ($.url().param('problem') === 'noCompetition') {
                                                    $("#collapseTwo").collapse({
                                                        parent: '#accordion2'
                                                    });
                                                    $("#aCollapseTwo").addClass("collapsed");
                                                    $("#alertNoCompetition").removeClass("hidden");
                                                    $("#inputLieu").val($.url().param('lieu'));
                                                    $("#inputDate").val($.url().param('date'));
                                                    $("#inputNiveau").val($.url().param('niveau'));
                                                    $('#inputResultat2').val($.url().param('resultat'));
                                                }

                                                $(".res").addClass("active");
                                                $(function() {
                                                    $('a').tooltip();
                                                });
                                                $('#dp3').datepicker().on('changeDate', function(ev) {
                                                    checkDateFormat();
                                                    $('#dp3').datepicker('hide');
                                                });

        </script>
    </body>
</html>