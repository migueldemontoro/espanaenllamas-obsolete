Median inside POSTGRESQL
========================

In order to compute the medians needed for this visualization the easiest way to do it is to use postgresql and a couple of plsql functions

1. Create a DB

    ```
    $ createdb eel_median
    ```

2. Install this two functions in the created DB (psql console)

    ```
    CREATE OR REPLACE FUNCTION array_sort (ANYARRAY)
    RETURNS ANYARRAY LANGUAGE SQL
    AS $$
    SELECT ARRAY(
        SELECT $1[s.i] AS "foo"
        FROM generate_series(array_lower($1,1), array_upper($1,1)) AS s(i)
        ORDER BY foo
    );
    $$;

    CREATE OR REPLACE FUNCTION percentile_cont(myarray real[], percentile real)
    RETURNS real AS
    $$
    DECLARE
        ary_cnt INTEGER;
        row_num real;
        crn real;
        frn real;
        calc_result real;
        new_array real[];
    BEGIN
        ary_cnt = array_length(myarray,1);
        row_num = 1 + ( percentile * ( ary_cnt - 1 ));
        new_array = array_sort(myarray);
        crn = ceiling(row_num);
        frn = floor(row_num);
        if crn = frn and frn = row_num then
            calc_result = new_array[row_num];
        else
            calc_result = (crn - row_num) * new_array[frn] 
            + (row_num - frn) * new_array[crn];
        end if;
        RETURN calc_result;
    END;
    $$
    LANGUAGE 'plpgsql' IMMUTABLE;
    ``

3. Then create and activate a virtualenv

    ```
    $ virtualenv .venv
    $ source .venv/bin/activate
    ```

4. Install a tool to migrate from MySQL to postgreSQL

    ```
    $ pip install -r requirements.txt
    ```

5. Execute it with m¡no config file to generate one for you. We are insterested only in table PIF2 that will hold the median times needed, enter the connection info to MySQL and PostgreSQL and execute the py-mysql2pgsql tool

    ```
    $ py-mysql2pgsql -v -f mysql2pgsql.yml
    ```

_It might throw an error regarding the creation of an index, if so create a primary key for IDPIF and ICOMUNIDAD manually_

6. Run the appropiate query to obtain the data

7. Get rid of Ceuta since it does not have enough data to be meaningful
 
