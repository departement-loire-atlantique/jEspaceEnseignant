<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%><%
%><%@page import="com.jalios.jcms.taglib.menu.MenuInfoFilter"%><%
%><%@page import="com.jalios.jcms.portlet.navigate.CategoryMenuInfo"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%@ include file="/types/PortletNavigate/doInitPortletNavigate.jspf" %><%

boolean display = rootCategory != null && rootCategory.isNode(loggedMember);
if (!display && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

int verticalCounter = Util.toInt(Util.getString(request.getAttribute("verticalCounter"), ""), 0); 
request.setAttribute("verticalCounter", "" + (verticalCounter + 1));

int maxDepthLevel = box.getLevels() - 1;

boolean isSmall = Util.notEmpty(request.getParameter("size")) ? true : false;
boolean isExtraSmall = (Util.notEmpty(request.getParameter("size")) && request.getParameter("size").equals("extrasmall")) ? true : false;
boolean colorTheme = Util.notEmpty(request.getParameter("colorTheme")) ? true : false;
String paddingVignette = (Util.notEmpty(request.getParameter("padding")) && request.getParameter("padding").equals("small")) ? "ds44--s-padding" : "";
String styleVignette = "";
if(isExtraSmall){
  styleVignette = "--dim80";
}else if(isSmall){
  styleVignette = "--dim110";
}

%>
<div class="verticalMenu periodeMenu">
    <h2 class="h2-like"><%= box.getDisplayTitle(userLang) %></h2>
  <jalios:menu id="<%= rootCategory.getId()  %>" name='<%= "vertical-" + verticalCounter %>' menuResource="vertical">
    <%
    MenuInfoFilter menuInfoFilter = (MenuInfoFilter) request.getAttribute(MenuInfoFilter.MENU_INFO_FILTER_ATTR);
    MenuInfo menuInfo = new CategoryMenuInfo(rootCategory, ctxCategories, box.getNavigatePortlet(), maxDepthLevel, -1, null, menuInfoFilter, userLang, loggedMember, request);
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    for (MenuInfo child : menuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        Category itCat = channel.getCategory(child.getId());
        String[] paramNames = { "cidsform-element-fde_5280fde_5278[value]", "cidsform-element-fde_5280fde_5278[text]"};
        String[] paramValues = { itCat.getId(), itCat.getName() }; %>
		<section class="ds44-card ds44-js-card ds44-card--horizontal">
		  <div class="ds44-flex-container">
		      <jalios:if predicate="<%= Util.notEmpty(itCat.getImage()) %>">
		          <div class="ds44-card__section--horizontal--img<%= styleVignette %> <%= colorTheme ? "ds44-theme" : ""%> <%= paddingVignette %>">
		              <picture class="ds44-container-imgRatio ds44-container-imgRatio--carre">
		              <img class="ds44-imgRatio" src="<%= itCat.getImage() %>" alt=''>
		              </picture>
		          </div>
		      </jalios:if>                    
			  <div class="ds44-card__section--horizontal ds44-flex-valign-center ds44-flex-align-center">
			      <p role="heading" aria-level="2" class="ds44-card__title">
			      <jalios:link id="fde_5286" paramNames='<%= paramNames %>' paramValues='<%= paramValues %>' css="ds44-card__globalLink">
			      <%= itCat.getName() %>
			      </jalios:link>
			      </p>
			  </div> 
	      </div>
        </section><%         
      }
    } %>
  </jalios:menu>
</div>
