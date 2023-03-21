<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%

Set<String>         panier      = (Set<String>) session.getAttribute("panier");
PortletJsp          obj         = (PortletJsp)portlet; 
Set<Publication>    panierSet   = JcmsUtil.idCollectionToDataTreeSet(panier, Publication.class); 
String              urlAction   = ServletUtil.getResourcePath(request) + "?id=" + portlet.getId();
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
                                <button class="" type="button" data-target="#confirmAllSup" data-js="ds44-modal">
                                    <i class="icon icon-cross" aria-hidden="true"></i>
                                    <span class="ds44-btnInnerText">
                                        <%= glp("jcmsplugin.espaceEnseignant.favoris.allSuppr") %>
                                    </span>
                                </button>
                        </div>
                        <section class="ds44-modal-container" id="confirmAllSup" aria-hidden="true" role="dialog" aria-modal="true" aria-labelledby="overlay-test-title">
                            <div class="ds44-modal-box">
                                <button class="ds44-btnOverlay--modale ds44-btnOverlay--closeOverlay" type="button" title="Fermer la boîte de dialogue : <%= glp("jcmsplugin.espaceEnseignant.favoris.allSuppr") %>" data-js="ds44-modal-action-close"><i class="icon icon-cross icon--xlarge" aria-hidden="true"></i><span class="ds44-btnInnerText--bottom">Fermer</span></button>
                                <h1 id="overlay-confirmAllSup-title" class="h2-like"><%= glp("jcmsplugin.espaceEnseignant.favoris.allSuppr") %></h1>
                                <div class="ds44-modal-gab">
                                    <form method="GET" action="plugins/EspaceEnseignantPlugin/jsp/panier/select-enabled.jsp" >
                                        <input type="hidden" name="pubId" value="all" data-technical-field />
                                        <input type='hidden' name='redirect' value='<%= urlAction %>' data-technical-field />
                                        <button type="submit" class="ds44-btnStd ds44-btn--invert" >
                                            <span class="ds44-btnInnerText">Confirmer</span>
                                        </button>
                                        <button class="ds44-btnStd ds44-btnOverlay--closeOverlay" type="button" 
                                            data-js="ds44-modal-action-close">
                                            <span class="ds44-btnInnerText">Annuler</span>
                                        </button>
                                    </form>
                                </div>
                                
                            </div>
                        </section>
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
                                    <td>
                                        <jalios:link data="<%= itPub %>">
                                            <%= itPub.getTitle(userLang) %>
                                        </jalios:link>
                                    </td>
                                    <td>
                                        <form method="GET" action="plugins/EspaceEnseignantPlugin/jsp/panier/select-enabled.jsp" >
                                            <input type="hidden" name="pubId" value="<%= itPub.getId() %>" data-technical-field />
                                            <input type='hidden' name='redirect' value='<%= urlAction %>' data-technical-field />
                                            <button type="submit">
                                                <i class="icon icon-cross" aria-hidden="true"></i>
                                                <span class="visually-hidden"><%= glp("jcmsplugin.espaceEnseignant.fiche.SupprSel") %></span>
                                            </button>
                                        </form>

                                </tr>
                            </jalios:foreach>
                            </tbody>
                        </table>
                    </article>

                    <div class="col-1 grid-offset ds44-hide-tinyToLarge"></div>

                    <aside class="col-4 ds44-js-aside-summary ds44-mb35" data-component-aside-summary-uuid="336ea052-d1f2-40d2-9e4b-4ca2ef26a77e">
                        <section class="ds44-box ds44-theme " data-component-aside-summary-uuid="d5683aa7-f8c9-4701-b7da-40649d9d0f82" style="position: static;">
                            <div class="ds44-innerBoxContainer ">
                                <h2 class="h4-like ds44-mb2"><%= glp("jcmsplugin.espaceEnseignant.favoris.maSelection") %></h2>
                                <ul class="ds44-list">
                                    <li class="ds44-docListElem">
                                        <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/modal/modalToutesLesFiches.jspf'%>
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