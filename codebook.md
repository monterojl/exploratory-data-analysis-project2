# Purpose of the project
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. 


# Data source
The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment [29Mb]: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

* fips: A five-digit number (represented as a string) indicating the U.S. county
* SCC: The name of the source as indicated by a digit string (see source code classification table)
* Pollutant: A string indicating the pollutant
* Emissions: Amount of PM2.5 emitted, in tons
* type: The type of source (point, non-point, on-road, or non-road)
* year: The year of emissions recorded

Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

# R Script: "plot1.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per year without NAs from NEI

# R Script: "plot2.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
NEIsub: subset of NEI including only Baltimore data
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per year without NAs from NEIsub

# R Script: "plot3.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
NEIsub: subset of NEI including only Baltimore data
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per type and year without NAs from NEIsub
totalsFrame: totals coverted into a frame
g: ggplot2 output

## Transformations
totalsFrame have been reshaped as the 2 variables grouping from tapply output is not tidy

- convert to data.frame
- include type as column
- melting year columns as row values
- setting names

# R Script: "plot4.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
NEIsub: subset of NEI including only coal-combustion related data
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per year without NAs from NEIsub

# R Script: "plot5.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
NEIsub: subset of NEI including only Baltimore and coal-combustion related data
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per year without NAs from NEIsub

# R Script: "plot6.R"
## Variables
NEI: data from file "summarySCC_PM25.rds"
NEIsub: subset of NEI including only Baltimore and coal-combustion related data
SCC: data from file "Source_Classification_Code.rds"
totals: summary of total emissions per type and year without NAs from NEIsub
totalsFrame: totals coverted into a frame
g: ggplot2 output

## Transformations
totalsFrame have been reshaped as the 2 variables grouping from tapply output is not tidy

- convert to data.frame
- include type as column
- melting year columns as row values
- setting names
