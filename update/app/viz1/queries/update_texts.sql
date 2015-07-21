# Vis1 - Detectado por
SELECT p3.IDDETECTADOPOR, d.descripcion,
COUNT(*) AS numIncendios, COUNT(*) / T.total * 100 AS perc_count
FROM PIF3 p3, DETECTADOPOR d,
(SELECT COUNT(*) as total FROM PIF3 p3) as T
WHERE p3.IDDETECTADOPOR = d.IDDETECTADOPOR
AND d.IDIDIOMA = 0
GROUP BY p3.IDDETECTADOPOR, d.descripcion
ORDER BY numIncendios desc;

#Vis1 - Causas
SELECT p4.IDGRUPOCAUSA, g.descripcion,
COUNT(*) AS numIncendios, COUNT(*) / T.total * 100 AS perc_count
FROM PIF4 p3, GRUPOCAUSAS g,
(SELECT COUNT(*) as total FROM PIF4 p4) as T
WHERE p4.IDGRUPOCAUSA = g.IDGRUPOCAUSA
AND g.IDIDIOMA = 0
GROUP BY p4.IDGRUPOCAUSA, g.descripcion
ORDER BY numIncendios desc;

#Vis1 - Data
SELECT p3.IDDETECTADOPOR, d.descripcion, p4.IDGRUPOCAUSA, g.descripcion,
COUNT(*) AS numIncendios, COUNT(*) / T.total * 100 AS perc_count,
SUM(coalesce(p9.totalar,0)+coalesce(p9.totalnar,0)) as supQuemada, SUM(coalesce(p9.totalar,0)+coalesce(p9.totalnar,0)) / T.supTotal * 100 AS perc_sup
FROM PIF3 p3, PIF4 p4, PIF9 p9, DETECTADOPOR d, GRUPOCAUSAS g,
(SELECT COUNT(*) as total, SUM(coalesce(p9.totalar,0)+coalesce(p9.totalnar,0)) as supTotal FROM PIF9 p9) as T
WHERE p9.IDPIF = p3.IDPIF
AND p9.IDPIF = p4.IDPIF 
AND p3.IDDETECTADOPOR = d.IDDETECTADOPOR
AND p4.IDGRUPOCAUSA = g.IDGRUPOCAUSA
AND d.IDIDIOMA = 0
AND d.IDIDIOMA = g.IDIDIOMA
GROUP BY p3.IDDETECTADOPOR, d.descripcion, p4.IDGRUPOCAUSA, g.descripcion 
ORDER BY p3.IDDETECTADOPOR, p4.IDGRUPOCAUSA;