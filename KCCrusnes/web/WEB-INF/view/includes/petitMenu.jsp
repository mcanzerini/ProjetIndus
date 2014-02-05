<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="menuPetit" class=" navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div  id="barreTablette" class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="Index">K C Crusnes</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="index">
                        <a href="Index">Accueil</a>
                    </li>
                    <li class="club dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#">Le Club<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="HistoireClub"><i class="icon-zoom-in"></i> L'Histoire du Club</a></li>
                            <li><a href="Comite"><i class="icon-briefcase"></i> Le Comit&eacute;</a></li>
                            <li><a href="Entraineurs"><i class="icon-user"></i> Les Entraineurs</a></li>
                            <li><a href="Horaires"><i class="icon-time"></i> Les Horaires</a></li>
                            <li><a href="DojoClub"><i class="icon-home"></i> Le Dojo</a></li>
                        </ul>
                    </li>
                    <li class="cal">
                        <a href="VoirCalendrier">Calendrier</a>
                    </li>
                    <li class="res">
                        <a href="Resultat">R&eacute;sultats</a> </li>
                    <li class="mutli dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#">Multim&eacute;dia <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="Photos"><i class="icon-camera"></i> Photos</a></li>
                            <li class="disabled"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vid&eacute;os</a></li>
                        </ul>
                    <li class="contact"> <a href="Contact">Contact</a> </li>
                    <li class="lien"> <a href="References">R&eacute;f&eacute;rences</a> </li>
                    <s:if test="#session.logined == 'true'">
                        <li class="deconnexion pull-right"> <a href="Deconnexion">Deconnexion</a> </li>
                    </s:if>
                </ul>
            </div>
        </div>
    </div>
</div>