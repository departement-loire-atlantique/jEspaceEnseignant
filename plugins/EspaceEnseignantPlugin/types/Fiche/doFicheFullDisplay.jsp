<%@ page contentType="text/html; charset=UTF-8"%>
<%

%><%-- This file has been automatically generated. --%>
<%

%><%--
  @Summary: Fiche display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%

%><%@ include file='/jcore/doInitPage.jspf'%>
<%

%>
<%
Fiche obj = (Fiche) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
%>
<%

%><%@ include file='/front/doFullDisplay.jspf'%>
<div
  class="fullDisplay  Fiche <%=obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : ""%>"
  itemscope="itemscope">

  <%
  jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
  %>

  <section class="ds44-container-large">
    <%@ include
      file='/plugins/EspaceEnseignantPlugin/jsp/ficheHeader.jspf'%>

    <%-- FICHE BODY --%>
    <section class="ds44-contenuArticle">
      <div class="ds44-inner-container ds44-mtb3">
        <div class="ds44-grid12-offset-2">
          <%
          if (Util.notEmpty(obj.getDescription(userLang))) {
          %>
          <jalios:wysiwyg data='<%=obj%>' field='description'><%=obj.getDescription(userLang)%></jalios:wysiwyg>
          <%
          }
          %>

          <%
          if (Util.notEmpty(obj.getScenarioPedagogique(userLang))) {
          %>
          <h3 class="h3-ens underline"><%= glp("jcmsplugin.espaceEnseignant.fiche.scenarioPed") %></h3>
          <jalios:wysiwyg data='<%=obj%>' field='scenarioPedagogique'><%=obj.getScenarioPedagogique(userLang)%></jalios:wysiwyg>
          <%
          }
          %>

          <%-- FICHE FOCUS --%>
          <%
          if (Util.notEmpty(obj.getImageFocus()) && Util.notEmpty(obj.getTexteLibre())) {
          %>
          <div class="fiche-focus">

            <section class="ds44-inner-container">
              <p role="heading" aria-level="1" class="focus-btn ">
                <button
                  class="ds44-collapser_button ds44-btnStd ds44-btn--invert">
                  <span class="ds44-btnInnerText"><%= glp("jcmsplugin.espaceEnseignant.fiche.focus") %></span> <i
                    class="icon icon-plus" aria-hidden="true"></i>
                </button>
              </p>
              <div class="ds44-collapser_content">
                <div class="ds44-collapser_content--level2">
                  <h3 class="h3-ens"><%= glp("jcmsplugin.espaceEnseignant.fiche.observe") %></h3>
                  <%
                  String[] imageFocus = obj.getImageFocus();
                  String[] texteLibre = obj.getTexteLibre();
                  for (int i = 0; i < imageFocus.length; i++) {
                    if (Util.notEmpty(texteLibre[i])) {
                      if (i % 2 == 0) {
                  %>

                  <div class="ds44-flex-container">
                    <div class="ds44-colLeft">
                      <picture class=""> <img src="<%=imageFocus[i]%>"
                        alt="" class="" /> </picture>
                    </div>
                    <div class="ds44-colRight">
                      <jalios:wysiwyg data='<%=obj%>' field='texteLibre'>
                        <%=texteLibre[i]%>
                      </jalios:wysiwyg>
                    </div>
                  </div>
                  <hr class="mbs" aria-hidden="true" />

                  <%
                  } else {
                  %>

                  <div class="ds44-flex-container">
                    <div class="ds44-colLeft">
                      <jalios:wysiwyg data='<%=obj%>' field='texteLibre'>
                        <%=texteLibre[i]%>
                      </jalios:wysiwyg>
                    </div>
                    <div class="ds44-colRight">
                      <picture class=""> <img src="<%=imageFocus[i]%>"
                        alt="" class="" /> </picture>
                    </div>
                  </div>
                  <hr class="mbs" aria-hidden="true" />
                  <%
                  }
                  }
                  }
                  %>
                </div>
              </div>
            </section>
          </div>
          <%
          }
          %>

          <%-- MOTS CLES --%>
          <%
          if (Util.notEmpty(obj.getMotsCles(loggedMember))) {
          %>
          <h3 class="h3-ens"><%=glp("jcmsplugin.espaceEnseignant.site.motsClefs")%></h3>
          <div class="fiche-mot-clef">
            <jalios:foreach collection="<%=obj.getMotsCles(loggedMember)%>"
              type="Category" name="itCategory">
              <%
              String[] paramNames = { "textform-element-fde_5280fde_5275[value]", "textform-element-fde_5280fde_5275[text]" };
              String[] paramValues = { itCategory.getName(), itCategory.getName() };
              %>
              <jalios:link id="fde_5286" paramNames='<%=paramNames%>'
                paramValues='<%=paramValues%>' css="ds44-card__globalLink">
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
      </div>
    </section>
  </section>

  <%-- RESSOURCES ASSOCIEES --%>
  <%
  if (Util.notEmpty(obj.getRessourcesAssocies())) {
  %>
  <%
  ArrayList<Fiche> tab = new ArrayList<>(Arrays.asList(obj.getRessourcesAssocies()));
  %>
  <%
  String portletId = null;
  %>
  <%@ include
    file='/plugins/EspaceEnseignantPlugin/jsp/vignette/carrouselRessourcesAssociees.jspf'%>
  <%
  }
  %>

</div>

<%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%>
<%

%><%-- Xy9ijrhavm3q7LnYC8oAJQ== --%>
