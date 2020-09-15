# problem 1 
# replace all NA values in data frame with 3
exam_data = data.frame(
  name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
  score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
  attempts = c(1, NA, 2, NA, 2, NA, 1, NA, 2, 1),
  qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)

# need to use is.na <- x for replacing 
exam_data[is.na(exam_data)] <- 3
exam_data

# problem 2
# read .csv file and find average temp in month of May and June 
aqData <- read.table("airquality(2)(3).csv", header = TRUE, sep = ",")
aqData

mean(aqData$Temp[aqData$Month == 5], na.rm = TRUE)

mean(aqData$Temp[aqData$Month == 6], na.rm = TRUE)

# problem 3
# read .csv file and remove all rows that contain NA or missing values 
# save new data frame to different .csv file 
data <- read.table("airquality(2)(3).csv", header = TRUE, sep = ",")
head(data)

new_data <- data[complete.cases(data),]
new_data

write.csv(data, "airquality_filtered.csv", quote = FALSE, row.names = FALSE)

# problem 4 
# read .csv file
# extract rows that correspond to month of May or June; and temp between 60 and 70 

data <- read.table("airquality(2)(3).csv", header = TRUE, sep = ",")
new_temp_data <- data[(data$Month == 5 | data$Month == 6) & (data$Temp >= 60 & data$Temp <= 70),]
new_temp_data


# problem 5
# read .csv 
# extract data frames that correspond to May, June, July, and August 
# save in different sheets of single excel workbook 

data <- read.table("airquality(2)(3).csv", header = TRUE, sep = ",")

# load library openxlsx
library(openxlsx)

# extract data from file
data_5 <- data[data$Month == 5,]
data_6 <- data[data$Month == 6,]
data_7 <- data[data$Month == 7,]
data_8 <- data[data$Month == 8,]

# create workbook 
wb <- createWorkbook()

# add sheets to workbook 
May <- addWorksheet(wb, sheetName = "May")
June <- addWorksheet(wb, sheetName = "June")
July <- addWorksheet(wb, sheetName = "July")
August <- addWorksheet(wb, sheetName = "August")

# write to new sheets 
writeData(wb, May, data_5, keepNA = TRUE, na.string = "NA")
writeData(wb, June, data_6, keepNA = TRUE, na.string = "NA")
writeData(wb, July, data_7, keepNA = TRUE, na.string = "NA")
writeData(wb, August, data_8, keepNA = TRUE, na.string = "NA")

# save workbook to excel file
saveWorkbook(wb, "weather_excel_data.xlsx", overwrite = TRUE)

# problem 6
# read .csv file 
# find how many days in May the temp was greater than 70

data <- read.table("airquality(2)(3).csv", header = TRUE, sep = ",")

data_5 <- data[(data$Month == 5 & data$Temp > 70),]
data_5
nrow(data_5)

# can also do like this 
sum(data[data$Temp > 70,]$Month == 5, na.rm = TRUE)
