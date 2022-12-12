<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%
// display.jsp?id=fde_5286#{value}&{text}
// value => cidsform-element-fde_5280{idCatRoot}%5Bvalue%5D={id}
// text => cidsform-element-fde_5280{idCatRoot}%5Btext%5D={title}
        
RedirectionRecherche box = (RedirectionRecherche) portlet;
String url = box.getRedirectURL(loggedMember); // display.jsp?id=fde_5286#

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
        val = prefix + idPortletFacettes + box.getFacetteCategoriesLieesId() + "%5Bvalue%5D=" + catPerent.getId() + "&";
        text = prefix + idPortletFacettes + box.getFacetteCategoriesLieesId() + "%5Btext%5D=" + encodeForURL(catPerent.getName()) + "&";
    }
    val += prefix + idPortletFacettes + box.getFacetteCategoriesLieesId() + prefixSub + "%5Bvalue%5D=" + catId;
    text += prefix + idPortletFacettes + box.getFacetteCategoriesLieesId() + prefixSub + "%5Btext%5D=" + encodeForURL(cat.getName());
    url += val + "&" + text;
    
}

if (Util.notEmpty(url)) {
    String redirectUrl = box.getRedirectURL(loggedMember);
    request.setAttribute("redirect", redirectUrl);
    request.setAttribute("redirect.UrlWithoutSecurityCheck", redirectUrl);
    request.setAttribute("force-redirect-status-code",
    channel.getIntegerProperty("channel.redirect.portlet-redirect", HttpServletResponse.SC_MOVED_TEMPORARILY));
    return;
}
%>
