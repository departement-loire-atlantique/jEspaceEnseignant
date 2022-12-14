<%@page import="com.jalios.jcms.handler.QueryHandler"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

%><%@ include file='/jcore/doInitPage.jspf'%>
<%

%>
<%
FicheActionEducative obj = (FicheActionEducative) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
%>
<%
String uid = ServletUtil.generateUniqueDOMId(request, "uid");
boolean hasImage = Util.notEmpty(obj.getImagePrincipale()) || Util.notEmpty(obj.getImageMobile());

boolean hasBlocRessource = Util.notEmpty(obj.getDocumentsJointsBlocN1(userLang))
		|| Util.notEmpty(obj.getDocumentsJointsBlocN2(userLang))
		|| Util.notEmpty(obj.getDocumentsJointsBlocN3(userLang)) || Util.notEmpty(obj.getAdresseSiteInternet(userLang));

boolean hasDocRessources = Util.notEmpty(obj.getDocumentsJointsBlocN1(userLang))
		|| Util.notEmpty(obj.getDocumentsJointsBlocN2(userLang))
		|| Util.notEmpty(obj.getDocumentsJointsBlocN3(userLang));
%>
<%@ include file='/front/doFullDisplay.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%@ page
	import="fr.digiwin.module.EspaceEnseignant.EspaceEnseignantHandler"%>
<%@page import="fr.cg44.plugin.socle.SocleUtils"%>

<%
jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
%>

