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
        <section>
            <div class="grid-12-small-1">
                <div class="col-7-small-1">
                    <h2 class="h2-like" id="idTitre2"><%=fiche.getTitle(userLang)%></h2>
                    <jalios:wysiwyg truncateLength="500" truncateSuffix="...">
                        <%=fiche.getDescription(userLang)%>
                    </jalios:wysiwyg>
                </div>
                <div class="col-5-small-1">
                    <jalios:if predicate="<%=Util.notEmpty(img)%>">
                        <ds:figurePicture format="principale"
                            pub="<%=fiche%>" image="<%=img.getImage()%>"
                            imageMobile="<%=img.getImageMobile()%>"
                            legend="<%=img.getImageLegend(userLang)%>"
                            copyright="<%=img.getImageCopyright(userLang)%>" />
                    </jalios:if>
                    <a href="<%=fiche.getDisplayUrl(userLocale)%>"
                        class="ds44-fullWBtn ds44-btnStd ds44-btn--invert">
                        <span class="ds44-btnInnerText">
                            Découvrez le site </span> <i
                        class="icon icon-long-arrow-right"
                        aria-hidden="true"></i>
                    </a>
                </div>
            </div>
        </section>
    </jalios:foreach>
</article>
