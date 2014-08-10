file = "household_power_consumption.txt"
zfile = "exdata-data-household_power_consumption.zip"
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Check if the data file already exist. If not - downlad and unzip the file.
if(!file.exists(file)){
  download.file("linkForDownloading", zfile, method = "curl")
  unzip(zfile)
}

#To save time and resources only selected lines needed for the plots are loaded
#from the data file. The file has been loaded into R once and examined 
#to determine number of rows with data for 1st and 2nd February 2007.
#Header is in the first row and since we do not load it, "header" is set to false.
df <- read.csv(file, sep=";", header = F, skip=66637, nrows=2879)

#Loading only selected rows caused losing the headers, so we have to recreate
#the names manually.
names(df) <- c(
  "Date",
  "Time",
  "Global_active_power",
  "Global_reactive_power",
  "Voltage",
  "Global_intensity",
  "Sub_metering_1",
  "Sub_metering_2",
  "Sub_metering_3")

h <- df$Global_active_power

png("plot1.png")

hist(h,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)")

dev.off()