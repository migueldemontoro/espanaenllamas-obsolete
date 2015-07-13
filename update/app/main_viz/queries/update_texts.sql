# Forest fires taking into account the two duplicates
SELECT COUNT(*)-2, SUM(p9.totalar+p9.totalnar) as supquemada_total FROM PIF0 p0, PIF9 p9
WHERE p0.IDPIF = p9.IDPIF;

# Forest fires of more than 100Ha taking into account the two duplicates
SELECT COUNT(*)-2, SUM(p9.totalar+p9.totalnar) as supquemada_total FROM PIF0 p0, PIF9 p9
WHERE p0.IDPIF = p9.IDPIF
AND (p9.totalar+p9.totalnar) >= 100;

#Minihistoria1 Intencionados
SELECT p4.idgrupocausa AS causa, COUNT(*) AS number, COUNT(*) / T.total * 100 AS percent
FROM PIF4 p4,
     (SELECT COUNT(*) AS total FROM PIF4) AS T
GROUP BY causa;

#Minihistoria1 Galicia
SELECT p1.idcomunidad, c.nombre, COUNT(*) AS numIncendios, SUM(p9.totalar+p9.totalnar) as supQuemada
FROM PIF9 p9, PIF1 p1, COMUNIDADES c
WHERE p9.IDPIF = p1.IDPIF
AND p1.idcomunidad = c.idcomunidad
GROUP BY p1.idcomunidad, c.nombre
ORDER BY supQuemada desc;

#Minihistoria1 Galicia Porcentaje Intencionados
SELECT p4.idgrupocausa, COUNT(*) AS numIncendios, COUNT(*) / T.total * 100 AS percent
FROM PIF4 p4, PIF1 p1, (SELECT COUNT(*) as total FROM PIF4 p4, PIF1 p1 WHERE p4.IDPIF = p1.IDPIF AND p1.idcomunidad = 3) as T
WHERE p4.IDPIF = p1.IDPIF
AND p1.idcomunidad = 3
GROUP BY p4.idgrupocausa
ORDER BY percent desc;

#Minihistoria2 - GIF
SELECT COUNT(*) AS numIncendios, COUNT(*) / T.total * 100 AS perc_count, SUM(p9.totalar + p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, (SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE (p9.totalar + p9.totalnar) >= 500;

#Minihistoria2 - GIF, Rioja
SELECT p1.idcomunidad, c.nombre, COUNT(*) AS numGIF
FROM PIF9 p9, PIF1 as p1, COMUNIDADES as c
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
AND (p9.totalar + p9.totalnar) >= 500
GROUP BY p1.idcomunidad, c.nombre
ORDER BY numGIF desc;

#Minihistoria3 - Incendios en verano
SELECT COUNT(*) as numIncendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PIF2 as p2,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p2.IDPIF
AND MONTH(p2.COMB_DET) IN (6,7,8,9);

#Minihistoria3 - Mes con más incendios
SELECT MONTH(p2.COMB_DET) as mes, COUNT(*) as numIncendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PIF2 as p2,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p2.IDPIF
GROUP BY mes
ORDER BY numIncendios desc;

#Minihistoria3 - 27 de julio
SELECT COUNT(*) as numIncendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PIF2 as p2,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p2.IDPIF
AND DAY(p2.COMB_DET) = 27
AND MONTH(p2.COMB_DET) = 7;

#Minihistoria4 - Extremadura
SELECT COUNT(*) as numIncendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PIF1 as p1, PIF0 as p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9, PIF1 as p1 WHERE p9.IDPIF = p1.IDPIF AND p1.IDCOMUNIDAD = 14) as T
WHERE p9.IDPIF = p1.IDPIF
AND p9.IDPIF = p0.IDPIF
AND p1.IDCOMUNIDAD = 14
AND p0.ANIO = 2003;

#Minihistoria4 - Rayos
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PIF4 as p4,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p4.IDPIF
AND p4.IDGRUPOCAUSA = 1;

#Minihistoria5 - Indicadores por año
SELECT p0.ANIO, COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF0 as p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p0.IDPIF
GROUP BY p0.ANIO
ORDER BY numIncendios desc;

#Minihistoria6 - Galicia
SELECT p1.IDCOMUNIDAD, c. nombre, COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF1 p1, COMUNIDADES c,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
GROUP BY p1.IDCOMUNIDAD, c.nombre
ORDER BY numIncendios desc;

#Minihistoria6 - Galicia Provincias
SELECT p1.IDCOMUNIDAD, c. nombre, p1.IDPROVINCIA, COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF1 p1, COMUNIDADES c,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
GROUP BY p1.IDCOMUNIDAD, c.nombre, p1.IDPROVINCIA
ORDER BY numIncendios desc;

#Minihistoria6 - Galicia 2006
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF1 p1, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9, PIF1 p1 WHERE p9.IDPIF = p1.IDPIF AND p1.IDCOMUNIDAD = 3) as T
WHERE p9.IDPIF = p1.IDPIF
AND p9.IDPIF = p0.IDPIF
AND p1.IDCOMUNIDAD = 3
AND P0.ANIO = 2006
ORDER BY numIncendios desc;

