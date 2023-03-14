<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jsp'%>
<%@ include file='/jcore/portal/doPortletParams.jsp' %>

<section class="ds44-container-large ds44--xl-padding-tb">
	<div class="grid-12-small-1 ds44-hasGutter-xxl">
	    <div class="col-2-small-1">
			<picture class="ds44-logo ds44-mb3 ds44-mobile-reduced-mt ds44-mobile-reduced-pt">
			    <img src='<%= channel.getProperty("jcmsplugin.socle.site.src.logofooter") %>' alt="Loire-Atlantique" />
			    <img class="logo-footer" src='<%= channel.getProperty("jcmsplugin.espaceEnseignant.site.src.logo-gpla") %>' alt="Grand Patrimoine" />
			</picture>
	    </div>
	    <div class="col-10-small-1">	    
			<% 
			Category catContact = channel.getCategory("$id.jcmsplugin.espaceEnseignant.contact.cat.root"); 
			%> 
			<jalios:if predicate="<%= Util.notEmpty(catContact) %>">
				<h3> <%= catContact.getName() %> </h3>
				<p> <%= catContact.getDescription() %> </p>
				<jalios:link data="<%= catContact %>">
					<button class="ds44-btnStd margin-txt">
						<span class="ds44-btnInnerText"><%= glp("jcmsplugin.espaceEnseignant.footer.btn-contact") %></span>
						<i class="icon icon-long-arrow-right" aria-hidden="true"></i>
					</button>
				</jalios:link>
			</jalios:if>
	    </div>
	</div>
</section>
