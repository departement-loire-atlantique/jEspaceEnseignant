<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%
ListeDeContenus obj = (ListeDeContenus) request.getAttribute(PortalManager.PORTAL_PUBLICATION);

String title = obj.getLibelleTitre(userLang);
if (Util.isEmpty(title)) {
    title = obj.getTitle(userLang);
}
%>
<article class="ds44-container-large">
    <ds:titleSimple pub="<%=obj%>" title="<%=title%>" breadcrumb="true"></ds:titleSimple>

    <jalios:foreach name="itContent" type="Content"
        array="<%=obj.getContenus()%>">
        <%
        if (!(itContent instanceof Fiche)) {
            continue;
        }
        Fiche fiche = (Fiche) itContent;
        CarouselElement img = fiche.getVisuel();
        %>
        <jalios:select>
	    <jalios:if predicate="<%= itCounter % 2 == 0 %>">
             <section class="ds44--xxl-padding-tb">
	            <div class="grid-12-small-1">
	                <div class="col-7-small-1">
	                    <h2 class="h2-like" id="idTitre2"><%=fiche.getTitle(userLang)%></h2>
                        <jalios:if predicate="<%= Util.notEmpty(fiche.getIconeSite()) %>"><%
                        for(int i = 0; i < fiche.getIconeSite().length; i++) { %>
                        <p class="ds44-docListElem">
                           <i class="ds44-docListIco icon <%= fiche.getIconeSite()[i] %>" aria-hidden="true"></i>
                           <span class="mtm"><%= fiche.getLibelleIconeSite()[i] %></span>
                        </p><%
                        } %>
                        </jalios:if>
	                    <jalios:wysiwyg truncateLength="500" truncateSuffix="...">
	                        <%=fiche.getDescription(userLang)%>
	                    </jalios:wysiwyg>
	                </div>
	                <div class="col-5-small-1 ds44--xl-padding-l">
	                    <jalios:if predicate="<%=Util.notEmpty(img)%>">
	                        <ds:figurePicture format="principale"
	                            pub="<%=fiche%>" image="<%=img.getImage()%>"
	                            imageMobile="<%=img.getImageMobile()%>"
	                            legend="<%=img.getImageLegend(userLang)%>"
	                            copyright="<%=img.getImageCopyright(userLang)%>"
	                            figureCss="ds44-mb-std" />
	                    </jalios:if>
	                    <a href="<%=fiche.getDisplayUrl(userLocale)%>"
	                        class="ds44-fullWBtn ds44-btnStd ds44-btn--invert">
	                        <span class="ds44-btnInnerText">
	                            <%= glp("jcmsplugin.espaceEnseignant.site.decouvrez") %></span> <i
	                        class="icon icon-long-arrow-right"
	                        aria-hidden="true"></i>
	                    </a>
	                </div>
	            </div>
	        </section>       
	    </jalios:if>
        <jalios:default>
             <section class="ds44--xxl-padding-tb">
	            <div class="grid-12-small-1">
	                <div class="col-5-small-1">
	                    <jalios:if predicate="<%=Util.notEmpty(img)%>">
	                        <ds:figurePicture format="principale"
	                            pub="<%=fiche%>" image="<%=img.getImage()%>"
	                            imageMobile="<%=img.getImageMobile()%>"
	                            legend="<%=img.getImageLegend(userLang)%>"
	                            copyright="<%=img.getImageCopyright(userLang)%>"
	                            figureCss="ds44-mb-std" />
	                    </jalios:if>
	                    <a href="<%=fiche.getDisplayUrl(userLocale)%>"
	                        class="ds44-fullWBtn ds44-btnStd ds44-btn--invert">
	                        <span class="ds44-btnInnerText">
	                            <%= glp("jcmsplugin.espaceEnseignant.site.decouvrez") %></span> <i
	                        class="icon icon-long-arrow-right"
	                        aria-hidden="true"></i>
	                    </a>
	                </div>
	                <div class="col-7-small-1 ds44--xl-padding-l">
	                    <h2 class="h2-like" id="idTitre2"><%=fiche.getTitle(userLang)%></h2>
                        <jalios:if predicate="<%= Util.notEmpty(fiche.getIconeSite()) %>"><%
                        for(int i = 0; i < fiche.getIconeSite().length; i++) { %>
                        <p class="ds44-docListElem">
                           <i class="ds44-docListIco icon <%= fiche.getIconeSite()[i] %>" aria-hidden="true"></i>
                           <span class="mtm"><%= fiche.getLibelleIconeSite()[i] %></span>
                        </p><%
                        } %>
                        </jalios:if>
	                    <jalios:wysiwyg truncateLength="500" truncateSuffix="...">
	                        <%=fiche.getDescription(userLang)%>
	                    </jalios:wysiwyg>
	                </div>                
	            </div>
	        </section>         
        </jalios:default>
        </jalios:select>
    </jalios:foreach>
</article>
