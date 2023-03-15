<%@page import="fr.digiwin.module.EspaceEnseignant.exportZip.ExportZip"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

String idObjet = (String) session.getAttribute("idObjet");

Set<String>         panier      = (Set<String>) session.getAttribute("panier");
Set<Publication>    panierSet   = JcmsUtil.idCollectionToDataTreeSet(panier, Publication.class); 

if (Util.notEmpty(panierSet)) {
  ExportZip zip = new ExportZip();
  zip.exportPublicationsZip(panierSet).sendToDownloadUrl(request, response);
}

%>	