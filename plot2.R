# Extract dataset
unzip(zipfile = "./household_power_consumption.zip")
# Load the dataset
dataset <- read.table("household_power_consumption.txt",skip=1,sep=";")
# Perform occular inspection on the dataset if it has been imported correctly
View(dataset)
#Set dataset column names
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Create subset of the data inclusive of 2007-02-01 to  2007-02-02 only
includedDataset = subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")
# Perform occular inspection on the new dataset if it has been subset-ed correctly
View(includedDataset)
#Convert rows of Date and Time into date object and POSIXlt
includedDataset$Date <- as.Date(includedDataset$Date, format="%d/%m/%Y")
includedDataset$Time <- strptime(includedDataset$Time, format="%H:%M:%S")
includedDataset[1:1440,"Time"] <- format(includedDataset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
includedDataset[1441:2880,"Time"] <- format(includedDataset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#Plot the diagram
plot(includedDataset$Time,as.numeric(as.character(includedDataset$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
