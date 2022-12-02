<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%
ListeDeContenus obj = (ListeDeContenus) request.getAttribute(PortalManager.PORTAL_PUBLICATION);

Category sites = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.contenu.sites.cat.root"));
Category expositions = channel.getCategory(channel.getProperty("jcmsplugin.espaceEnseignant.contenu.expositions.cat.root"));

String title = obj.getLibelleTitre(userLang);
if (Util.isEmpty(title)) {
    title = obj.getTitle(userLang);
}
%>

<article class="ds44-container-large listedecontenus">
    <ds:titleSimple pub="<%=obj%>" title="<%=title%>" breadcrumb="true"></ds:titleSimple>
    <jalios:foreach name="itContent" type="Content" array="<%=obj.getContenus()%>">
        <%
        if (!(itContent instanceof FicheSiteExpo)) {
            return;
        }
        FicheSiteExpo fiche = (FicheSiteExpo) itContent;

        %>
		<jalios:buffer name="image">

		      <jalios:if predicate="<%=Util.notEmpty(fiche.getImagePrincipale())%>">
		          <ds:figurePicture format="principale" imgCss="ds44-w100 ds44-imgRatio"
		                            pub="<%=fiche%>" image="<%=fiche.getImagePrincipale()%>"
		                            imageMobile="<%=fiche.getImageMobile()%>"
		                            legend="<%=fiche.getLegende(userLang)%>"
		                            copyright="<%=fiche.getCopyright(userLang)%>"
		                            pictureCss="ds44-legendeContainer ds44-container-imgRatio" />
		       </jalios:if>
		       <a href="<%=fiche.getDisplayUrl(userLocale)%>"
		          class="ds44-btnStd ds44-btn--invert mtm ds44-w100 ds44-bntALeft">
		       <span class="ds44-btnInnerText">
		       <jalios:select>
			       <jalios:if predicate='<%= fiche.getCategorySet().contains(expositions) %>'>
			         <%= glp("jcmsplugin.espaceEnseignant.site.decouvrezexposition") %></span>
			       </jalios:if>
			       <jalios:default>
                     <%= glp("jcmsplugin.espaceEnseignant.site.decouvrezsite") %></span>			       
			       </jalios:default>
		       </jalios:select>
		       <i class="icon icon-long-arrow-right" aria-hidden="true"></i>
		       </a>

		</jalios:buffer>
        
        <jalios:buffer name="texte">
                <h2 class="h2-like underline" id="idTitre2"><%=fiche.getTitle(userLang)%></h2>
<%--                        <jalios:if predicate="<%= Util.notEmpty(fiche.getIconeSite()) %>"><%
                        for(int i = 0; i < fiche.getIconeSite().length; i++) { %>
                        <p class="ds44-docListElem">
                           <i class="ds44-docListIco icon <%= fiche.getIconeSite()[i] %>" aria-hidden="true"></i>
                           <span class="mtm"><%= fiche.getLibelleIconeSite()[i] %></span>
                        </p><%
                        } %>
                        </jalios:if>  --%>
                        <jalios:if predicate='<%= fiche.getCategorySet().contains(expositions) && (Util.notEmpty(fiche.getDateDeDebut()) || Util.notEmpty(fiche.getDateDeFin())) %>'>
                            <div class="ds44-docListElem mtm"><i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
                            <jalios:if predicate="<%= Util.notEmpty(fiche.getDateDeDebut())%>">
                            Du&nbsp;<jalios:date date="<%= fiche.getDateDeDebut() %>" format="long"/>
                            </jalios:if>
                            <jalios:if predicate="<%= Util.notEmpty(fiche.getDateDeFin())%>">
                            &nbsp;au&nbsp;<jalios:date date="<%= fiche.getDateDeFin() %>" format="long"/>
                            </jalios:if>
                            </div>
                        </jalios:if>
                        <jalios:if predicate='<%= fiche.getCategorySet().contains(sites) && Util.notEmpty(fiche.getComplementTransport()) %>'>
                            <div class="ds44-docListElem mtm"><i class="icon icon-map ds44-docListIco" aria-hidden="true"></i>
                            <jalios:wysiwyg><%= fiche.getComplementTransport(userLang)%></jalios:wysiwyg>
                            </div>
                        </jalios:if>
                        <jalios:wysiwyg truncateLength="500" truncateSuffix="...">
                            <%=fiche.getDescription(userLang)%>
                        </jalios:wysiwyg>
        </jalios:buffer>

        <jalios:select>
	       <jalios:if predicate="<%= itCounter % 2 == 0 %>">
           <section class="ds44-contenuArticle ds44-mtb5">
                <div class="ds44-inner-container ">
                   <div class="ds44-grid12-offset-1 grid-10-small-1 grid-10-medium-1">
                    <div class="col-4">
                        <%= image %>
                    </div>
                    <div class="col-6 ds44--xl-padding-l">                    
                        <%= texte %>
                    </div>               
                   </div>
                </div>
             </section>     
	       </jalios:if>
            <jalios:default>
            <section class="ds44-contenuArticle">
            <div class="ds44-inner-container ">
               <div class="ds44-grid12-offset-1 grid-10-small-1 grid-10-medium-1">
                <div class="col-6">
                    <%= texte %>
                 </div>
                 <div class="col-4 ds44--xl-padding-l">                    
                       <%= image %>
                 </div>
               </div>
               </div>
            </section>           
     </jalios:default>
     </jalios:select>
    </jalios:foreach>
</article>
