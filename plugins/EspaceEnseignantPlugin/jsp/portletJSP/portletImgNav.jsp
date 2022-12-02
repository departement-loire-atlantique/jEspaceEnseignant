<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ include
    file='/types/AbstractCollection/doIncludePortletCollection.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%
PortletJspCollection obj = (PortletJspCollection) portlet;
%>
<section class="ds44-container-large ds44-homepage-container ds44-homepage-container--gp ds44--xxl-padding-b">
    <div class="grid-12-small-1">
        <div class="col-8-small-1 col-8-large-7 ds44-mb2 ds44-homepage-noCarrousel">
            <%=getPortlet(bufferMap, "diaporama")%>
        </div>
        <div class="col-4-small-1 col-4-large-5 ds44-mb2 ds44-bgGray ds44--m-padding-tb">
            <%=getPortlet(bufferMap, "nav")%>
        </div>
    </div>
</section>
