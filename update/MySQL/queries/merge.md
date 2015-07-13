Merge new data
==============

To merge the old data with the new data and obtain a new complete database we need to take into account the following characteristics:

## INSERT TABLES

### Tables with forest fires id

These tables are safely inserted into the new database and should give us no headaches since they are identified with a new forest fire id and that id has the year included so no duplicates should be found.

* PIF0
* PIF1
* PIF2
* PIF3
* PIF4
* PIF5
* PIF6
* PIF7
* PIF8
* PIF9
* PIF10

### Tables the relate forest fires with particular forest areas

These tables that relate the forest fire with particular data for each affected forest area are also safe to insert for the same reason as above

* PDPM0
* PDPM1 
* PDPM2
* PDPM3
* PDPM4
* PDPM5
* PDPM6
* PDPM7

### Tables that relate forest fires and natural parks

These tables that relate the forest fire with particular data for each affected forest area are also safe to insert since they refer to a new forest fire which we don't have in the old data.

* PENP

### Table that relate forest fires with personnel

This table indicates who has detected the forest fire when it was someone hired by the administration. Since they refer to a new forest fire which we don't have in the old data.

* REL_PIF3_VIGILANTEFIJO

### Valoration tables (_unused at the moment_)

These tables include a economic valoration for a series of dimensions, since they are rerefed to a particular year, these are also safe to insert

* ESPECIES_VALORACION
* PRODUCTOS_VALORACION
* TIPORENTA_VALORACION

### QUERY

An example query that inserts this new values can be found [here](./insert/insert.sql) change the DBs accordingly

## REPLACE INTO TABLES

### Auxiliary tables

These tables contains descriptions of identifiers for the characterization of a forest fire in all spanish official languages. Normally they do not change but it's not harmful to update with the new dataset to be sure

* ALTERACION
* ATAQUE
* CAUSA
* CAUSANTE
* CAUSAS
* CLASEDIA
* DETECTADOPOR
* EFECTOVSYEL
* ESPECIES
* GRUPOCAUSAS
* IDIOMAS
* INCIDENCIASPC
* INICIADOJUNTOA
* MEDIOSTRANSPORTE
* MODELOSCOMBUSTIBLE
* MOTIVACION
* PELIGRO
* PRODUCTOS
* REL_TIPOSENP
* REROSION
* RETARDANTE
* SINO
* SITUACIONLM
* SUPARBOLADAAFAUTOR
* TECNICAATAQUEINDIRECTO
* TIPOENPDESCRIPCION
* TIPOFUEGO
* TIPORENTA
* TIPOSENP

### Administrative tables

These tables hold the administrative divisions where the forest fire has occured together with their descriptions geolocations and an updated forest situation

* COMARCAOISLA
* COMUNIDADES
* ENTIDADESMENORES
* MUNICIPIOS (needs a special processing described [here](./MUNICIPIOS/updateMUNICIPIOS.md))
* PROVINCIAS

### National and natural parks tables (_unused at the moment_)

These tables contain the identifiers for the national and natural parks of Spain since they contain area data it is best to update the info so that we have the latest information

* ENP
* MONTES

### Weather stations (_unused at the moment_)

This table contains info about the weather stations in spain. It is best to perform an _upsert_ to have always the latest data. 

* ESTACIONESMETEOROLOGICAS

### Hired Personnel

This table contains info about the hired personnel that watch forests continously

*VIGILANTEFIJO

### Empty tables (_unused at the moment_)

Up to now these tables are always empty so just ignore them (after chacking that the new year stays empty of course)

* AGRUPACIONDEMUNICIPIOS
* AGRUPACIONDETALLE

### QUERY

An example query that _upserts_ this new values replacing the old ones can be found [here](./upsert/replace.sql) change the DBs accordingly



