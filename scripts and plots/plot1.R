file = "household_power_consumption.txt"

df <- read.csv(file, sep=";", header = F, skip=66637, nrows=2879)

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

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Weekday <- format(df$Date,"%A")

h <- df$Global_active_power

hist(h,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")

def.off()