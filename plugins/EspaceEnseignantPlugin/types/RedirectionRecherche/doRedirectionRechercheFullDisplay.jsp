<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%
// display.jsp?id=fde_5286#{value}&{text}
// value => cidsform-element-fde_5280{idCatRoot}%5Bvalue%5D={id}
// text => cidsform-element-fde_5280{idCatRoot}%5Btext%5D={title}

// RedirectionRecherche box = (RedirectionRecherche) portlet;

String url = "display.jsp?id=fde_5286&"; //box.getRedirectURL(loggedMember); 
String facetteCategoriesLieesId = getAlphaNumParameter("facetteCategoriesLieesId", null);
 
String prefix = "cidsform-element-";
String idPortletFacettes = "fde_5280";

String catId = getAlphaNumParameter("cid", "");// cat select
Category cat = channel.getCategory(catId);

int lvl = getIntParameter("lvl", 1);

if(Util.notEmpty(cat)){
    String prefixSub = "";
    String val = "";
    String text = "";
    if(lvl >= 2){
        prefixSub = "-2";
        Category catPerent = cat.getParent();
        val = prefix + idPortletFacettes + facetteCategoriesLieesId + "%5Bvalue%5D=" + catPerent.getId() + "&";
        text = prefix + idPortletFacettes + facetteCategoriesLieesId + "%5Btext%5D=" + encodeForURL(catPerent.getName()) + "&";
    }
    val += prefix + idPortletFacettes + facetteCategoriesLieesId + prefixSub + "%5Bvalue%5D=" + catId;
    text += prefix + idPortletFacettes + facetteCategoriesLieesId + prefixSub + "%5Btext%5D=" + encodeForURL(cat.getName());
    url += val + "&" + text;
}

if (Util.notEmpty(url)) {
    String redirectUrl = url;
    request.setAttribute("redirect", redirectUrl);
    request.setAttribute("redirect.UrlWithoutSecurityCheck", redirectUrl);
    request.setAttribute("force-redirect-status-code",
    channel.getIntegerProperty("channel.redirect.portlet-redirect", HttpServletResponse.SC_MOVED_TEMPORARILY));
    sendRedirect(url);
    return;
}
%>

