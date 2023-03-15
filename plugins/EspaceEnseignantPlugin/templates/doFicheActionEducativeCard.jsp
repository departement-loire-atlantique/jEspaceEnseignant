<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.card.*" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

if (data == null) {
  return;
}

FicheActionEducative obj = (FicheActionEducative) data;

Set<String> panierSet = (Set<String>) session.getAttribute("panier"); 

List<Category> categorySet = Arrays.asList(obj.getCategories(loggedMember));

Category typologie = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.typologie.cat.root"));
Category niveaux = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.niveaux.cat.root"));
Category periode = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.periode.cat.root"));
Category sites = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.sites.cat.root"));

List<Category> typologieSet = new ArrayList<>();
List<Category> niveauxSet = new ArrayList<>();
List<Category> periodeSet = new ArrayList<>();
List<Category> sitesSet = new ArrayList<>();

String image = "";
if (Util.notEmpty(obj.getImagePrincipale())) {
  image = obj.getImagePrincipale();
} else if (Util.notEmpty(obj.getImageMobile())) {
  image = obj.getImageMobile();
}
      
for(Category itCat : categorySet) {
  if (itCat.hasAncestor(typologie)){
    typologieSet.add(itCat);
  } else if (itCat.hasAncestor(niveaux)) {
    niveauxSet.add(itCat);
  } else if (itCat.hasAncestor(periode)) {
    periodeSet.add(itCat);
  } else if (itCat.hasAncestor(sites)) {
    sitesSet.add(itCat);
  }
}

PortalElement portlet = (PortalElement)request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
boolean isThemeClair = false;
if (portlet instanceof PortletCarousel) {
  isThemeClair = ((PortletCarousel)portlet).getSelectionDuTheme().equals("tuileVerticaleLight");
}
%>


<section class="ds44-card ds44-js-card ds44-card--contact ds44-card--verticalPicture <%= isThemeClair ? "ds44-darkContext" : "" %>">
        <%-- Vignette Image --%>
		<jalios:if predicate="<%= Util.notEmpty(image) %>">
		    <picture class="ds44-container-imgRatio">
		        <img src="<%= image %>" alt="<%= obj.getLegende(userLang) %>" class="ds44-imgRatio"/>
		    </picture>
		</jalios:if>
		<jalios:if predicate="<%= Util.isEmpty(image) %>">
            <picture class="ds44-container-imgRatio">
                <img src="images/jalios/layout/article.png" alt="<%= obj.getLegende(userLang) %>" class="ds44-imgRatio"/>
            </picture>
		</jalios:if>
		
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
          <jalios:if predicate="<%= Util.notEmpty(typologieSet) %>">
                <jalios:foreach collection="<%= typologieSet %>" type="Category" name="itCategory" >
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
			<div class="vignette-content">
			    <jalios:if predicate="<%= Util.notEmpty(sitesSet) %>">
			        <jalios:foreach collection="<%= sitesSet %>" type="Category" name="itCategory" >
			            <p class="ds44-docListElem small-txt"> 
			            <i class="icon icon-marker ds44-docListIco" aria-hidden="true"></i>
			            <%= itCategory.getName() %> </p>
			        </jalios:foreach>
			    </jalios:if>
			    <jalios:if predicate="<%= Util.notEmpty(niveauxSet) %>">
			        <jalios:foreach collection="<%=niveauxSet %>" type="Category" name="itCategory" >
			            <p class="ds44-docListElem small-txt"> 
			            <i class="icon icon-user-group ds44-docListIco" aria-hidden="true"></i>
			            <%= itCategory.getName() %> </p>
			        </jalios:foreach>
			    </jalios:if>
			    <jalios:if predicate="<%= Util.notEmpty(periodeSet) %>">
			        <jalios:foreach collection="<%= periodeSet %>" type="Category" name="itCategory" >
			            <p class="ds44-docListElem small-txt"> 
			            <i class="icon icon-tag  ds44-docListIco" aria-hidden="true"></i>
			            <%= itCategory.getName() %> </p>
			        </jalios:foreach>
			    </jalios:if>  
			</div>
			<jalios:if predicate="<%= Util.notEmpty(typologieSet) %>">
			    <jalios:foreach collection="<%= typologieSet %>" type="Category" name="itCategory" >
			        <p class="ds44-docListElem small-txt vignette-type"> 
			            <%= itCategory.getName() %> 
			        </p>
			    </jalios:foreach>
			</jalios:if>  
          </div>
        </div>
        </div>

    </section>