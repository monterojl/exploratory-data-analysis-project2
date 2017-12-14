# Question 1 (Plot1)

## Uncomment to load data the first time
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Summarize with tapply emissions per year
totals<-with(NEI, tapply(Emissions, year, sum, na.rm = T))

# Plot emissions using base plot system scaled by /10^3 to allow better reading
png(filename = "plot1.png")
plot(names(totals), totals/10^3, ylab = "PM2.5 Emissions (10^3 tons)", type = "l", xlab = "Year")
title(main="PM2.5 Total Emissions in US")
dev.off()