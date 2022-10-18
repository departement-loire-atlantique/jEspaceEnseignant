<%@ include file='/jcore/doInitPage.jspf'%>
<%

%><%@ page import="com.jalios.jcms.taglib.card.*"%>
<%

%><%@ include file='/jcore/media/mediaTemplateInit.jspf'%>
<%
if (data == null) {
	return;
}

Fiche obj = (Fiche) data;
%>
<section 
	class="ds44-card ds44-js-card ds44-card--verticalPicture ds44-darkContext vignette">

	<%-- Vignette Image --%>
	<jalios:if predicate="<%= Util.notEmpty(obj.getVisuel()) %>">
        <% CarouselElement image = (CarouselElement) channel.getData(CarouselElement.class, obj.getVisuel().getId()); %>
        <picture class="ds44-container-imgRatio"> <img
            src="<%=image.getImage()%>" alt="" class="ds44-imgRatio" /> 
        </picture>
    </jalios:if>

	<%-- Vignette Header --%>
	<div class="vignette-header ds44-flex-container">
		<jalios:if predicate="<%= Util.notEmpty(obj.getTypologie(loggedMember)) %>">
			<jalios:foreach
				collection="<%=obj.getTypologie(loggedMember)%>"
				type="Category" name="itCategory">
				<div class="ds44-colLeft">
					<p class="vignette-header-title ds44-colLeft">
						<%=itCategory.getParent().getName()%>
					</p>
				</div>
			</jalios:foreach>
		</jalios:if>
		<a href=# class="ds44-colRight"> <i class="icon icon-star-empty"
			aria-hidden="true"></i>
		</a>
	</div>

	<%-- Vignette Body --%>
	<div class="ds44-card__section vignette-body">

		<div class="ds44-innerBoxContainer">
			<p role="heading" aria-level="2" class="ds44-cardTitle ds44-card__title">
			
				<jalios:link data="<%= obj %>" css="ds44-card__globalLink">
					<%=obj.getTitle()%>
				</jalios:link>
				<%-- <a href="#" class="ds44-card__globalLink"><%=obj.getTitle()%></a> --%>
			</p>
			<%@ include
				file='/plugins/EspaceEnseignantPlugin/jsp/vignette/vignetteContent.jspf'%>
		</div>
	</div>
</section>