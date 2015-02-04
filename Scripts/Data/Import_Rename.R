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

require(foreign)
# Next three lines are run the first time on machine
# ds0_1 <- read.spss(file = pathFile1, use.value.labels=TRUE)
# ds0_1 <- data.frame(ds0_1)
# saveRDS(object = ds0_1, file=pathFile1RDS, compress="xz")
ds04full <- readRDS(pathFile1RDS)
ds4 <- ds04full[1:100,]



require(plyr)

ds <- plyr::rename(ds4, 
                   
                   replace = c("HHIDPN"="id",
                   "BIRTHYF"="BIRTHYFDis",
                   "BIRTHYD"="BIRTHYDis",
                   "JCSR01"="CSR04",
                   "JN_INHH"="RHHold",
                   "JANYFINR"="FinRespHH",
                   "JFIN_RHP"="FinRespID",
                   "JFINR01"="FinResp04",
                   "JNOFINR"="NoFinData",
                   "JANYFAMR"="FamResp",
                   "JFAM_RHP"="FamRespID",
                   "JFAMR01"="FamResp04",
                   "JNOFAMR"="NoFamData",
                   "BIRTHMO"="birthM",
                   "BIRTHYR"="birthY",
                   "DEGREE"="degree",
                   "FIRSTIW"="Firstiyr",
                   "GENDER"="female",
                   "HISPANIC"="Hispanic",
                   "IMMGYEAR"="Immgyear",
                   "OVHHIDC"="OldHRSPN",
                   "OVPNC"="OldHRSPN",
                   "OVRESULT"="OverlapCas",
                   "RACE"="race",
                   "SCHLYRS"="eduyears",
                   "SECU"="sampleerr",
                   "STRATUM"="stratumid",
                   "STUDY"="study",
                   "USBORN"="usborn",
                   "WTCOHORT"="wbirthcohort",
                   "JCORES"="Coresstatus"))



