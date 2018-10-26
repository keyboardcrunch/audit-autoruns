# audit-autoruns

## What is this
This powershell script filters through the Time entry listed for each autorun within a csv and attempts to show things with a recent modify date. It's only for quick analysis, I always keep the entire startup.csv until the investigation is over so I can revisit it if needed.

## Autorunsc
How I'm exporting the csv file this script audits.

  autorunsc64.exe -nobanner -a bdehiklmoprstw -c -o startup.csv

## Problems
* Everything here is subject to timestamp modification so this method of filtering out date isn't the most accurate but hackers can be lazy too.
* Microsoft entries have a mix of future and past dates, the script tries to filter those out.
* This script takes a path string and won't accept objects, you cannot pipe autorunsc output into audit-autoruns because of this but I don't trust this method that far.
