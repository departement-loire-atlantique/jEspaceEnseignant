<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%><%
%><%@page import="com.jalios.jcms.taglib.menu.MenuInfoFilter"%><%
%><%@page import="com.jalios.jcms.portlet.navigate.CategoryMenuInfo"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%@ include file="/types/PortletNavigate/doInitPortletNavigate.jspf" %>
<% jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/recherche.css"); %><%

boolean display = rootCategory != null && rootCategory.isNode(loggedMember);
if (!display && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}
%>

<section id="en1clic" class="ds44-mlr35 ds44-mtb2 ds44-mobile-reduced-mar periodeMenu">
    <h2 class="h2-like" id="titreEn1Clic"><%= box.getDisplayTitle(userLang) %></h2>
    <jalios:foreach name="itCat" type="Category" collection="<%= rootCategory.getChildrenSet() %>">
	<%
	String[] paramNames = { "cidsform-element-fde_5280fde_5278[value]", "cidsform-element-fde_5280fde_5278[text]"};
	String[] paramValues = { itCat.getId(), itCat.getName() };
	%>
        <section class="ds44-card ds44-js-card ds44-card--horizontal ds44-darkContext ds44-tiny-reducedFont">
        <div class="ds44-flex-container ds44-flex-valign-center">
            <div class="ds44-card__section--horizontal--img--dim110">
                <picture class="ds44-container-imgRatio ds44-container-imgRatio--carre">
                    <img src="<%= itCat.getImage() %>" alt="" class="ds44-imgRatio" />
                </picture>
            </div>
            <div class="ds44-card__section--horizontal">
                <p role="heading" aria-level="3" class="ds44-card__title">
                <jalios:link id="fde_5286" paramNames='<%= paramNames %>' paramValues='<%= paramValues %>' css="ds44-card__globalLink">
                <%= itCat.getName() %>
                </jalios:link>
                </p>
                <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
            </div>
        </div>
    </section>
    </jalios:foreach>
</section>
