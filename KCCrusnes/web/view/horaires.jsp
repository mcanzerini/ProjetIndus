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

    <body id="bodyPresentation">
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Les Horaires</h1>
                </div>
            </div>

            <div  class="span2"></div>

            <div id="contenuPresentation" class="span7">




                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Groupe</th>
                            <th>Jour</th>
                            <th>Heure</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="horaires">
                            <s:set name="minuteDebut" value="heureDebut.minute"/>
                            <s:set name="minuteFin" value="heureFin.minute"/>
                            <tr>
                                <td><s:property escape="false" value="groupe"/></td>
                                <td><s:text name="message.horaires.%{jour}"/></td>
                                <td><s:property escape="false" value="heureDebut.heure"/>H<s:property escape="false" value="heureDebut.minute"/><s:if test="%{#minuteDebut==0}"><s:property escape="false" value="heureDebut.minute"/></s:if> - <s:property escape="false" value="heureFin.heure"/>H<s:property escape="false" value="heureFin.minute"/><s:if test="%{#minuteFin==0}"><s:property escape="false" value="heureFin.minute"/></s:if></td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>

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
        </script>
    </body>
</html>