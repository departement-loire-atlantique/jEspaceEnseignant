<%@ include file="/jcore/doInitPage.jspf"%>
<%@ include file="/jcore/portal/doPortletParams.jspf"%>
<%
PortletQueryForeach box = (PortletQueryForeach) portlet;
%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf"%>
<%@ include file="/types/PortletQueryForeach/doSort.jspf"%>

<%
jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
%>

<div class="ds44-container-large">
	<div class="mod--hidden ds44-list swipper-carousel-wrap ds44-posRel"
		data-nb-visible-slides="4">
		<div class="swiper-container">
			<ul
				class="swiper-wrapper ds44-list grid-4-small-1 has-gutter-l ds44-carousel-swiper">
				<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf"%>
				<jalios:media data='<%=itPub%>' template='vignetteCarrousel' />
				<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf"%>
				<%@ include file="/types/PortletQueryForeach/doPager.jspf"%>
			</ul>
		</div>
		<button class="swiper-button-prev swiper-button-disabled"
			type="button">
			<i class="icon icon-left" aria-hidden="true"></i> <span
				class="visually-hidden"></span>
		</button>
		<button class="swiper-button-next swiper-button-disabled"
			type="button">
			<i class="icon icon-right" aria-hidden="true"></i> <span
				class="visually-hidden"></span>
		</button>
	</div>
</div>