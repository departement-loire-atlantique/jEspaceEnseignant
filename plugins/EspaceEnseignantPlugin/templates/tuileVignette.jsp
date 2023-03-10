<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

Set<String> panierSet = (Set<String>) session.getAttribute("panier"); 

PortalElement portlet = (PortalElement)request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
boolean isThemeClair = false;
if (portlet instanceof PortletCarousel) {
  isThemeClair = ((PortletCarousel)portlet).getSelectionDuTheme().equals("tuileVerticaleLight");
}

Fiche obj = (Fiche) data;

%>
<section class="ds44-card ds44-js-card ds44-card--contact ds44-bgGray ds44-card--verticalPicture <%= isThemeClair ? "ds44-darkContext" : "" %>">
    <%-- Vignette Image --%>
    <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/image/imageFiche.jspf' %>
    
    <div class="ds44-card__section vignette">
    <%-- Favoris --%>
        <p class="ds44-cardSelect pa0 ma0">
            <button data-select-button-id='<%= "search-result-" + obj.getId() %>' class='ds44-js-select-button <%= (Util.isEmpty(panierSet) || !panierSet.contains(obj.getId())) ? "" : "is-select" %>' data-url="plugins/SoclePlugin/jsp/panier/select-enabled.jsp?pubId=<%= obj.getId() %>" data-titles='{ "enabled": "Désélectionner <%= obj.getTitle() %>", "disabled": "Sélectionner <%= obj.getTitle() %>"}' data-icons='{ "enabled": "icon-star-full", "disabled": "icon-star-empty"}' type="button" aria-describedby='card_<%= obj.getId()%>'>
                <i class='icon icon-star-empty' data-icon aria-hidden="true"></i>
                <span class="visually-hidden" data-entitled><%= glp("jcmsplugin.socle.selectionner") %></span>
            </button>
        </p>
        
        <%-- Vignette Header --%>
        <div class="vignette-header ds44-flex-container">
          <jalios:if predicate="<%= Util.notEmpty(obj.getTypologie(loggedMember)) %>">
                <jalios:foreach collection="<%= obj.getTypologie(loggedMember) %>" type="Category" name="itCategory" >
                  <div class="ds44-colLeft">
                    <p class="vignette-header-title ds44-colLeft"> 
                        <%= itCategory.getParent().getName() %> 
                    </p>
                    </div>
                </jalios:foreach>
          </jalios:if>
        </div>
        
        <%-- Vignette Body --%>
        <div class="ds44-card__section vignette-body">
          <div class="ds44-innerBoxContainer">
            <p role="heading" aria-level="2" class="ds44-card__title">
                <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                    <%=obj.getTitle()%>
                </jalios:link>
            </p>
              <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/vignette/vignetteContent.jspf' %>
          </div>
        </div> 
                        
    </div>
</section>
