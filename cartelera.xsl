<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
<title>Cartellera de cinema</title>

<style>
body{
    font-family: Arial, sans-serif;
    background:#fbb4cd;
    margin:0;
    padding:20px;
}

h1{
    text-align:center;
    color:#222;
}

.recinto{
    background:white;
    padding:20px;
    border-radius:10px;
    margin-bottom:25px;
}

.pelicula{
    display:flex;
    gap:20px;
    background:#fff;
    border:1px solid #ddd;
    border-radius:10px;
    padding:15px;
    margin:20px 0;
}

.poster{
    max-width:200px;
    max-height:250px;
    border-radius:8px;
}

.info{
    flex:1;
}

.titulo{
    font-size:24px;
    font-weight:bold;
    color:#1f2937;
    margin-bottom:10px;
}

.datos{
    color:rgb(190, 19, 90);
    margin-bottom:10px;
}

.sinopsis{
    line-height:1.5;
    margin-top:10px;
}

.fecha{
    background:#c8fbb4;
    padding:8px;
    border-radius:5px;
    margin-top:10px;
}

.sesion{
    display:inline-block;
    background:#26660c;
    color:white;
    padding:6px 10px;
    margin:4px;
    border-radius:5px;
}

a{
    color:rgb(107, 1, 24);
}

</style>

</head>

<body>

<h1>Cartellera de cinema</h1>

<xsl:for-each select="cartelera/recinto">

<div class="recinto">

<h2>
<xsl:value-of select="@value"/>
</h2>

<p>
<xsl:value-of select="address"/>,
<xsl:value-of select="postcode"/>
-
<xsl:value-of select="city"/>
</p>

<xsl:for-each select="evento">

<div class="pelicula">

<img class="poster">
<xsl:attribute name="src">
<xsl:value-of select="caratula"/>
</xsl:attribute>
</img>

<div class="info">

<div class="titulo">
<xsl:value-of select="titulo/@value"/>
</div>

<div class="datos">
<strong>Género:</strong>
<xsl:value-of select="genero"/>
<br/>

<strong>Duración:</strong>
<xsl:value-of select="duracion"/> min <br/>

<strong>Clasificación:</strong>
<xsl:value-of select="calificacion"/>

</div>

<div class="sinopsis">
<xsl:value-of select="sinopsis"/>
</div>

<p>
<a target="_blank">
<xsl:attribute name="href">
<xsl:value-of select="compra"/>
</xsl:attribute>
Comprar entradas
</a>
</p>

<xsl:for-each select="fechas/fecha">

<div class="fecha">

<strong>
<xsl:value-of select="@value"/>
</strong>

<br/>

<xsl:for-each select="sesiones/sesion">

<span class="sesion">
<xsl:value-of select="@hora"/>
</span>

</xsl:for-each>

</div>

</xsl:for-each>

</div>

</div>

</xsl:for-each>

</div>

</xsl:for-each>

</body>
</html>

</xsl:template>

</xsl:stylesheet>
