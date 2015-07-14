Top100 Municipios update
========================

If we need to change the geojson file to accomodate new municipalities or delete some, here is how we should proceed.

1. Go to [FusionTables](https://www.google.com/fusiontables/DataSource?docid=1dZmI6Ou0eepkdKcR1VOKmwBTWRAPpuQdgYkeXOQ) and download the filtered KML from the map view

2. Use gdal tool ogr2ogr to convert it to geoJSON keeping only the IDmuni field

    ```
    $ ogr2ogr -f GeoJSON -select IDmuni eel_2013.geojson eel_2013.kml
    ```

3. Rename the property inside the geoJSON to idMunicipio to be coherent with what the app is expecting.

4. Remove unused geometries and happy mapping