#Minihistoria7 - Canarias 2007
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF1 p1, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9, PIF1 p1 WHERE p9.IDPIF = p1.IDPIF AND p1.IDCOMUNIDAD = 12) as T
WHERE p9.IDPIF = p1.IDPIF
AND p9.IDPIF = p0.IDPIF
AND p1.IDCOMUNIDAD = 12
AND P0.ANIO = 2007
ORDER BY numIncendios desc;

#Minihistoria7 - Canarias 2012 GIF
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, SUM(p9.totalar+p9.totalnar) as supQuemada, SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup,
SUM(p9.MUERTOS) as tot_muertos, SUM(p9.HERIDOS) as tot_heridos
FROM PIF9 p9, PIF1 p1, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9, PIF1 p1 WHERE p9.IDPIF = p1.IDPIF AND p1.IDCOMUNIDAD = 12) as T
WHERE p9.IDPIF = p1.IDPIF
AND p9.IDPIF = p0.IDPIF
AND p1.IDCOMUNIDAD = 12
AND P0.ANIO = 2012
AND (p9.totalar + p9.totalnar) >= 500
ORDER BY numIncendios desc;

#Minihistoria8 - Superficie parques naturales
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, 
SUM(pe.SARBOLADA + pe.SNAHERBACEA + pe.SNALENOSA) as supQuemada, 
SUM(pe.SARBOLADA + pe.SNAHERBACEA + pe.SNALENOSA) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PENP pe, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = pe.IDPIF
AND p9.IDPIF = p0.IDPIF
AND P0.ANIO BETWEEN 2005 AND 2013;

#Minihistoria8 - Superficie parques naturales v2
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, 
SUM(p9.TOTALAR + p9.TOTALNAR) as supQuemada, 
SUM(p9.TOTALAR + p9.TOTALNAR) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PENP pe, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = pe.IDPIF
AND p9.IDPIF = p0.IDPIF
AND P0.ANIO BETWEEN 2005 AND 2013;

#Minihistoria8 - Lago de sanabria
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, 
SUM(pe.SARBOLADA + pe.SNAHERBACEA + pe.SNALENOSA) as supQuemada, 
SUM(pe.SARBOLADA + pe.SNAHERBACEA + pe.SNALENOSA) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PENP pe, PIF0 p0,
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = pe.IDPIF
AND p9.IDPIF = p0.IDPIF
AND pe.IDENP = 4922003;

#Minihistoria8 - Lago de sanabria v2
SELECT COUNT(*) as numIncendios, COUNT(*) / T.total *100 as perc_incendios, 
SUM(p9.totalar + p9.totalnar) as supQuemada, 
SUM(p9.totalar + p9.totalnar) / T.supTotal * 100 as perc_sup
FROM PIF9 p9, PENP pe
(SELECT COUNT(*) as total, SUM(totalar+totalnar) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = pe.IDPIF
AND pe.IDENP = 4922003;




