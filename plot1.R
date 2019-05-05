# Extract dataset
unzip(zipfile = "./household_power_consumption.zip")
# Load the dataset
dataset = read.table("household_power_consumption.txt",skip=1,sep=";")
# Perform occular inspection on the dataset if it has been imported correctly
View(dataset)
#Set dataset column names
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Create subset of the data inclusive of 2007-02-01 to  2007-02-02 only
includedDataset = subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")
# Perform occular inspection on the new dataset if it has been subset-ed correctly
View(includedDataset)

#Plot the diagram
hist(as.numeric(as.character(includedDataset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
