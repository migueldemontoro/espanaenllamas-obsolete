#Vis2 - Número de incendios con todos los datos
SELECT COUNT(*) as num_incendios
FROM PIF2 p2
WHERE p2.COMB_EXT IS NOT NULL
AND p2.COMB_CTRL IS NOT NULL
AND p2.COMB_LLEGPMT IS NOT NULL;

#Vis2 - Incendio de 200 años
SELECT *
FROM PIF2 p2
WHERE p2.IDPIF = 2005450096;

#Vis2 - Incendios por comunidad
SELECT p1.IDCOMUNIDAD as idcomunidad, c.NOMBRE as comunidad, COUNT(*) as num_incendios, SUM(coalesce(p9.totalar,0)+coalesce(p9.totalnar,0)) as supquemada
FROM PIF1 p1, PIF9 p9, COMUNIDADES c
WHERE p9.IDPIF = p1.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
GROUP BY p1.IDCOMUNIDAD, c.NOMBRE

#Vis2 - Incendios por comunidad y año
SELECT p1.IDCOMUNIDAD as idcomunidad, c.NOMBRE as comunidad, p0.ANIO as anio, 
COUNT(*) as num_incendios, SUM(p9.totalar+p9.totalnar) as supquemada
FROM PIF1 p1, PIF9 p9, PIF0 p0, COMUNIDADES c
WHERE p9.IDPIF = p1.IDPIF
AND p9.IDPIF = p0.IDPIF
AND p1.IDCOMUNIDAD = c.IDCOMUNIDAD
GROUP BY p1.IDCOMUNIDAD, c.NOMBRE, p0.ANIO

#Vis2 - Data (Postgresql with required functions) total
select count(*) as num_incendios, 
SUM(coalesce(p9."TOTALAR",0)+coalesce(p9."TOTALNAR",0)) as supquemada,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_LLEGPMT" - p2."COMB_DET"))/60 as real)), 0.50) as median_llegpmt,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_CTRL" - p2."COMB_DET"))/60 as real)), 0.50) as median_ctrl,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_EXT" - p2."COMB_DET"))/60 as real)), 0.50) as median_ext
from "PIF9" p9, "PIF1" p1, "PIF2" p2
WHERE p9."IDPIF" = p1."IDPIF"
AND p9."IDPIF" = p2."IDPIF"
AND p1."IDCOMUNIDAD" <> 18
AND p2."COMB_EXT" is not NULL AND p2."COMB_CTRL" is not NULL and p2."COMB_LLEGPMT" is not NULL;

#Vis2 - Data (Postgresql with required functions) by region
select p1."IDCOMUNIDAD" as idcomunidad, trim(trailing from c."NOMBRE") as comunidad, 
count(*) as num_incendios, 
SUM(coalesce(p9."TOTALAR",0)+coalesce(p9."TOTALNAR",0)) as supquemada,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_LLEGPMT" - p2."COMB_DET"))/60 as real)), 0.50) as median_llegpmt,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_CTRL" - p2."COMB_DET"))/60 as real)), 0.50) as median_ctrl,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_EXT" - p2."COMB_DET"))/60 as real)), 0.50) as median_ext
from "PIF9" p9, "PIF1" p1, "PIF2" p2, "COMUNIDADES" c
WHERE p9."IDPIF" = p1."IDPIF"
AND p9."IDPIF" = p2."IDPIF"
AND p1."IDCOMUNIDAD" = c."IDCOMUNIDAD"
AND p2."COMB_EXT" is not NULL AND p2."COMB_CTRL" is not NULL and p2."COMB_LLEGPMT" is not NULL
AND p1."IDCOMUNIDAD" <> 18
GROUP BY idcomunidad, comunidad
ORDER BY idcomunidad;

#Vis2 - Data (Postgresql with required functions) by region and year
select p1."IDCOMUNIDAD" as idcomunidad, trim(trailing from c."NOMBRE") as comunidad,
p0."ANIO" as anio, 
count(*) as num_incendios, 
SUM(coalesce(p9."TOTALAR",0)+coalesce(p9."TOTALNAR",0)) as supquemada,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_LLEGPMT" - p2."COMB_DET"))/60 as real)), 0.50) as median_llegpmt,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_CTRL" - p2."COMB_DET"))/60 as real)), 0.50) as median_ctrl,
percentile_cont(array_agg(cast(EXTRACT(EPOCH FROM (p2."COMB_EXT" - p2."COMB_DET"))/60 as real)), 0.50) as median_ext
from "PIF9" p9, "PIF0" p0, "PIF1" p1, "PIF2" p2, "COMUNIDADES" c
WHERE p9."IDPIF" = p0."IDPIF"
AND p9."IDPIF" = p1."IDPIF"
AND p9."IDPIF" = p2."IDPIF"
AND p1."IDCOMUNIDAD" = c."IDCOMUNIDAD"
AND p2."COMB_EXT" is not NULL AND p2."COMB_CTRL" is not NULL and p2."COMB_LLEGPMT" is not NULL
AND p1."IDCOMUNIDAD" <> 18
GROUP BY idcomunidad, comunidad, anio
ORDER BY idcomunidad, anio;