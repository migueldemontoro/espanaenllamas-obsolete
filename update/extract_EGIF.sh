#!/bin/bash
for i in $( mdb-tables EGIFWH.mdb ); 
    do echo $i; 
    mdb-export -D "%Y-%m-%d %H:%M:%S" -H -I mysql EGIFWH.mdb $i > sql/$i.sql; 
done