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

                <div class="page-header">
                    <h1>R&eacute;sultats : <s:property value="saison"/></h1>
                </div>
                <div class="span11"></div>

                <div class="span2"></div>


                <table class="table table-hover table-bordered table-striped">

                    <thead>
                        <tr>
                            <th>Licencié</th>
                            <th>Competition</th>
                            <th>Date</th>
                            <th>Place</th>
                        </tr>
                    </thead>
                    <tbody class="reduire">
                        <s:set name="precedent" value="-1"/>
                        <s:iterator value="resultats">
                            <tr>
                                <td>
                                    <s:set name="idCourant" value="licencie.id"/>
                                    <s:if test="#precedent != #idCourant">
                                        <s:set name="precedent" value="licencie.id"/>
                                        <a data-placement="right" data-original-title="Photos" title="Photos" href="<s:url value='resources/img/licencie/%{licencie.photo}'/>" rel="group" class="fancybox"><i class="icon-camera"></i></a>
                                            <s:property value="licencie.nom"/> <s:property value="licencie.prenom"/>
                                        </s:if>
                                </td>
                                <td><s:property value="competition.nom"/></td>
                                <td><s:date name="competition.date" format="dd/MM/yyyy"/></td>
                                <td><s:property value="place"/></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
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