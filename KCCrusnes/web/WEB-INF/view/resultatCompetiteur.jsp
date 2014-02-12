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
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <s:set name="licencie" value="licencies[0]"/>
                <div class="page-header">
                    <h1>R&eacute;sultats : <s:property value="#licencie.nom"/> <s:property value="#licencie.prenom"/> </h1>
                    <h4><s:text name="message.grade.%{#licencie.grade}"/></h4>
                </div>
                <div class="span11"></div>
                <div class="span3">
                    <a href="<s:url value='resources/img/licencies/%{#licencie.photo}'/>" rel="group" class="thumbnail fancybox">
                        <img src="<s:url value='resources/img/licencies/%{#licencie.photo}'/>" alt="Pas de Photo"/>
                    </a>
                </div>
                <div class="span1"></div>
                <div class="span6">
                    <table class="table table-bordered table-striped">

                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Compétition</th>
                                <th>R&eacute;sultat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="resultats">
                                <tr>
                                    <td><s:date name="competition.date" format="dd/MM/yyyy"/></td>
                                    <td><s:property value="competition.nom"/></td>
                                    <td><s:property value="place"/></td>
                                </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                    <br>
                    <div class="span9"></div>
                    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                        <a class="addthis_button_preferred_1"></a>
                        <a class="addthis_button_preferred_2"></a>
                        <!--<a class="addthis_counter addthis_bubble_style"></a>-->
                    </div>
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52fbad8865e83048"></script>
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script type="text/javascript">

            var nom = "<s:property value='#licencie.nom'/>";
            var prenom = "<s:property value='#licencie.prenom'/>";
            var resultat = "<s:property value='resultatString'/>";
            var url = "test.com/KCCrusnes/ResultatsCompetiteur?nom=" + nom + "&prenom=" + prenom + "&resultat=" + resultat;

            var addthis_share =
                    {
                        url: url,
                        title: "Karate Club de Crusnes. Palmarès de " + prenom + " " + nom
                    };

            $(".res").addClass("active");
            $(function() {
                $('a').tooltip();
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
        </script>
    </body>
</html>