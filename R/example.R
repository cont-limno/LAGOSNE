#First set the working directory
setwd("C:\\Users\\FWL\\Dropbox\\CSI-LIMNO_DATA\\LAGOSData\\Version1.054.1\\LAGOS_ver1.054.1_R_package")

# loading functions
source("LAGOS1.054.1")

# 
list <- c("iws.lulc","epi.nutr","iws.conn" , "hu4.chag")
testdataframe <- multiMerge(list)
head(testdataframe)
