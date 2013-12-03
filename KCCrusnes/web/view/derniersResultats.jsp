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

    <body>
        <jsp:include page="includes/petitMenu.jsp"/>
        <jsp:include page="includes/grosMenu.jsp"/>
        <div class="row-fluid">
            <!-- Modal -->

            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div>


            <div class="span9">
                <div class="page-header">
                    <h1>R&eacute;sultats</h1>
                </div>

                <blockquote class="span9">
                    <p>« La diff&eacute;rence fondamentale entre l'homme ordinaire et le guerrier, c'est que le guerrier consid&egrave;re toute chose comme un d&eacute;fi,
                        tandis que l'homme ordinaire voit en toute chose soit une b&eacute;n&eacute;diction, soit une mal&eacute;diction. »</p>
                    <small>Jean-Baptiste Poquelin <cite title="Source Title">dit Moli&egrave;re</cite></small>
                </blockquote>
            </div>
            <div class="span11"></div>
            <div id="containeurResultats" class="container">
                <s:iterator value="competitions" status="resultatsStatus">
                    <s:if test="#resultatsStatus.index % 3 == 0">
                        <ul class="thumbnails">
                        </s:if>
                        <li class="span4">
                            <a href="<s:url action='ResultatsCompetition.action'><s:param name='idCompetition'><s:property value='id'/></s:param></s:url>" class="thumbnail">
                                <img src="<s:url value='resources/img/%{photoPrincipale}'/>" data-src="holder.js/300x200" alt="">
                            </a>
                            <div class="caption">
                                <span class="badge badge-inverse"><s:date name="date" format="dd/MM/yyyy" /></span>
                                <h3><s:property value="nom"/> </h3>
                                <p><s:property value="commentaires"/></p>
                                <p><a href="<s:url action='ResultatsCompetition.action'><s:param name='idCompetition'><s:property value='id'/></s:param></s:url>" class="btn btn-primary">Les R&eacute;sultats</a>
                                    </div>
                                </li>
                        <s:if test="#resultatsStatus.count % 3 == 0">
                        </ul>
                    </s:if>
                </s:iterator>
            </div>
        </div>


        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(".res").addClass("active");
            $(function() {
                $('a').tooltip();
            });
        </script>
    </body>
</html>