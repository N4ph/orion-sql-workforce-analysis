# orion-sql-workforce-analysis
Orion Data Systems Workforce Analytics — MySQL Project
## Dataset and Project Notes

This project uses four datasets: employees, departments, jobs and countries.

The datasets were imported into MySQL Workbench under a database named `capstone`.

**Important dataset limitation:** The supplied dataset does not contain a locations table linking department location IDs to countries. Therefore, the number of departments located in each country could not be accurately calculated.

The country-level salary analysis was completed using the employee and country tables, linked through the country ID.

The project documents this limitation to ensure that the analysis remains accurate and transparent.
