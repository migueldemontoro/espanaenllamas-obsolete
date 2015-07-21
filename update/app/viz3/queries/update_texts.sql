#Vis3 - Create a equivalence column for regions
ALTER TABLE COMUNIDADES ADD idCCAA_INE TINYINT(3) NOT NULL;

#Vis3 - Data fires and burned areas by municipality top100
SELECT 
    @i:=@i+1 AS ranking, 
    t.*
FROM 
    (SELECT LPAD(c.idCCAA_INE,2,'0') as idCCAA_INE,
LPAD(c.IDCOMUNIDAD,2,'0') as idComunidad, c.NOMBRE as comunidad, 
LPAD(p.idprovincia,2,'0') as idProvincia, p.NOMBRE as provincia,
CONCAT(LPAD(p.idprovincia,2,'0'), LPAD(m.IDMUNICIPIO, 3, '0')) as idMunicipio, 
m.NOMBRE as municipio,
COUNT(*) as num_incendios, 
SUM(coalesce(p9.totalnar,0)+coalesce(p9.totalar,0)) as supquemada
FROM PIF9 p9, PIF1 p1, COMUNIDADES c, PROVINCIAS p, MUNICIPIOS m
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
AND p1.IDCOMUNIDAD = p.IDCOMUNIDAD
AND p1.IDPROVINCIA = p.IDPROVINCIA
AND p1.IDCOMUNIDAD = m.IDCOMUNIDAD
AND p1.IDPROVINCIA = m.IDPROVINCIA
AND p1.IDMUNICIPIO = m.IDMUNICIPIO
GROUP BY c.IDCOMUNIDAD, c.NOMBRE, p.IDPROVINCIA, p.NOMBRE, m.IDMUNICIPIO, m.NOMBRE
ORDER BY num_incendios DESC LIMIT 100) AS t,
    (SELECT @i:=0) AS foo

#Vis3 - Data fires and burned areas by municipality all
SELECT LPAD(c.idCCAA_INE,2,'0') as idCCAA_INE, LPAD(c.IDCOMUNIDAD,2,'0') as idComunidad, c.NOMBRE as comunidad, 
LPAD(p.IDPROVINCIA,2,'0') as idProvincia, p.NOMBRE as provincia,
CONCAT(LPAD(p.idprovincia,2,'0'), LPAD(m.IDMUNICIPIO, 3, '0')) as idMunicipio, m.NOMBRE as municipio,
COUNT(*) as num_incendios, 
SUM(coalesce(p9.totalnar,0)+coalesce(p9.totalar,0)) as supquemada
FROM PIF9 p9, PIF1 p1, COMUNIDADES c, PROVINCIAS p, MUNICIPIOS m
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
AND p1.IDCOMUNIDAD = p.IDCOMUNIDAD
AND p1.IDPROVINCIA = p.IDPROVINCIA
AND p1.IDCOMUNIDAD = m.IDCOMUNIDAD
AND p1.IDPROVINCIA = m.IDPROVINCIA
AND p1.IDMUNICIPIO = m.IDMUNICIPIO
GROUP BY c.IDCOMUNIDAD, c.NOMBRE, p.IDPROVINCIA, p.NOMBRE, m.IDMUNICIPIO, m.NOMBRE
ORDER BY num_incendios DESC;
