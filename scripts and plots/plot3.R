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

#df$Weekday <- format(df$Date,"%A")

df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

png("plot3.png")

plot(df$DateTime, df$Sub_metering_1,
  type="l",
  ylab = "Energy sub metering",
  xlab = "")

lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")

legend("topright",
  legend = names(df[ , c(7:9)]),
  lty=c(1, 1, 1),
  col=c("black", "red", "blue"))

dev.off()