<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% AccueilAnnuaireAgenda obj = (AccueilAnnuaireAgenda)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%>
<jalios:include pub="<%= obj %>" usage="recherche"/>
