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
        <div class="row-fluid" id="minimum">
            <!-- Modal -->
            <div id="deletePhoto" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Suppression de Photo</h3>
                    </div>
                    <form id="deletePhotoForm" action="DeletePhotoAlbum" method="POST" class="form-horizontal">
                        <div class="modal-body">
                            <input type="hidden" name="idAlbum" value="<s:property value='idAlbum'/>">
                            <p>Vous êtes sur le point de supprimer définitivement une Photo</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            <input type="submit" form="deletePhotoForm" value="Confirmer" class="btn btn-danger">
                        </div>
                    </form>
                </s:else>
            </div>
            <div id="noPhoto" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Suppression de Photo</h3>
                    </div>
                    <div class="modal-body">
                        <p>Vous n'avez sélectionné aucune photo</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                    </div>
                </s:else>
            </div>
            <div id="noFile" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <s:if test="#session.logined != 'true'">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Non Connecté(e)</h3>
                    </div>
                    <div class="modal-body"><p>Accès interdit, vous n'êtes pas connecté(e)</p></div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                        <a href="Connexion" class="btn btn-primary">Connexion</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Ajout de fichier</h3>
                    </div>
                    <div class="modal-body">
                        <p>Vous n'avez sélectionné aucun fchier</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                    </div>
                </s:else>
            </div>
            <!-- Fin Modal -->
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

                <s:if test="#session.logined == 'true'">
                    <div class="row">
                        <div class="span4">
                            <h4>Taille limite par fichier : 10 Mo</h4>
                            <h4>Types : jpeg / png</h4>
                            <s:form id="fileForm" cssClass="form-horizontal" action="UploadPhotoAlbum" enctype="multipart/form-data" >
                                <s:file id="inputFile" name="files" multiple="multiple" />
                                <s:hidden name="idAlbum" value="%{idAlbum}"/>
                            </s:form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span4">
                            <button onclick="checkFile()" class="btn btn-primary">Ajouter les images</button>
                        </div>
                        <div class="span4">
                            <button onclick="deletePhoto()" class="btn btn-danger">Suppprimer les photos sélectionnées</button>
                        </div>
                    </div>
                    <br>
                </s:if>
                <s:iterator value="photos" status="photosStatus">
                    <s:if test="#photosStatus.index % 3 == 0">
                        <div class="row">
                            <ul class="thumbnails">
                            </s:if>
                            <li class="span4">
                                <a style="max-height:200px;overflow:hidden;" href='<s:url value="resources/img/albums/%{album.id}/%{lien}"/>' rel="group" class="fancybox thumbnail">
                                    <img style="width:100%;min-height:200px;" src='<s:url value="resources/img/albums/%{album.id}/%{lien}"/>' data-src="holder.js/300x200" alt="">
                                </a>
                                <s:if test="#session.logined == 'true'">
                                    <input class="selection" style="margin-left:50%;" type="checkbox" id="<s:property value='id'/>"/>
                                </s:if>
                            </li>
                            <s:if test="#photosStatus.count % 3 == 0">
                            </ul>
                        </div>
                    </s:if>

                </s:iterator>
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


//                        function deletePhotoModal() {
//                            $('#loadModal').modal('show');
//                            //chargement
//                            var idResultat = $("#idResultat").val();
//                            $('tbody').empty();
//                            //alert("licencie : " + idL + " place : " + place + " individuel : " + individuel + " competition : " + idC);
//                            request = $.ajax({
//                                url: "DeleteResultat",
//                                type: "post",
//                                data: {id: idResultat},
//                                success: function(data) {
//                                    //var autocomplete = $('#inputNomEntraineur').typeahead();
//                                    /*alert(data);
//                                     var obj = jQuery.parseJSON(data);
//                                     $.each(obj, function() {
//
//                                     });*/
//                                    //alert(typehead[1]);
//                                    //autocomplete.data('typeahead').source = typehead;
//                                    $('tbody').append(data);
//                                    //fin chargement
//                                    ligne = false;
//                                    $('#loadModal').modal('hide');
//                                }
//                            });
//                        }

                                function deletePhoto() {
                                    var selection = $('.selection:checked');
                                    if (selection.length > 0) {
                                        var i = 0;
                                        $.each(selection, function() {
                                            //alert($(this).attr('id'));
                                            $("#deletePhotoForm").append("<input type='hidden' name='" + i + "' value='" + $(this).attr('id') + "'/>");
                                            i++;
                                        });
                                        $("#deletePhotoForm").append("<input type='hidden' name='nombrePhoto' value='" + i + "'/>");
                                        $("#deletePhoto").modal();
                                    } else {
                                        $("#noPhoto").modal();
                                    }
                                }

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


                                function checkFile() {
                                    if ($('#inputFile').val() != "") {
                                        $('#fileForm').submit();
                                    } else {
                                        $('#noFile').modal();
                                    }
                                }

        </script>
    </body>
</html>