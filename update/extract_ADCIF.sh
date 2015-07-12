#!/bin/bash
for i in $( mdb-tables ADCIF_COMUNES.mdb ); 
    do echo $i; 
    mdb-export -D "%Y-%m-%d %H:%M:%S" -H -I mysql ADCIF_COMUNES.mdb $i > sql/$i.sql; 
done