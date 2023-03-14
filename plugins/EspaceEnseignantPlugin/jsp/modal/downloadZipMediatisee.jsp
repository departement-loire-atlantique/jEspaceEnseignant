<%@page import="fr.digiwin.module.EspaceEnseignant.exportZip.ExportZip"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

  String idObjet = (String) session.getAttribute("idObjet");
  Fiche obj = (Fiche)channel.getData(idObjet);

  if(Util.notEmpty(obj)) {
    List<CarouselElement> carouselElement = new ArrayList<>();
    
    if (Util.notEmpty(obj.getGalerieDeVisuels())) {
      Carousel carrousel = (Carousel)obj.getGalerieDeVisuels();
      Collections.addAll(carouselElement, carrousel.getElements1());
    }
    
    if (Util.notEmpty(obj.getVisuel())) {
      CarouselElement carrousel = (CarouselElement)channel.getData(CarouselElement.class, obj.getVisuel().getId());
      Collections.addAll(carouselElement, carrousel);
    }
    
    if (Util.notEmpty(carouselElement)) {
        ExportZip zip = new ExportZip();
        
        CarouselElement[] listeElem = carouselElement.toArray(new CarouselElement[0]);
        zip.exportZip(listeElem, obj.getTitle()).sendToDownloadUrl(request, response);       
    }
  }
%>	