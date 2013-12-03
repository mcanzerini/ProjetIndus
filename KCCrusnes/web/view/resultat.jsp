<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Bootstrap 101 Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <meta charset="UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/datepicker.css" rel="stylesheet" media="screen">

        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body>
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
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                <h4>Rechercher les r&eacute;sultats d'un comp&eacute;titeur</h4>
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formCompetiteur" method="post" action="ResultatsCompetiteur" class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label" for="inputNom">Nom</label>
                                        <div class="controls">
                                            <input type="text" id="inputNom" name="nom" placeholder="Dona">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPrenom">Pr&eacutenom</label>
                                        <div class="controls">
                                            <input type="text" id="inputPrenom" name="prenom" placeholder="Davy">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <select name="resultat" form="formCompetiteur">
                                                <option value="1">Les m&eacute;dailles d'or</option>
                                                <option value="2">Les finales</option>
                                                <option value="3">Les podiums</option>
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
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                <h4>Rechercher les r&eacute;sultats d'une comp&eacute;tition</h4>
                            </a>
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formCompet" class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label" for="inputLieu">Lieu</label>
                                        <div class="controls">
                                            <input type="text" id="inputLieu" placeholder="Pont-Ã -Mousson">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputDate">Date</label>
                                        <div class="controls">

                                            <div class="input-append date" id="dp3" data-date="01/01/2013" data-date-format="dd/mm/yyyy">
                                                <input class="span9" size="10" type="text" value="01/01/2013" readonly="">
                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                            </div>  </div></div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputType">Type</label>
                                        <div class="controls">
                                            <select form="formCompet">
                                                <option>Championnat D&eacute;partemental</option>
                                                <option>Championnat Lorraine</option>
                                                <option>Championnat de France</option>
                                                <option>Coupe de France</option>
                                            </select>    </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls">
                                            <select form="formCompet">
                                                <option>Les m&eacute;dailles d'or</option>
                                                <option>Les finales</option>
                                                <option>Les podiums</option>
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
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                                <h4>Rechercher les r&eacute;sultats annuels du club</h4>
                            </a>
                        </div>
                        <div id="collapseThree" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formAnnuel" class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label" for="inputDate">Saison</label>
                                        <div class="controls">

                                            <input class="search-query" type="text" data-provide="typeahead" data-source="[&quot;2012/2013&quot;,&quot;2011/2012&quot;,&quot;2010/2011&quot]" placeholder="2012/2013">  </div></div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <select form="formAnnuel">
                                                <option>Les m&eacute;dailles d'or</option>
                                                <option>Les finales</option>
                                                <option>Les podiums</option>
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
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                                <h4> Rechercher les grades      </h4></a>
                        </div>
                        <div id="collapseFour" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <form id="formGrade" class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label" for="inputNom">Nom</label>
                                        <div class="controls">

                                            <input class="search-query" type="text" placeholder="Perfetto">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPrenom">Pr&eacute;nom</label>
                                        <div class="controls">

                                            <input class="search-query" type="text" placeholder="Raphael">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputGrade">Ceinture</label>
                                        <div class="controls">
                                            <select form="formGrade">

                                                <option>Blanche</option>
                                                <option>Blanche - Jaune</option>
                                                <option>Jaune</option>
                                                <option>Jaune - Orange</option>
                                                <option>Orange</option>
                                                <option>Orange - Verte</option>
                                                <option>Verte</option>
                                                <option>Verte - Bleue</option>
                                                <option>Bleue</option>
                                                <option>Bleue - Marron</option>
                                                <option>Marron</option>
                                                <option>Blanche - Noire</option>
                                                <option>Noire Technique</option>
                                                <option>Noire 1er Dan</option>
                                                <option>Noire 2e Dan Technique</option>
                                                <option>Noire 2e Dan</option>
                                                <option>Noire 3e Dan Technique</option>
                                                <option>Noire 3e Dan</option>
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
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            $(".res").addClass("active");
            $(function() {
                $('a').tooltip();
            });
            $('#dp3').datepicker();

        </script>
    </body>
</html>