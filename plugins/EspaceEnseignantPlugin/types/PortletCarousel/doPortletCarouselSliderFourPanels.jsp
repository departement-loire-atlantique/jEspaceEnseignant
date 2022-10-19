<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ include file='/jcore/portal/doPortletParams.jspf'%><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>

<%
String cssSliderSize = "grid-4-small-1";
String sliderAmounts = "4";
String template = "vignetteCarrousel";
%>

<%@ include file="/plugins/EspaceEnseignantPlugin/jsp/types/PortletCarousel/doPortletCarouselBoxDisplay.jspf"%>