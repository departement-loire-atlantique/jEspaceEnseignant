<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="fr.cg44.plugin.socle.SocleUtils"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.taglib.card.*" %>
<%@ include file='/jcore/media/mediaTemplateInit.jspf' %>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%><%

  if (data == null) {
  return;
}

Fiche obj = (Fiche) data;

%>

<section class="ds44-card ds44-js-card ds44-card--verticalPicture">
    <jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
        <% CarouselElement image = (CarouselElement) channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
        <picture class="ds44-container-imgRatio"> <img
            src="<%=image.getImage()%>" alt="" class="ds44-imgRatio" /> 
        </picture>
    </jalios:if>

    <div class="ds44-card__section">
        <p role="heading" aria-level="2" class="ds44-card__title">
            <jalios:link data="<%= obj %>" css="ds44-card__globalLink">
                <%=obj.getTitle()%>
            </jalios:link>
        </p>

        <jalios:if predicate="<%= Util.notEmpty(obj.getDateDeVie()) && Util.notEmpty(obj.getDateDeMort()) %>">
            <p class="ds44-cardDate">
                Du 
                <jalios:date date='<%= obj.getDateDeVie() %>' format='<%= "long" %>'/> 
                au 
                <jalios:date date='<%= obj.getDateDeMort() %>' format='<%= "long" %>'/> 
            </p>
        </jalios:if>

        <jalios:if predicate="<%= Util.notEmpty(obj.getSite(loggedMember)) %>">
            <jalios:foreach collection="<%= obj.getSite(loggedMember) %>" type="Category" name="itCategory" >
                <p class="ds44-cardLocalisation ds44-docListElem"> 
                    <i class="icon icon-marker ds44-docListIco" aria-hidden="true"></i>
                    <%= itCategory.getName() %> 
                </p>
            </jalios:foreach>
        </jalios:if>

        <i class="icon icon-arrow-right ds44-cardArrow" aria-hidden="true"></i>
    </div>
</section>
