<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Bootstrap 101 Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <meta charset="UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <link href="resources/css/feuille.css" rel="stylesheet" media="screen">
    </head>

    <body id="calendrier">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <div class="page-header">
                    <h1>Calendrier</h1>
                </div>



                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Septembre</h3>
                    <h3 class="petitMois">Sep</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th> <!-- Créer une vue pour iPhone en minimisant les caractères. Ex : 09 au lieu de Septembre-->
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="evenementsSeptembre">
                            <tr>
                                <td><s:date name="date" format="dd" /> Septembre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td></td>
                            </tr>
                        </s:iterator>
                        <tr>
                            <td>3 Septembre</td>
                            <td>Reprise pour les Adultes</td>
                            <td>Crusnes</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>11 Septembre</td>
                            <td>Reprise pour les Enfants</td>
                            <td>Crusnes</td>
                            <td></td>
                        </tr>
                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Octobre</h3>
                    <h3 class="petitMois">Oct</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="evenementsOctobre">
                            <tr>
                                <td><s:date name="date" format="dd" /> Octobre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td></td>
                            </tr>
                        </s:iterator>
                        <tr>
                            <td>4-5-6 Octobre</td>
                            <td>Stage de préparation physique et mentale</td>
                            <td>La Bresse, Vosges</td>
                            <td>
                                <a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="#"><i class="icon-file"></i></a>

                                <a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>20-21 Octobre</td>
                            <td>Open Luxembourg</td>
                            <td>Kayl, Luxembourg</td>
                            <td><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="#"><i class="icon-file"></i></a>
                                <a rel="tooltip" data-placement="bottom" data-original-title="Résultats" title="Résultats" href="#"><i class="icon-star-empty"></i></a>
                                <a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></td>
                        </tr>
                        <tr>
                            <td>27 Octobre</td>
                            <td>Stage Arbitres et Coachs</td>
                            <td>Pont-&agrave;-Mousson</td>
                            <td><a rel="tooltip" data-placement="left" data-original-title="Programme" title="Programme" href="#"><i class="icon-file"></i></a>
                                <a rel="tooltip" data-placement="right" data-original-title="Photos" title="Photos" href="#"><i class="icon-camera"></i></a></td>
                        </tr>

                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">Novembre</h3>
                    <h3 class="petitMois">Nov</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>

                    <tbody>
                        <s:iterator value="evenementsNovembre">
                            <tr>
                                <td><s:date name="date" format="dd" /> Novembre</td>
                                <td><s:text name="nom"/></td>
                                <td><s:property escape="false" value="lieu.ville"/></td>
                                <td><s:property escape="false" value="lienProgramme"/></td>
                            </tr>
                        </s:iterator>
                        <tr>
                            <td>17 Novembre</td>
                            <td>Championnats D&eacute;partementaux 54</td>
                            <td>Pont-&agrave;-Mousson</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>23 Novembre</td>
                            <td>Coupe de France Combat Cadet</td>
                            <td>Paris INJ</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>30 Novembre</td>
                            <td>Coupe de France Combat Junior</td>
                            <td>Paris Carpentier</td>
                            <td><a href="http://www.ffkarate.fr/competitions/2014/documents/Cp_Fr_Comb_Jun_30112014_Prog.pdf">Programme</a></td>
                        </tr>
                    </tbody>

                    <thead>
                        <tr>
                            <th><h3 class="grosMois">D&eacute;cembre</h3>
                    <h3 class="petitMois">Déc</h3></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>&Eacute;v&eacute;nement</th>
                        <th>Lieu</th>
                        <th>Liens</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>4-5-6 Octobre</td>
                            <td>Stage de préparation physique et mentale</td>
                            <td>La Bresse, Vosges</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>20-21 Octobre</td>
                            <td>Open Luxembourg</td>
                            <td>Kayl, Luxembourg</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>27 Octobre</td>
                            <td>Stage Arbitres et Coachs</td>
                            <td>Pont-&agrave;-Mousson</td>
                            <td></td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>

        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">

            $(".cal").addClass("active");
            $(function() {
                $('a').tooltip();
            });
        </script>
    </body>
</html>