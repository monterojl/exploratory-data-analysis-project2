# Question 5 (Plot5)

## Uncomment to load data the first time
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting Baltimore data & SCC coal-combustion related
SCCsub<-SCC[grep(" Veh ", SCC$Short.Name),]$SCC
NEIsub<-subset(NEI, fips == "24510" & SCC %in% SCCsub)

# Sumarize of Emissions grouped by year
totals<-with(NEIsub, tapply(Emissions, year, sum, na.rm = T))

# Plot emissions using base plot system
png(filename = "plot5.png")
plot(names(totals), totals, ylab = "PM2.5 Emissions (tons)", xlab = "Year", type="l")
title(main="PM2.5 Total Emissions from motor vehicles in Baltimore")
dev.off()