<div
	class="fullDisplay  Fiche <%=obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : ""%>"
	itemscope="itemscope">
	<section class="ds44-container-large">

		<div class="ds44-lightBG ds44-posRel">
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

		<%-- FICHE CARTEL --%>
		<div class=" ds44-img50 ds44--l-padding-tb">
			<div class="ds44-inner-container">
				<div class="ds44-grid12-offset-1">
					<section class="ds44-box ds44-theme">
						<div class="ds44-innerBoxContainer">
							<div class="grid-2-small-1 ds44-grid12-offset-1">

								<%-- PRATIQUE --%>
								<div class="col">
									<div class="ds44-box-heading" role="heading" aria-level="3"><%=glp("jcmsplugin.socle.actuedu.infopratiques.label")%></div>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getTheme(loggedMember)) || Util.notEmpty(obj.getSoustheme(loggedMember))
		|| Util.notEmpty(obj.getParcoursEducationNationale(loggedMember))%>">
										<p class="ds44-docListElem mts">
											<i class="icon icon-tag ds44-docListIco" aria-hidden="true"></i>
											<jalios:if
												predicate="<%=Util.notEmpty(obj.getTheme(loggedMember))%>">
												<strong role="heading" aria-level="4"> <%=SocleUtils.formatCategories(obj.getTheme(loggedMember), "<br/>")%></strong>
											</jalios:if>
											<jalios:if
												predicate="<%=Util.notEmpty(obj.getParcoursEducationNationale(loggedMember))%>">
												<jalios:if
													predicate="<%=Util.notEmpty(obj.getTheme(loggedMember)) || Util.notEmpty(obj.getSoustheme(loggedMember))%>">
													<br />
												</jalios:if>
												<%=SocleUtils.formatCategories(obj.getParcoursEducationNationale(loggedMember))%>
											</jalios:if>
										</p>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getTypeDePratique(loggedMember))%>">
										<p class="ds44-docListElem mts">
											<strong><%=glp("jcmsplugin.socle.actuedu.typepratique.label")%></strong>
											<%=SocleUtils.formatCategories(obj.getTypeDePratique(loggedMember))%>
										</p>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getNiveau(loggedMember)) && Util.isEmpty(obj.getCapaciteDaccueil())%>">
										<p class="ds44-docListElem mts">
											<i class="icon icon-user-group ds44-docListIco"
												aria-hidden="true"></i> <strong><%=glp("jcmsplugin.socle.actuedu.pour-eleve.label")%>
											</strong>
											<%=SocleUtils.formatCategories(obj.getNiveau(loggedMember))%>
										</p>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getCapaciteDaccueil(userLang))%>">
										<div class="ds44-docListElem mts">
											<i class="icon icon-user-group ds44-docListIco"
												aria-hidden="true"></i>
											<jalios:if
												predicate="<%=Util.notEmpty(obj.getNiveau(loggedMember))%>">
												<strong><%=glp("jcmsplugin.socle.actuedu.pour-eleve.label")%>
												</strong>
												<%=SocleUtils.formatCategories(obj.getNiveau(loggedMember))%>
												<br />
											</jalios:if>
											<jalios:wysiwyg><%=obj.getCapaciteDaccueil(userLang)%></jalios:wysiwyg>
										</div>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getCout(userLang))%>">
										<div class="ds44-docListElem mts">
											<i class="icon icon-cost ds44-docListIco" aria-hidden="true"></i>
											<strong><%=glp("jcmsplugin.socle.actuedu.cout.label")%>
											</strong>
											<jalios:wysiwyg css="ds44-inlineBlock">
												<%=obj.getCout(userLang)%></jalios:wysiwyg>
										</div>
									</jalios:if>
									<p class="ds44-docListElem mts">
										<i class="icon icon-bus ds44-docListIco" aria-hidden="true"></i>
										<strong><%=glp("jcmsplugin.socle.actuedu.prisechargedeplacement.label")%></strong>
										<%=obj.getPriseEnChargeDeplacementLabel(userLang)%>
									</p>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getDuree(userLang))%>">
										<div class="ds44-docListElem mts">
											<i class="icon icon-time ds44-docListIco" aria-hidden="true"></i>
											<jalios:wysiwyg><%=obj.getDuree(userLang)%></jalios:wysiwyg>
										</div>
									</jalios:if>
									<jalios:if
										predicate="<%=Util.notEmpty(obj.getDepotDuDossier(userLang)) || Util.notEmpty(obj.getRealisationDeLaction(userLang))%>">
										<div class="ds44-docListElem mts">
											<i class="icon icon-date ds44-docListIco" aria-hidden="true"></i>
											<jalios:if
												predicate="<%=Util.notEmpty(obj.getDepotDuDossier(userLang))%>">
												<jalios:wysiwyg><%=obj.getDepotDuDossier(userLang).replace("<div class=\"wysiwyg\"><p>",
		"<div class=\"wysiwyg\"><p>" + "<strong>" + glp("jcmsplugin.socle.actuedu.depotdossier.label") + "</strong> ")%></jalios:wysiwyg>
											</jalios:if>
											<jalios:if
												predicate="<%=Util.notEmpty(obj.getRealisationDeLaction(userLang))%>">
												<strong><%=glp("jcmsplugin.socle.actuedu.realisationaction.label")%></strong>
												<jalios:wysiwyg><%=obj.getRealisationDeLaction(userLang)%></jalios:wysiwyg>
											</jalios:if>
										</div>
									</jalios:if>
								</div>

								<%-- CONTACT --%>
								<div class="col">
									<p class="ds44-box-heading" role="heading" aria-level="3"><%=glp("jcmsplugin.socle.actuedu.votrecontact.label")%></p>
									<p class="ds44-docListElem mts">
										<i class="icon icon-user ds44-docListIco" aria-hidden="true"></i><%=obj.getNomEtPrenomContacts(userLang)%>
										<jalios:if
											predicate="<%=Util.notEmpty(obj.getDirection(userLang))%>">
											<br /><%=obj.getDirection(userLang)%>
										</jalios:if>
										<jalios:if
											predicate="<%=Util.notEmpty(obj.getService(userLang))%>">
											<br /><%=obj.getService(userLang)%>
										</jalios:if>
										<jalios:if
											predicate="<%=Util.notEmpty(obj.getDirection(userLang)) || Util.notEmpty(obj.getService(userLang))%>">
											<br />
										</jalios:if>
										<%=SocleUtils.formatAddress(null, null, null, obj.getNdeVoie(), obj.getLibelleDeVoie(), null, obj.getCs(),
		obj.getCodePostal(), obj.getCommune().getTitle(), obj.getCedex())%>
									</p>
									<p class="ds44-docListElem mts">
										<i class="icon icon-phone ds44-docListIco" aria-hidden="true"></i>
										<jalios:foreach name="itPhone" type="String"
											array="<%=obj.getTelephone()%>">
											<ds:phone number="<%=itPhone%>"
												pubTitle="<%=obj.getTitle()%>"></ds:phone>
										</jalios:foreach>
									</p>
									<p class="ds44-docListElem mts">
										<i class="icon icon-mail ds44-docListIco" aria-hidden="true"></i>
										<jalios:select>
											<jalios:if predicate="<%=obj.getMail().length == 1%>">
												<%-- TODO : remplacer par un formulaire de contact --%>
												<a href="mailto:<%=obj.getMail()[0]%>"
													title="<%=glp("jcmsplugin.socle.contactmail", obj.getTitle() + " " + obj.getSoustitre(), obj.getMail()[0])%>"
													data-statistic='{"name": "declenche-evenement","category": "BlocNousContacter","action": "Mailto","label": "<%=HttpUtil.encodeForHTMLAttribute(obj.getTitle())%>"}'>
													<%=glp("jcmsplugin.socle.actuedu.nouscontacter.label")%>
												</a>
											</jalios:if>
											<jalios:default>
												<jalios:foreach name="itMail" type="String"
													array="<%=obj.getMail()%>">
													<a href="mailto:<%=itMail%>"
														title='<%=HttpUtil.encodeForHTMLAttribute(
		glp("jcmsplugin.socle.contactmail", obj.getTitle() + " " + obj.getSoustitre(), itMail))%>'
														data-statistic='{"name": "declenche-evenement","category": "BlocNousContacter","action": "Mailto","label": "<%=HttpUtil.encodeForHTMLAttribute(obj.getTitle())%>"}'>
														<%=itMail%></a>
												</jalios:foreach>
											</jalios:default>
										</jalios:select>
									</p>

								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>

		<%-- IMAGE --%>
		<section id="imageChapo" class="ds44-contenuArticle">
			<div class="ds44-inner-container ds44-mtb3">
				<div class="ds44-grid12-offset-1">
					<div class="grid-<%=hasImage ? "2" : "1"%>-small-1">
						<jalios:if predicate="<%=hasImage%>">
							<div
								class='col mrl mbs<%=Util.isEmpty(obj.getImageMobile()) ? " ds44-hide-mobile" : ""%>'>
								<ds:figurePicture imgCss="ds44-w100 ds44-imgRatio"
									pictureCss="ds44-legendeContainer ds44-container-imgRatio"
									format="principale" pub="<%=obj%>"
									imageMobile="<%=obj.getImageMobile()%>"
									alt="<%=obj.getTexteAlternatif(userLang)%>"
									copyright="<%=obj.getCopyright(userLang)%>"
									legend="<%=obj.getLegende(userLang)%>" />
							</div>
						</jalios:if>
						<div class='col <%=hasImage ? "mll" : ""%> mbs'>
							<p role="heading" aria-level="2" class="ds44-wsg-exergue"><%=obj.getFormat(loggedMember).first().getName(userLang)%></p>
							<div class="ds44-mb-std"></div>
							<div class="ds44-introduction">
								<jalios:wysiwyg><%=obj.getChapo(userLang)%></jalios:wysiwyg>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<%-- DESCRIPTION --%>
		<section id="enDetails" class="ds44-contenuArticle">
			<div class="ds44-inner-container ds44-mtb3">
				<div class="ds44-grid12-offset-2">
					<h2 class="h2-ens underline" id="titreEnDetails"><%=glp("jcmsplugin.socle.titre.endetails")%></h2>
					<jalios:wysiwyg><%=obj.getDescription(userLang)%></jalios:wysiwyg>
				</div>
			</div>
		</section>

		<jalios:if predicate="<%=Util.notEmpty(obj.getPublicVise(userLang))%>">
			<section id="publicVise" class="ds44-contenuArticle">
				<div class="ds44-inner-container ds44-mtb3">
					<div class="ds44-grid12-offset-2">
						<h3 class="h3-like" id="titrePublicVise"><%=glp("jcmsplugin.socle.titre.publicvise")%></h2>
							<jalios:wysiwyg><%=obj.getPublicVise(userLang)%></jalios:wysiwyg>
					</div>
				</div>
			</section>
		</jalios:if>

		<jalios:if
			predicate="<%=Util.notEmpty(obj.getCalendrierEtInscription(userLang))%>">
			<section id="calendrierInscriptions" class="ds44-contenuArticle">
				<div class="ds44-inner-container ds44-mtb3">
					<div class="ds44-grid12-offset-2">
						<h3 class="h3-like" id="titreCalendrierInscriptions"><%=glp("jcmsplugin.socle.titre.calinscriptions")%></h2>
							<jalios:wysiwyg><%=obj.getCalendrierEtInscription(userLang)%></jalios:wysiwyg>
					</div>
				</div>
			</section>
		</jalios:if>

		<jalios:if predicate="<%=Util.notEmpty(obj.getVideo())%>">
			<ds:articleVideo video="<%=obj.getVideo()%>"
				title="<%=obj.getTitreVideo(userLang)%>" />
		</jalios:if>

		<jalios:if
			predicate="<%=Util.notEmpty(obj.getComplementTransport(userLang))%>">
			<section id="complementTransport" class="ds44-contenuArticle">
				<div class="ds44-inner-container ds44-mtb3">
					<div class="ds44-grid12-offset-2">
						<div class="ds44-wsg-encadreContour">
							<h3 class="h3-like" id="titreComplementTransport"><%=glp("jcmsplugin.socle.titre.complementtransports")%></h2>
								<jalios:wysiwyg><%=obj.getComplementTransport(userLang)%></jalios:wysiwyg>
						</div>
					</div>
				</div>
			</section>
		</jalios:if>

		<jalios:if
			predicate="<%=Util.notEmpty(obj.getPartenairesIntervenants(userLang))%>">
			<section id="partenairesIntervenants" class="ds44-contenuArticle">
				<div class="ds44-inner-container ds44-mtb3">
					<div class="ds44-grid12-offset-2">
						<h3 class="h3-like" id="titrePartenairesIntervenants"><%=glp("jcmsplugin.socle.titre.partenairesintervenants")%></h2>
							<jalios:wysiwyg><%=obj.getPartenairesIntervenants(userLang)%></jalios:wysiwyg>
					</div>
				</div>
			</section>
		</jalios:if>


		<%-- RESSOURCES --%>
		<jalios:if predicate="<%=hasBlocRessource%>">
			<%
			boolean addLineBreak = false;
			%>
			<section id="blocRessources" class="ds44-contenuArticle">
				<div class="ds44-inner-container ds44-mtb3">
					<div class="ds44-grid12-offset-2">
						<div class="ds44-wsg-encadreApplat ds44-theme">
							<jalios:if predicate="<%=hasDocRessources%>">
								<%
								String currentDocBlocTitle = "";
								FileDocument[] currentDocBlocElements = new FileDocument[0];

								for (int blocDocCpt = 1; blocDocCpt <= 3; blocDocCpt++) {
									if (Util.isEmpty(obj.getFieldValue("documentsJointsBlocN" + blocDocCpt, userLang)))
										continue;
									currentDocBlocTitle = (String) obj.getFieldValue("titreEncartDocumentBlocN" + blocDocCpt, userLang);
									currentDocBlocElements = (FileDocument[]) obj.getFieldValue("documentsJointsBlocN" + blocDocCpt, userLang);
								%>
								<ul class="ds44-list">
									<jalios:if predicate="<%=Util.notEmpty(currentDocBlocTitle)%>">
										<p
											class='ds44-box-heading <%=addLineBreak ? "ds44-mt-std" : ""%>'
											role="heading" aria-level="2"><%=currentDocBlocTitle%></p>
									</jalios:if>
									<jalios:foreach name="itDoc" type="FileDocument"
										array="<%=currentDocBlocElements%>">
										<li class="mts ds44-docListElem">
											<%
											// Récupérer l'extension du fichier
											String fileType = FileDocument.getExtension(itDoc.getFilename()).toUpperCase();
											// Récupérer la taille du fichier
											String fileSize = Util.formatFileSize(itDoc.getSize());
											%> <i class="icon icon-file ds44-docListIco"
											aria-hidden="true"></i><a href="<%=itDoc.getDownloadUrl()%>"
											target="_blank"
											title='<%=HttpUtil.encodeForHTMLAttribute(itDoc.getTitle())%> - <%=fileType%> - <%=HtmlUtil.html2text(fileSize)%>  <%=glp("jcmsplugin.socle.accessibily.newTabLabel")%>'><%=itDoc.getTitle()%></a><span
											class="ds44-cardFile"><%=fileType%> - <%=fileSize%></span>
										</li>
									</jalios:foreach>
									<%
									addLineBreak = true;
									%>
								</ul>
								<%
								} // end of for
								%>
							</jalios:if>
							<jalios:if
								predicate="<%=Util.notEmpty(obj.getAdresseSiteInternet())%>">
								<jalios:if predicate="<%=addLineBreak%>">
									<br />
									<%
									addLineBreak = false;
									%>
								</jalios:if>
								<jalios:if
									predicate="<%=Util.notEmpty(obj.getTitreEncartSiteInternet(userLang))%>">
									<p
										class='ds44-box-heading <%=addLineBreak ? "ds44-mt-std" : ""%>'
										role="heading" aria-level="2"><%=obj.getTitreEncartSiteInternet(userLang)%></p>
								</jalios:if>
								<ul class="ds44-list">
									<jalios:foreach name="itAdresse" type="String"
										array="<%=obj.getAdresseSiteInternet()%>" counter="itSiteCpt">
										<%
										boolean hasAssociatedTitle = Util.isEmpty(obj.getNomDuSite(userLang)) ? false
												: obj.getNomDuSite(userLang).length < itSiteCpt ? false
												: Util.notEmpty(obj.getNomDuSite(userLang)[itSiteCpt - 1]);
										String lbl = hasAssociatedTitle ? obj.getNomDuSite(userLang)[itSiteCpt - 1] : itAdresse;
										%>
										<li class="mts ds44-docListElem"><i
											class="icon icon-link ds44-docListIco" aria-hidden="true"></i><a
											target="_blank"
											title='<%=HttpUtil.encodeForHTMLAttribute(lbl)%> <%=glp("jcmsplugin.socle.accessibily.newTabLabel")%>'
											href="<%=SocleUtils.parseUrl(itAdresse)%>"><%=lbl%></a></li>
									</jalios:foreach>
								</ul>
							</jalios:if>
						</div>
					</div>
				</div>
			</section>
		</jalios:if>


		<%@ include file='/plugins/EspaceEnseignantPlugin/jsp/sharePage.jspf'%>
	</section>
	<%--@ include file='/plugins/EspaceEnseignantPlugin/jsp/pageUtile.jspf'--%>
</div>