<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% FicheActionEducative obj = (FicheActionEducative)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %>

<h1><%= obj.getTitle() %></h1>