# Question 2 (Plot2)

## Uncomment to load data the first time
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore data
NEIsub<-subset(NEI, fips == "24510")

# Summarize with tapply emissions per year
totals<-with(NEIsub, tapply(Emissions, year, sum, na.rm = T))

# Plot emissions using base plot system
png(filename = "plot2.png")
plot(names(totals), totals, ylab = "PM2.5 Emissions (tons)", xlab = "Year", type="l")
title(main="PM2.5 Total Emissions in Baltimore")
dev.off()