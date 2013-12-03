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
        <link rel="stylesheet" href="fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    </head>

    <body>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->
            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>
            <div class="span8">
                <s:set name="licencie" value="licencies[0]"/>
                <div class="page-header">
                    <h1>R&eacute;sultats : <s:property value="#licencie.nom"/> <s:property value="#licencie.prenom"/> </h1>
                </div>
                <div class="span11"></div>
                <div class="span1"></div>
                <a href="<s:url value='resources/img/licencie/%{#licencie.photo}'/>" rel="group" class="fancybox">
                    <img class="span3" data-src="holder.js/300x200" src="<s:url value='resources/img/licencie/%{#licencie.photo}'/>" alt="Pas de Photo"/>
                </a>
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
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script type="text/javascript">
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