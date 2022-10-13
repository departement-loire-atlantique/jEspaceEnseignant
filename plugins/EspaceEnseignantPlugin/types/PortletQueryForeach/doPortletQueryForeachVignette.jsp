<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<% 
jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
%>

<div class="ds44-container-large">
  <div class="grid-12-small-1">
  <%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
    <jalios:media data='<%=itPub %>' template='card' />
  <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
  </div>
</div>