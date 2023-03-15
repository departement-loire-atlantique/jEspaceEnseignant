<%@page import="java.util.HashSet"%><%
%><%@ include file='/jcore/doInitPage.jsp'%><% %>
<%
if (Util.notEmpty(request.getParameter("pubId[value]")) && request.getParameter("pubId[value]").contains("all")) {
    session.removeAttribute("panier");
} else {
    Set<String> panierSet = (Set<String>) request.getSession().getAttribute("panier");
	Publication pub = getPublicationParameter("pubId[value]");
	String pubIdString = "";
	
	if(Util.notEmpty(pub)){
	  pubIdString = pub.getId();
	  if(Util.isEmpty(panierSet)) {
		  panierSet = new HashSet<String>();	  
		  panierSet.add(pubIdString);	  
	  } else {
	    if(panierSet.contains(pubIdString)) {
	      panierSet.remove(pubIdString);
	    } else {
	      panierSet.add(pubIdString);
	    }
	  }
	  
	  session.setAttribute("panier", panierSet);
	}
}

if (Util.notEmpty(request.getParameter("redirect[value]"))) {
  request.removeAttribute("pubId");
  sendRedirect(request.getParameter("redirect[value]"));
}

%>