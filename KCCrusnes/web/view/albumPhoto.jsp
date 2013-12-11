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

            <jsp:include page="includes/logo.jsp"/>

            <div class="span2"></div>
            <div class="span7">
                <div class="page-header">
                    <h1>Album Photos <s:property value="nomAlbum"/></h1>
                </div>

                <blockquote class="">
                    <p>
                        « Une photographie, c'est un fragment de temps qui ne reviendra pas. »</p>
                    <small><cite title="Source Title">Martine Franck</cite></small>
                </blockquote>
            </div>
            <div class="span11"></div>
            <div id="containeurPhotos" class="container">
                <s:iterator value="photos" status="photosStatus">
                    <s:if test="#photosStatus.index % 3 == 0">
                        <div class="row">
                            <ul class="thumbnails">
                            </s:if>
                            <li class="span4">
                                <a href='<s:url value="resources/img/albums/%{album.id}/%{lien}"/>' rel="group" class="fancybox thumbnail">
                                    <img src='<s:url value="resources/img/albums/%{album.id}/%{lien}"/>' data-src="holder.js/300x200" alt="">
                                </a>
                            </li>
                            <s:if test="#photosStatus.count % 3 == 0">
                            </ul>
                        </div>
                    </s:if>

                </s:iterator>

                <!--<div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div.JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div.JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(2).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(2).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>

                        <li class="span4">
                            <a href="resources/img/albums/1/div(3).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(3).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(4).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(4).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(5).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(5).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(6).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(6).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                    </ul>
                </div>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(7).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(7).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(8).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(8).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(9).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(9).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                    </ul>
                </div>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(10).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(10).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(11).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(11).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(12).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(12).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(13).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(13).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(14).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(14).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(15).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(15).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(16).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(16).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(17).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(17).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(18).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(18).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                    </ul>
                </div>

                <div class="row">
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="resources/img/albums/1/div(19).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(19).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(20).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(20).JPG" data-src="holder.js/300x200" alt="">
                            </a>
                        </li>
                        <li class="span4">
                            <a href="resources/img/albums/1/div(21).JPG" rel="group" class="fancybox thumbnail">
                                <img src="resources/img/albums/1/div(21).JPG" data-src="holder.js/300x200" alt="">
                            </a>

                        </li>
                    </ul>
                </div>-->


            </div>
        </div>
        <jsp:include page="includes/footer.jsp"/>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://platform.twitter.com/widgets.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script type="text/javascript">
            $(".multi").addClass("active");
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