<%--
  @Summary: FAQ display template
  @Category: Core Type / FAQ
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Faq obj = (Faq)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView"));
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(FaqEntry.class, workspace);

%><jsp:useBean id="formHandler" scope="page" class="custom.CustomEditFaqEntryHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
 %><jsp:setProperty name="formHandler" property="id"  value="<%= null %>" /><%
 %><jsp:setProperty name="formHandler" property="faq" value="<%= obj.getId() %>" /><%
%></jsp:useBean><%

boolean isActionForThisFAQ = Util.getString(obj.getId(), "").equals(getDataIdParameter("faqId"));
if (canEdit && isActionForThisFAQ && formHandler.validate()) {
  //request.setAttribute("redirect", "display.jsp?id=" + getDataIdParameter("id")); // TODO OD generalize
  //return;
}

%>
<div id="faq-fulldisplay-<%= obj.getId() %>" class="fullDisplay Faq" itemscope="itemscope">
  <%-- *** QUESTION LIST ************************************* --%>
  <div class="list">
    <%
    boolean isPreview = getBooleanParameter("preview", false);
    DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
    DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
    %>
    <jalios:query name="entrySet"
                  dataset="<%= obj.getLinkIndexedDataSet(FaqEntry.class) %>"
                  comparator="<%=  new custom.CustomEditFaqEntryHandler.OrderComparator() %>"
                  selector="<%= selector %>"/>
    
  </div>

  <%-- *** QUESTION / ANSWSER LIST ************************************* --%>
  <div class="fiche-page-header fiche-bg">
    <div class="fiche-page-header-title">
      <div class="spacer"></div>

      <nav role="navigation" aria-label="Votre position" class="ds44-hide-mobile">
          <ul class="ds44-list ds44-breadcrumb">
              <li class="ds44-breadcrumb_item"> 
                  <a href="#">
                      <i class="icon icon-home icon--medium" aria-hidden="true"></i>
                      <span class="visually-hidden">Accueil</span>
                  </a>
              </li>
              <li class="ds44-breadcrumb_item" aria-current="location">
              <span> <%= obj.getTitle() %> </span>
              </li>
          </ul>
      </nav>

      <h1 class="bold-txt margin-txt">
      <%= obj.getTitle() %>
      </h1>
    </div>
  </div>

  <div class="faq-content">

    <% if (Util.notEmpty(obj.getDescription())) { %>
    <div class="description abstract">
      <h4 class="bold-txt"><%= obj.getDescription(userLang) %></h4>
    </div>
    <% } %>

    <ul class="ds44-collapser ds44-mb-std ">

      <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
        <li class="ds44-collapser_element">
            <p role="heading" aria-level="3">
              <button type="button" class="ds44-collapser_button">
                <%= itEntry.getTitle(userLang) %>
                <i class="icon icon-down" aria-hidden="true"></i>
              </button>
            </p>
            <div class="ds44-collapser_content">
                <ul class="ds44-list ds44-collapser_content--level2">
                    <li>
                      <p><%= itEntry.getAnswer(userLang) %></p>
                    </li>
                </ul>
            </div>
        </li>
      </jalios:foreach>
    </ul>
  </div>