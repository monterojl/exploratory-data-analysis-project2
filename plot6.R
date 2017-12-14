# Question 6 (Plot6)

## Uncomment to load data the first time
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

require(ggplot2)
require(reshape2)

# Subsetting Baltimore data & SCC coal-combustion related
SCCsub<-SCC[grep(" Veh ", SCC$Short.Name),]$SCC
NEIsub<-subset(NEI, (fips == "24510" | fips == "06037") & SCC %in% SCCsub)
totals<-with(NEIsub, tapply(Emissions, list(fips, year), sum, na.rm = T))

# Reshape it: 
# - convert to data.frame
# - include fips as column
# - melting year columns as row values
# - Setting names
totalsFrame<-as.data.frame(totals)
totalsFrame$fips<-rownames(totalsFrame)
totalsFrame<-melt(totalsFrame, id="fips")
names(totalsFrame)<-c( "fips", "year", "total")

# Plot using ggplot2 by fips
png(filename = "plot6.png")
g<-ggplot(totalsFrame, aes(year, total))
g<-g+geom_point(aes(color = fips))
g<-g+scale_color_manual(labels = c("Los Angeles", "Baltimore"), values = c("red", "blue"))
g<-g+labs(title="PM2.5 Total Emissions in Baltimore")+labs(x="Year")+labs(y="PM2.5 Emissions (tons)")
print(g)
dev.off()