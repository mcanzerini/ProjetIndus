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
            <!-- Modal -->
            <div class="visible-desktop span11"></div>
            <div class="visible-desktop span11"></div>
            <img id="logo" alt="" src="resources/img/logo_petit.png"/>
            <div class="span2"></div>
            <div class="span9">
                <div class="page-header">

                    <h1>Les Entraineurs</h1>
                </div>
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
                                    <img src="<s:url value='resources/img/%{photo}'/>" data-src="holder.js/300x200" alt="">
                                </a>
                                <div class="caption">
                                    <h3><s:property value="nom"/> <s:property value="prenom"/></h3>
                                    <h4>Entraineurs <s:iterator value="disciplines">
                                            <s:property value="nom"/>
                                        </s:iterator></h4>
                                    <dl>
                                        <dt>N&eacute; le</dt>
                                        <dd><s:date format="dd/MM/yyyy" name="dateNaissance"/></dd>
                                        <dt><s:text name="message.grade.%{grade}"/></dt>
                                        <dt>Titulaire du <s:property value="diplome"/></dt>
                                        <dd>&nbsp;</dd>
                                    </dl>
                                    <p><a href="#" class="btn btn-primary">Consulter ses R&eacute;sultats</a>
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