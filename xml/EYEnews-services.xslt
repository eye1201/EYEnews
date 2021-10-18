<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output  method="html" version="5.0" encoding="UTF-8" indent="yes"  omit-xml-declaration="yes"/>
  <xsl:template match="/eyenews">
    <html lang="es">
    <head>
      <title>Noticias de última hora | EYEnews</title>
      <meta charset="UTF-8"/>
      <link rel="icon" href="..\img\eyenewslogo.png"/>
      <link rel="stylesheet" href="..\css\eyexslstyle.css" type="text/css"/>
      <meta name= "keywords" content= ""/>
    </head>
    <body>
      <!--encabezado-->
      <header>
        <table>
          <tr>
            <td>
              <a href="#"><img type="img" id="logo" src="..\img\eyenewslogo.png" alt="EYEnewsLogo"/></a>
            </td>
            <td>
              <ul class="navbar">
                  <li><a href="#">Inicio</a></li>
                  <li><a href="..html\contacto">Contacto</a></li>
                  <li><a href="..html\quienes">Quiénes somos</a></li>
              </ul>
            </td>
          </tr>
        </table>
      </header>
      <!--fin encabezado-->
      <!--contenido de pagina de pagina-->
      <div class="info">
        <h3>Información</h3>
        <div>
          <xsl:for-each select="infoempresa/descripcion">
           <xsl:copy-of select="p"/>
          </xsl:for-each>
        </div>
        <br/>
        <p> 
            <xsl:for-each select="infoempresa/direccion">
              <xsl:value-of select="../nombre"/>, <xsl:value-of select="lugar"/>, <xsl:value-of select="calle"/>, <xsl:value-of select="numero"/>, <xsl:value-of select="codpostal"/>, <xsl:value-of select="provincia"/>
          </xsl:for-each>
        </p>
        <p>Web oficial: <a href="{infoempresa/web}"><xsl:value-of select="infoempresa/web"/></a></p>
        <p>Contacta con nosotros: <br/>
          <span>- visitándonos en: <xsl:for-each select="infoempresa/direccion">
              <xsl:value-of select="../nombre"/>, <xsl:value-of select="lugar"/>, <xsl:value-of select="calle"/>, <xsl:value-of select="numero"/>, <xsl:value-of select="codpostal"/>, <xsl:value-of select="provincia"/>
          </xsl:for-each></span><br/>
          <span>- llamándonos: <xsl:value-of select="infoempresa/telefono"/></span><br/>
          <span>- escribiéndonos un mail: <xsl:value-of select="infoempresa/email"/></span><br/><br/>
          <span>Web diseñada por: <xsl:value-of select="infoempresa/disennoweb"/></span><br/><br/>
        </p>
      </div>
      <h3>noticias</h3><br/><br/>
      <div>
        <table class="noticias">
          <thead>
            <tr>
              <th>Imagen del noticia</th>
              <th>Nombre del noticia</th>
              <th>Descripción</th>
              <th>fecha-publicacion (<xsl:value-of select='@tipo-fecha'/>)</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Imagen del noticia</th>
              <th>Nombre del noticia</th>
              <th>Descripción</th>
              <th>fecha-publicacion (<xsl:value-of select='@tipo-fecha'/>)</th>
            </tr>
          </tfoot>
          <tbody class="noticias2">
            <xsl:for-each select="noticias/noticia">
            <xsl:sort select="@id"/>
              <xsl:element name="tr">
                <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
               <td>
                <xsl:choose>
                  <xsl:when test="not(img)">
                    <img src="..\img\noticias\nonoticias.png" alt="Imagen del noticia no disponible"/>
                  </xsl:when>
                  <xsl:otherwise>
                   <xsl:copy-of select="img"/>
                  </xsl:otherwise>
                </xsl:choose>
               </td>
                <th><xsl:value-of select="titulo-noticia"/></th>
                <td>
                  <xsl:value-of select="texto-noticia/div"/><br/><br/>
                  <xsl:choose>
                    <xsl:when test="not(texto-noticia/detalles/p)">
                    </xsl:when>
                    <xsl:otherwise>
                     <details>
                        <xsl:for-each select="texto-noticia/detalles/p">
                          <xsl:value-of select="."/><br/>
                        </xsl:for-each>
                      </details>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>
                  <xsl:if test="count(fecha-publicacion) = 1">
                    <p><xsl:value-of select="fecha-publicacion"/> &#160; <xsl:value-of select="fecha-publicacion/@tipo-fecha"/>(s) </p>
                  </xsl:if>
                  <xsl:if test="count(fecha-publicacion) = 2">
                    <p><xsl:value-of select="fecha-publicacion"/> &#160; <xsl:value-of select="fecha-publicacion/@tipo-fecha"/> () </p>
                    <p><xsl:value-of select="fecha-publicacion[last()]"/> &#160; <xsl:value-of select="fecha-publicacion/@tipo-fecha"/> () </p>
                  </xsl:if>
                </td>
              </xsl:element>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
      <!--fin contenido de pagina de pagina-->
      <!--pie de pagina-->
      <footer>
        <p>EYEnews</p>
        <p>©Copyright 2021 | designed by: E.Y.E.</p>
      </footer>
      <!--fin pie de pagina-->
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>