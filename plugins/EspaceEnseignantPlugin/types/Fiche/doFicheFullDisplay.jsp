<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Fiche display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Fiche obj = (Fiche)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Fiche <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">

  <% 
  jcmsContext.addCSSHeader("plugins/EspaceEnseignantPlugin/css/plugin.css");
  %>

    <%-- FICHE TITLE HEADER --%>
    <div class="fiche-page-header">
      <div class="fiche-page-header-bg"></div>

      <div class="fiche-page-header-title">
        <div class="spacer"></div>
        <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/filAriane.jspf' %>
        <h1 class="bold-txt margin-txt">
          <%= obj.getTitle() %>
        </h1>
        <p class="page-subtitle">
        Mis à jour le 
          <jalios:date date='<%= obj.getUdate() %>' format='<%= "short" %>'/>
        </p>
      </div>

      
    </div>

    <%-- FICHE CARTEL --%>
    <div class="fiche-cartel">
      <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/vignette/vignetteCartel.jspf' %>
    </div>

    <%-- FICHE BODY --%>
    <div class="fiche-page-body">
      <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
        <jalios:wysiwyg data='<%= obj %>' field='description'><%= obj.getDescription(userLang) %></jalios:wysiwyg>            
      <% } %>

      <% if (Util.notEmpty(obj.getScenarioPedagogique(userLang))) { %>
        <h3 class="h3-ens underline"> Scénario pédagogique </h3>
        <jalios:wysiwyg data='<%= obj %>' field='scenarioPedagogique'><%= obj.getScenarioPedagogique(userLang) %></jalios:wysiwyg>            
      <% } %>

      <%-- FICHE FOCUS --%>
      <% if (Util.notEmpty(obj.getImageFocus()) && Util.notEmpty(obj.getTexteLibre())) { %>
      <div class="fiche-focus"> 

         <section class="ds44-inner-container">
        
          <p role="heading" aria-level="1" class="focus-btn ">
            <button class="ds44-collapser_button ds44-btnStd ds44-btn--invert">
              <span class="ds44-btnInnerText">Voir les focus</span>
              <i class="icon icon-plus" aria-hidden="true"></i>
            </button>
          </p>
          <div class="ds44-collapser_content">
            <div class="ds44-collapser_content--level2">
              <h3 class="h3-ens"> Observez à la loupe </h3>
                <% 
                  String[] imageFocus = obj.getImageFocus();
                  String[] texteLibre = obj.getTexteLibre();
                  for(int i=0; i < imageFocus.length; i++) {
                    if (Util.notEmpty(texteLibre[i])) {
                      if(i%2==0) { %>

                        <div class="ds44-flex-container">
                          <div class="ds44-colLeft">
                            <picture class="">
                                <img src="<%= imageFocus[i] %>" alt="" class=""/>
                            </picture>
                          </div>
                          <div class="ds44-colRight">
                            <jalios:wysiwyg data='<%= obj %>' field='texteLibre'>
                              <%= texteLibre[i] %>
                            </jalios:wysiwyg>
                          </div>
                        </div>
                        <hr class="mbs"aria-hidden="true" />

                      <% } else { %>

                        <div class="ds44-flex-container">
                          <div class="ds44-colLeft">
                            <jalios:wysiwyg data='<%= obj %>' field='texteLibre'>
                              <%= texteLibre[i] %>
                            </jalios:wysiwyg>
                          </div>
                          <div class="ds44-colRight">
                            <picture class="">
                                <img src="<%= imageFocus[i] %>" alt="" class=""/>
                            </picture>
                          </div>
                        </div>
                        <hr class="mbs"aria-hidden="true" />
                      <%
                      }
                    }
                  }
                %>
            </div>
          </div>
        </section>
      </div>
      <% } %>

      <%-- MOTS CLES --%>
      <% if (Util.notEmpty(obj.getMotsCles(loggedMember))) { %>
        <h3 class="h3-ens"> Mots clefs </h3>
        <div class="fiche-mot-clef">
          <jalios:foreach collection="<%= obj.getMotsCles(loggedMember) %>" type="Category" name="itCategory" >
            <jalios:link data="<%= itCategory %>">
              <p class="mot-clef"> <%= itCategory.getName() %> </p>
            </jalios:link>
          </jalios:foreach>
        </div>
      <% } %>
    </div>

    <%-- RESSOURCES ASSOCIEES --%>
    <% if (Util.notEmpty(obj.getRessourcesAssocies())) { %>
      <div class="fiche-page-footer ds44-wave-white">
        <h3 class="h3-ens underline center-txt"> Ressources Associees </h3>
        <% ArrayList<Fiche> tab = new ArrayList<>();%>
          <jalios:foreach name="itData" type="generated.Fiche" array="<%= obj.getRessourcesAssocies() %>">
              <% tab.add(itData); %>
          </jalios:foreach>
          <%@ include file='/plugins/EspaceEnseignantPlugin/jsp/vignette/vignetteCarrousel.jspf' %>
      </div>
    <% } %>


</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Xy9ijrhavm3q7LnYC8oAJQ== --%>
