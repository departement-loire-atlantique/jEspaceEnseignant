<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@ include
    file='/types/AbstractCollection/doIncludePortletCollection.jspf'%>
<%@ taglib prefix="ds" tagdir="/WEB-INF/tags"%>
<%
PortletJspCollection obj = (PortletJspCollection) portlet;
%>
<section
    class="ds44-container-large ds44-homepage-container ds44--xxl-padding-b ds44-pageHeaderContainer--deuxCol">

    <div class="ds44-pageHeaderContainer__left">
<!--         TODO IMG -->
<%--         <ds:figurePicture imgCss="ds44-headerImg" --%>
<%--             pictureCss="ds44-pageHeaderContainer__pictureContainer" --%>
<%--             figureCss="ds44-pageHeaderContainer__pictureContainer" --%>
<%--             format="carouselFull"  --%>
<%--             pub="<%=itTuile%>" --%>
<%--             imageMobile="<%=itTuile.getImageMobile()%>" --%>
<%--             alt="<%=itTuile.getTitle()%>" --%>
<%--             copyright="<%=itTuile.getImageCopyright()%>" --%>
<%--             legend="<%=itTuile.getImageLegend()%>" --%>
<%--             ariaLabel="<%=itTuile.getTitle()%>" --%>
<%--             urlHref="<%=urlLien%>" --%>
<%--             urlTitle="<%=itTuile.getTitle()%>" --%>
<%--             urlIsExterne="<%=isExterne%>" /> --%>
        <div class="ds44-titleContainer">
            <div class="ds44-alphaGradient ds44-alphaGradient--header">
                <h1 class="h1-like ds44-text--colorInvert">
                    <jalios:wysiwyg>TODO Title</jalios:wysiwyg>
                </h1>
                <p class="ds44-text--colorInvert">
                    <jalios:wysiwyg>TODO sub Title</jalios:wysiwyg>
                <p>
            </div>
        </div>
    </div>

    <div class="ds44-pageHeaderContainer__right">
        <section class="ds44-box ds44-bgGray">
            <%=getPortlet(bufferMap, "nav")%>
        </section>
    </div>
</section>
