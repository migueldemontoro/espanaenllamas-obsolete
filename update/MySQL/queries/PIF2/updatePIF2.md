update PIF2
===========

Dates and times for when a forest fire is detected, controlled and extinguished are created separatedly in the original database and that makes it more difficult to analyze so we have altered the PIF2 schema to include the combined data.

Once you have the new data loaded in you should run the _updatePIF2.sql_ query in your MySQL DB to create those calculated fields for the new forest fires.

 