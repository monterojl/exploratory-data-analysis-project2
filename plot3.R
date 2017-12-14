# Question 3 (Plot3)

## Uncomment to load data the first time
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

require(ggplot2)
require(reshape2)

# Subset Baltimore data
NEIsub<-subset(NEI, fips == "24510")

# Summarize of Emissions grouped by type and year
totals<-with(NEIsub, tapply(Emissions, list(type, year), sum, na.rm = T))

# Reshape it: 
# - convert to data.frame
# - include type as column
# - melting year columns as row values
# - Setting names
totalsFrame<-as.data.frame(totals)
totalsFrame$type<-rownames(totalsFrame)
totalsFrame<-melt(totalsFrame, id="type")
names(totalsFrame)<-c( "type", "year", "total")

# Plot using ggplot2 by type
png(filename = "plot3.png")
g<-ggplot(totalsFrame, aes(year, total))
g<-g+geom_bar(stat="identity", aes(color = type, fill = type))+facet_grid(.~type)
g<-g+labs(title="PM2.5 Total Emissions in Baltimore")+labs(x="Year")+labs(y="PM2.5 Emissions (tons)")
print(g)
dev.off()