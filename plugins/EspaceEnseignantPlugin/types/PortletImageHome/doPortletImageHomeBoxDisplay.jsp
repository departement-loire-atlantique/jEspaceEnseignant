<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% PortletImageHome obj = (PortletImageHome)portlet; %><%
CarouselElement itTuile = obj.getElementDeDiaporama();
%>
<div class="ds44-titleContainer ds44-titleContainer--home">
    <p role="heading" aria-level="1" class="h1-like ds44-text--colorInvert">
        <span class="ds44-block"><%= obj.getTitreAffiche(userLang) %></span>
        <span class="ds44-ssTitreH1_home ds44-block ds44-mt1" role="heading" aria-level="2"><%= obj.getSoustitre(userLang) %></span>
    </p>
    <div class="ds44-alphaGradient ds44-alphaGradient--header"></div>
    <ds:figurePicture format="principale"
                      imgCss="ds44-headerImg"
                      pictureCss="ds44-pageHeaderContainer__pictureContainer"
                      
                      pub="<%= itTuile %>"
                      image="<%= itTuile.getImage() %>"
                      imageMobile="<%= itTuile.getImageMobile() %>"
                      legend="<%= itTuile.getImageLegend(userLang) %>"
                      copyright="<%= itTuile.getImageCopyright(userLang) %>" />
</div>

