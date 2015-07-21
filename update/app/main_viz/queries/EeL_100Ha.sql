# EeL >= 100Ha query
select pif1.idpif as 'IDPIF', 
coalesce(totalar,0)+coalesce(totalnar,0) as 'SUPQUEMADA',
SQRT((coalesce(totalar,0)+coalesce(totalnar,0))*10000/PI()) as 'RADIO_M',
if(muertos,muertos,0) as 'MUERTOS', 
if(heridos,heridos,0) as 'HERIDOS',
pif1.idcomunidad as 'IDCOMUNIDAD',
comunidades.nombre as 'COMUNIDAD',
pif1.idprovincia as 'IDPROVINCIA', 
provincias.nombre as 'PROVINCIA',  
comarcaoisla.nombre as 'COMARCA',
municipios.nombre as 'MUNICIPIO', 
if(pif1.latitud,pif1.latitud,municipios.latitud) as 'LATITUD', 
if(pif1.longitud,pif1.longitud,municipios.longitud) as 'LONGITUD', 
date_format(deteccion,"%Y-%m-%d") as 'FECHA', 
if(comb_ctrl,cast((to_seconds(comb_ctrl)-to_seconds(comb_det))/60 as unsigned),cast(0 as unsigned)) as 'TIME_CTRL', 
if(comb_ext,cast((to_seconds(comb_ext)-to_seconds(comb_det))/60 as unsigned),cast(0 as unsigned)) as 'TIME_EXT', 
if(pif4.idgrupocausa=4, 1, 0) as 'RES_GRP_CAUSA',
grupocausas.idgrupocausa as 'IDGRUPOCAUSA', 
if(pif4.idgrupocausa=4, motivacion.descripcion,causas.descripcion) as 'CAUSA', 
coalesce(tecnicos,0)+coalesce(agentesf,0)+coalesce(cuadybrig,0)+
coalesce(bomberos,0)+coalesce(volunorg,0)+coalesce(opercivil,0)+coalesce(guardiaci,0)+coalesce(fuejercit,0) as 'PERSONAL', 
coalesce(autobomba,0)+coalesce(bulldozer,0)+coalesce(tractores,0)+coalesce(otros,0) as 'PESADOS', 
coalesce(avianfnum,0)+coalesce(avicarnum,0)+coalesce(helextnum,0)+coalesce(heltranum,0)+coalesce(aercoonum,0) as 'AEREOS',
sum(coalesce(gext,0)) as 'GASTOS_EXT', sum(coalesce(totalper,0)) as 'PERDIDAS'
from comunidades, provincias, comarcaoisla, municipios, grupocausas, causas, motivacion,
pif9, pif4, pif1 
    left join pif2 on (pif1.idpif=pif2.idpif) 
    left join pif7 on (pif1.idpif=pif7.idpif)
    left join pdpm7 on (pif1.idpif=pdpm7.idpif)
where pif1.idpif=pif4.idpif 
and pif1.idpif=pif9.idpif
and comunidades.idcomunidad=pif1.idcomunidad
and provincias.idcomunidad=pif1.idcomunidad 
and provincias.idprovincia=pif1.idprovincia 
and comarcaoisla.idcomunidad=comunidades.idcomunidad 
and comarcaoisla.idcoi=pif1.idcoi
and municipios.idcomunidad=pif1.idcomunidad 
and municipios.idprovincia=pif1.idprovincia
and pif1.idmunicipio=municipios.idmunicipio 
and pif4.idgrupocausa=grupocausas.idgrupocausa 
and grupocausas.ididioma=0
and pif4.idgrupocausa=causas.idgrupocausa
and pif4.idcausas=causas.idcausas 
and causas.ididioma=0
and motivacion.idmotivacion=IFNULL(pif4.idmotivacion,0)
and motivacion.ididioma=0
and coalesce(totalar,0)+coalesce(totalnar,0) >= 100
group by pif1.idpif
order by supquemada desc