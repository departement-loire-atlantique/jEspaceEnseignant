<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%

PortletJsp          obj         = (PortletJsp)portlet; 
Set<String>         panier      = (Set<String>) session.getAttribute("panier");
Set<Publication>    panierSet   = JcmsUtil.idCollectionToDataTreeSet(panier, Publication.class); 

%>
<article class="ds44-container-large favoris">
    <ds:titleNoImage title="<%= obj.getTitle(userLang) %>" breadcrumb="true" ></ds:titleNoImage>
            
    <div class="ds44-mt3 ds44-mb5 ds44--xl-padding-t" >
        <div class="ds44-inner-container">
            <jalios:select>
            <jalios:if predicate="<%= Util.notEmpty(panierSet) && panierSet.size() > 0 %>">
            <div class="grid-12-medium-1 grid-12-small-1" >
                <article class="col-7 ds44-contenuDossier">
                    <h2 class="h4-like ds44-mb2"><%= glp("jcmsplugin.espaceEnseignant.favoris.find") %></h2>
                        <div class="ds44-txtRight">
                            <button><i class="icon icon-cross" aria-hidden="true"></i>
                                    <span class="ds44-btnInnerText"><%= glp("jcmsplugin.espaceEnseignant.favoris.allSuppr") %></span>
                            </button>
                        </div>
                        <table class="selection ds44-mt2">
                            <caption class="visually-hidden"><%= glp("jcmsplugin.espaceEnseignant.favoris.find") %></caption>

                            <thead>
                                <tr>
                                    <th scope="col"><%= glp("jcmsplugin.espaceEnseignant.favoris.visuel") %></th>
                                    <th scope="col"><%= glp("jcmsplugin.espaceEnseignant.favoris.titre") %></th>
                                    <th scope="col"><%= glp("jcmsplugin.espaceEnseignant.favoris.action") %></th>
                                </tr>
                            </thead>

                            <tbody>
                            <jalios:foreach name="itPub" type="Publication" collection="<%= panierSet %>" >
                            <%
                            String imageId = "";
                            if (itPub instanceof Fiche) { 
                              Fiche fiche = (Fiche)itPub;
                              imageId = fiche.getVisuel().getId();
                            }
                            %>
                                <tr id="MyId<%= itPub.getId() %>">
                                    <td class="image">
                                        <jalios:if predicate="<%= Util.notEmpty(imageId)%>">
	                                        <% CarouselElement image = (CarouselElement)channel.getData(CarouselElement.class, imageId); %>
	                                        <picture class="ds44-container-imgRatio">
	                                           <img src="<%= image.getImage() %>" alt="<%= image.getImageLegend() %>" class="ds44-imgRatio contain" />
	                                        </picture>
                                        </jalios:if>
                                        <jalios:if predicate="<%= Util.isEmpty(imageId)%>">
                                            <picture class="ds44-container-imgRatio">
                                                <img src="images/jalios/layout/article.png" alt="" class="ds44-imgRatio"/>
                                            </picture>
                                        </jalios:if>
                                    </td>
                                    <td><%= itPub.getTitle(userLang) %></td>
                                    <td>
                                         <button data-select-button-id='<%= "search-result-" + itPub.getId() %>'
                                                onclick="suppression(this)"
                                                 class='ds44-js-select-button <%= (Util.isEmpty(panier) || !panier.contains(itPub.getId())) ? "" : "is-select" %>'
                                                 data-url="plugins/SoclePlugin/jsp/panier/select-enabled.jsp?pubId=<%= itPub.getId() %>"
                                                 data-titles='{ "enabled": "Désélectionner <%= itPub.getTitle() %>", "disabled": "Sélectionner <%= itPub.getTitle() %>"}'
                                                 data-icons='{ "enabled": "icon-cross", "disabled": "icon-star-empty"}'
                                                 type="button"
                                                 aria-describedby='card_<%= itPub.getId()%>'>
                                            <i class="icon icon-cross" aria-hidden="true"></i>
                                            <span class="visually-hidden"><%= glp("jcmsplugin.espaceEnseignant.fiche.SupprSel") %></span>
                                        </button>  
                                </tr>
                            </jalios:foreach>
                            </tbody>
                        </table>
                    </article>

                    <div class="col-1 grid-offset ds44-hide-tinyToLarge"></div>

                    <aside class="col-4 ds44-hide-tinyToLarge ds44-js-aside-summary ds44-mb35" data-component-aside-summary-uuid="336ea052-d1f2-40d2-9e4b-4ca2ef26a77e">
                        <section class="ds44-box ds44-theme " data-component-aside-summary-uuid="d5683aa7-f8c9-4701-b7da-40649d9d0f82" style="position: static;">
                            <div class="ds44-innerBoxContainer ">
                                <h2 class="h4-like ds44-mb2"><%= glp("jcmsplugin.espaceEnseignant.favoris.maSelection") %></h2>
                                <ul class="ds44-list">
                                    <li class="ds44-docListElem">
                                        <i class="icon icon-pdf ds44-docListIco" aria-hidden="true"></i>
                                        <a href="#" onclick="javascript:window.print()" data-link-has-select="" target="_blank" title="PDF"><%= glp("jcmsplugin.espaceEnseignant.favoris.selection") %></a>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </aside>

                </div>
                </jalios:if>
                <jalios:default>
                  <jalios:portletBoxNoResult />
                </jalios:default>
                </jalios:select>
            </div>
        </div>
    </article>

<script>
function suppression(event) {
    event.closest("TR").remove();
}
</script>