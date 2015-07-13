Update data to EeL project
==========================

This document tries to compile the steps needed to update the EeL project once we receive data for a new year.

Normally this data comes in the form of a zipped file with two linked MS Access DB.

1. If using a mac use Homebrew to install mdbtools to get rid of the MS Access format

    ```
    $ brew install mdbtools
    ```

2. This toolset lets you export the schema from a MDB DB to a number of output formats, in our case we are interested in MySQL

    ```
    $ mdb-schema ADCIF.mdb mysql > schemaADCIF.sql
    $ mdb-schema EGIFWH.mdb mysql > schemaEGIFWH.sql
    ```

3. After having the schema exported we will use the _mdb-export_ to extract data for each table, we have created a couple of shell scripts to do that process and store the results in a sql folder

    ```
    $ ./extract_ADCIF.sh
    $ ./extract_EGIF.sh
    ```

4. Now it's time to convert the UTM coordinates that geolocate the forest fires to geographic coordinates that web mapping tools can comprehend. On the windows folder there's a tool developed by _jose guerrero_ (thanks a lot) that allows you to create an input text file with the UTM coordinates and it will return the corresponding geographic coordinates.

5. Then some Excel templates to create an update QUERY out of the previous step output data and we are ready to insert our geolocation to the forest fires and cities.

6. We can use the provided MySQL schema to create the DB inside MySQL _eel\_schema.sql_ and populate it with the new data by itself

7. After that we need to merge the old dataset with the new dataset but that is explained in [another document](./MySQL/queries/merge.md)

