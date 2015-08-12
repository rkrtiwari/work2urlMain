rm(list = ls())
getwd()
list.files()



source("rFunctions/mergeAndGetTopItems.R")
source("rFunctions/preprocessFile.R")


#inputDir <- file.path("~", "016-finalCodingDataWithURL", "oldFiles")
#outputDir <- file.path("~", "016-finalCodingDataWithURL", "renamedFiles")
#day0 <- strptime("20/07/2015 00:00:00", "%d/%m/%Y %H:%M:%S")
#day0 <- strptime("20/07/2015", "%d/%m/%Y")
#renameFiles(inputDir, outputDir, day0)

filename <- sprintf("%s%s", "renamedFiles/", list.files("renamedFiles/"))
filename
writeTop10(filename)

#today <- Sys.Date()
#today  <- strptime("21/07/2015", "%d/%m/%Y")
source("rFunctions/mergeAndGetTopItems.R")
source("rFunctions/preprocessFile.R")
day0 <- strptime("20/07/2015 00:00:00", "%d/%m/%Y %H:%M:%S")
today <- strptime("20/07/2015 00:00:00", "%d/%m/%Y %H:%M:%S")


filesToMerge <- filesToMerge(day0, today)
filesToMerge
filesToMergeBefore0 <- filesToMerge[[1]]
filesToMergeAfter0 <- filesToMerge[[2]]

filesToMergeBefore0 
filesToMergeAfter0

mergedDfBefore0 <- mergeFiles(filesToMergeBefore0)
mergedDfAfter0  <- mergeFiles(filesToMergeAfter0)


updatedDf <- updateCount(list(mergedDfBefore0, mergedDfAfter0))
top10Before0 <- updatedDf[[1]]
top10After0 <- updatedDf[[2]]
#allCategoryItem <- readAllCategoryItems()


#finalList <- do.call(rbind , list(top10After0, top10Before0, allCategoryItem)) %>%
#  getTopItemsInCategory()

finalList <- do.call(rbind , list(top10After0, top10Before0)) %>%
  getTopItemsInCategory()


writeFinalResult(finalList)









