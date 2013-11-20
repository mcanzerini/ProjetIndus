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
        <div  id="minimum" class="row-fluid">
            <!-- Modal -->


            <jsp:include page="includes/logo.jsp"/>
            <div class="span2"></div><div class="span8">
                <div class="page-header">

                    <h1>L'Histoire du Club</h1>
                </div>
            </div>




            <div  class="span2"></div>


            <div class="span7">



                <p><s:property escape="false" value="histoire.content"/></p>



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