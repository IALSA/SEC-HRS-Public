
# remove all elements for a clean start
rm(list=ls(all=TRUE))
cat("\014")


# Importing raw RAND files version A.
pathDir <- getwd()
pathFolder <- file.path(pathDir,"Data/Extract/RAND_vA")
pathFolderSPSS <- file.path(pathFolder,"spss")

pathFile1 <- file.path(pathFolderSPSS, "h04f1a.sav")
pathFile1RDS <- file.path(pathFolder, "h04f1a.Rds")

pathFile2 <- file.path(pathFolderSPSS, "h06f2b.sav")
pathFile2RDS <- file.path(pathFolder, "h06f2b.Rds")

pathFile3 <- file.path(pathFolderSPSS, "h08f2a.sav")
pathFile3RDS <- file.path(pathFolder, "h08f2a.Rds")

pathFile4 <- file.path(pathFolderSPSS, "h10f4a.sav")
pathFile4RDS <- file.path(pathFolder, "h10f4a.Rds")

pathFile5 <- file.path(pathFolderSPSS, "h12e1a.sav")
pathFile5RDS <- file.path(pathFolder, "h12e1a.Rds")

require(foreign)
#Next three lines are run the first time on machine
 #ds0_1 <- read.spss(file = pathFile1, use.value.labels=TRUE)
 #ds0_1 <- data.frame(ds0_1)
 #saveRDS(object = ds0_1, file=pathFile1RDS, compress="xz")
ds04full <- readRDS(pathFile1RDS)
ds06full <- readRDS(pathFile2RDS)

require(dplyr)
# rename variables for 2004 wave subset
ds04full <- readRDS(pathFile1RDS)
ds04 <- ds04full[1:100,]
source("./Scripts/Data/rename2004.R")
ds04 <- ds04[,keepvars04]


# rename variables for 2006 wave subset
ds06full <- readRDS(pathFile2RDS)
ds06 <- ds06full[1:100,]
source("./Scripts/Data/rename2006.R")
ds06 <- ds06[,keepvars06]

