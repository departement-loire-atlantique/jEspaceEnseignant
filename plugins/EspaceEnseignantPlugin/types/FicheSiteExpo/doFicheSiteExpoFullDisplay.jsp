<%@page import="com.jalios.jcms.handler.QueryHandler"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%
FicheSiteExpo obj = (FicheSiteExpo) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
%>
<%@ include file='/front/doFullDisplay.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<div
	class="fullDisplay Fiche <%=obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : ""%>"
	itemscope="itemscope">

	<%
	jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
	%>

	<jalios:buffer name="adresse">
		<jalios:if predicate="<%=Util.notEmpty(obj.getNdeVoie())%>">
			<%=obj.getNdeVoie(userLang)%>&nbsp;
    </jalios:if>
		<jalios:if predicate="<%=Util.notEmpty(obj.getLibelleDeVoie())%>">
			<%=obj.getLibelleDeVoie(userLang)%><br />
		</jalios:if>
		<jalios:if predicate="<%=Util.notEmpty(obj.getCs())%>">
			<%=obj.getCs(userLang)%><br />
		</jalios:if>
		<jalios:if predicate="<%=Util.notEmpty(obj.getCodePostal())%>">
			<%=obj.getCodePostal(userLang)%>&nbsp;
    </jalios:if>
		<jalios:if predicate="<%=Util.notEmpty(obj.getCommune())%>">
			<%=(obj.getCommune()).getTitle(userLang)%>&nbsp;
    </jalios:if>
		<jalios:if predicate="<%=Util.notEmpty(obj.getCedex())%>">
			<%=obj.getCedex(userLang)%>
		</jalios:if>
	</jalios:buffer>


	<section role="main" id="content">
		<article class="ds44-container-large">

			<%-- HEADER --%>
			<div class="ds44-lightBG ds44-posRel ds44--m-padding-b">
				<div
					class="ds44-inner-container ds44--xl-padding-t ds44--m-padding-b ds44-tablette-reduced-pt">
					<div class="ds44-grid12-offset-2">
						<%@ include
							file='/plugins/EspaceEnseignantPlugin/jsp/filAriane.jspf'%>
						<h1 class="h1-like mbs mts bold-txt">
							<%=obj.getTitle()%>
						</h1>
					</div>
				</div>
			</div>

			<section>
				<div class="ds44-inner-container ds44-xl-margin-tb">
					<div class="grid-12-small-1">
						<%-- CONTENU --%>
						<div class="col-7">
							<jalios:wysiwyg><%=obj.getDescription(userLang)%></jalios:wysiwyg>
						</div>

						<%-- BANDEAU INFO PRATIQUES --%>
						<div class="col-1 grid-offset ds44-hide-tiny-to-medium"></div>
						<aside class="col-4">
							<section class="ds44-box ds44-theme mbm">
								<ds:figurePicture format="principale" pub="<%=obj%>"
									image="<%=obj.getImagePrincipale()%>"
									imageMobile="<%=obj.getImageMobile()%>"
									legend="<%=obj.getLegende(userLang)%>"
									copyright="<%=obj.getCopyright(userLang)%>"
									figureCss="ds44-mb-std" />
							</section>
							<section class="ds44-box ds44-theme mbm">
								<div class="ds44-innerBoxContainer">
									<p role="heading" aria-level="2" class="ds44-box-heading"><%=glp("jcmsplugin.socle.actuedu.infopratiques.label")%></p>
									<jalios:if predicate="<%=Util.notEmpty(adresse)%>">
										<p class="ds44-docListElem mtm">
											<i class="icon icon-marker ds44-docListIco"
												aria-hidden="true"></i><%=adresse%><br\>
										</p>
									</jalios:if>
									<jalios:if predicate="<%=Util.notEmpty(obj.getComplementTransport())%>">
                                        <div class="ds44-docListElem mts">
                                            <i class="icon icon-map ds44-docListIco"
                                                aria-hidden="true"></i>
                                                <jalios:wysiwyg><%=obj.getComplementTransport()%></jalios:wysiwyg>
                                        </div>
									</jalios:if>
									<jalios:if predicate="<%=Util.notEmpty(obj.getTelephone())%>">
										<p class="ds44-docListElem mtm">
											<i class="icon icon-phone ds44-docListIco" aria-hidden="true"></i>
											<jalios:foreach name="itTelephone" type="String"
												collection="<%=Arrays.asList(obj.getTelephone(userLang))%>">
												<jalios:phone number="<%=itTelephone%>"
													title="<%=itTelephone%>"></jalios:phone>
											</jalios:foreach>
										</p>
									</jalios:if>
									<jalios:if predicate="<%=Util.notEmpty(obj.getMail())%>">
										<jalios:foreach name="itMail" type="String"
											collection="<%=Arrays.asList(obj.getMail())%>">
											<p class="ds44-docListElem mtm">
												<i class="icon icon-mail ds44-docListIco" aria-hidden="true"></i>
												<a href="mailto:<%=itMail%>"
													aria-label="Contacter Service habitat par mail : <%=itMail%>"><%=itMail%></a>
											</p>
										</jalios:foreach>
										</p>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getSiteInternet())%>">
										<jalios:foreach name="itWeb" type="String"
											collection="<%=Arrays.asList(obj.getSiteInternet())%>">
											<p class="ds44-docListElem mtm">
												<i class="icon icon-link ds44-docListIco" aria-hidden="true"></i>
												<a href="<%=itWeb%>"><%=itWeb%></a>
											</p>
										</jalios:foreach>
										</p>
									</jalios:if>
								</div>
								<div class="ds44-innerBoxContainer">
									<button class="ds44-btnStd ds44-btn--invert margin-txt">
										<span class="ds44-btnInnerText"><%=glp("jcmsplugin.socle.fichepublication.telecharger")%></span>
										<i class="icon icon-long-arrow-right" aria-hidden="true"></i>
									</button>
									<button class="ds44-btnStd">
										<i class="icon icon-star-empty" aria-hidden="true"></i> <span
											class="ds44-btnInnerText"><%=glp("jcmsplugin.espaceEnseignant.fiche.AjoutSel")%></span>
									</button>
								</div>
							</section>
						</aside>
					</div>
				</div>

				<%-- MOTS CLES --%>
				<div class="ds44-inner-container">
					<%
					if (Util.notEmpty(obj.getMotsCles(loggedMember))) {
					%>
					<h3 class="h3-ens">Mots clefs</h3>
					<div class="fiche-mot-clef">
						<jalios:foreach collection="<%=obj.getMotsCles(loggedMember)%>"
							type="Category" name="itCategory">
							<jalios:link data="<%=itCategory%>">
								<p class="mot-clef">
									<%=itCategory.getName()%>
								</p>
							</jalios:link>
						</jalios:foreach>
					</div>
					<%
					}
					%>
				</div>
			</section>
		</article>

		<%-- RESSOURCES ASSOCIEES --%>
		<%
		Object[] publicationsLiees = obj.getRessourcesAssocies();
		Content[] relatedContents = new Content[(publicationsLiees != null ? publicationsLiees.length : 0)];
		Collection pubRelatedCollection = null;
		int pubRelatedMax = 4;

		for (int i = 0; i < relatedContents.length; i++) {
			relatedContents[i] = (Content) publicationsLiees[i];
		}

		pubRelatedCollection = Util.getArrayList(relatedContents).stream()
				.filter(c -> c.canBeReadBy(loggedMember) && c.isInVisibleState()).collect(java.util.stream.Collectors.toList());
		if (pubRelatedCollection.size() < pubRelatedMax) {
			QueryHandler qh = new QueryHandler();
			qh.setTypes(new String[] { "generated.Fiche" });
			qh.setSort("mdate");
			pubRelatedCollection.addAll(QueryManager.getInstance().getRelatedPublicationSet(obj, qh));
		}
		%>
		<jalios:if predicate="<%=Util.notEmpty(pubRelatedCollection)%>">
			<%
			ArrayList<Fiche> tab = new ArrayList<>(pubRelatedCollection);
			%>
			<%@ include
				file='/plugins/EspaceEnseignantPlugin/jsp/vignette/carrouselRessourcesAssociees.jspf'%>
		</jalios:if>
	</section>