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


            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>Le Comit&eacute;</h1>
                </div>
            </div>
            <div  class="span2"></div>



            <div id="contenuPresentation" class="span7">


                <s:iterator value="comite" status="comiteStatus">
                    <s:if test="#comiteStatus.index % 3 == 0">
                        <div class="row">
                        </s:if>
                        <div class="span4">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th><s:text name="message.comite.%{poste}"/></th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td><dl>
                                                <dt>
                                                <s:property escape="false" value="nom"/>
                                                <s:property escape="false" value="prenom"/>
                                                </dt>
                                                <dd>&nbsp;</dd>
                                                <dt>N&eacute;e le</dt>
                                                <dd>
                                                    <s:date format="dd/MM/yyyy" name="dateNaissance"/>
                                                    <s:set name="webVilleNaissance" value="villeNaissance"/>
                                                    <s:if test="%{#webVilleNaissance!=null && webVilleNaissance!=''}">
                                                        &agrave; <s:property escape="false" value="villeNaissance"/>
                                                    </s:if>
                                                </dd>
                                                <dt>Profession</dt>
                                                <dd><s:property escape="false" value="profession"/></dd>
                                                <dt>Adresse</dt>
                                                <dd><address class="comite">
                                                        <s:property escape="false" value="adresse.numVoie"/> <s:property escape="false" value="adresse.nomVoie"/><br>
                                                        <s:property escape="false" value="adresse.codePostal"/> <s:property escape="false" value="adresse.ville"/>
                                                    </address></dd>
                                                <dt>T&eacute;l&eacute;phone</dt>
                                                <dd><s:property escape="false" value="telephone"/></dd>
                                            </dl></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <s:if test="#comiteStatus.count % 3 == 0">
                        </div>
                    </s:if>
                </s:iterator>
            </div>
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