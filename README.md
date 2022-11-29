# EspaceEnseignantPlugin

Ce module JCMS est utilisé pour l'application des expaces enseignants du CD44.

## Module de recherche
Modifier le tomcat.xml pour ajouter `*relaxedQueryChars="[,]"*`  
```
<Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               URIEncoding="UTF-8"
               relaxedQueryChars="[,]" />
```

## Module SEO
Mettre la propriété à false: /jcms/WebContent/WEB-INF/plugins/SEOPlugin/properties/plugin.prop  
`descriptive-urls.enabled:         false`