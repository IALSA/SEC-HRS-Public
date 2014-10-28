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
ds01 <- readRDS(pathFile1RDS)

#Next three lines are run the first time on machine
#ds0_2 <- read.spss(file=pathFile2, use.value.labels=TRUE)
#ds0_2 <- data.frame(ds0_2)
#saveRDS(object = ds0_2, file=pathFile2RDS, compress="xz")
ds02 <- readRDS(pathFile2RDS)

#Next three lines are run the first time on machine
#ds0_3 <- read.spss(file=pathFile3, use.value.labels=TRUE)
#ds0_3 <- data.frame(ds0_3)
#saveRDS(object = ds0_3, file=pathFile3RDS, compress="xz")
ds03 <- readRDS(pathFile3RDS)

#Next three lines are run the first time on machine
#ds0_4 <- read.spss(file=pathFile4, use.value.labels=TRUE)
#ds0_4 <- data.frame(ds0_4)
#saveRDS(object = ds0_4, file=pathFile4RDS, compress="xz")
ds04 <- readRDS(pathFile4RDS)


require(dplyr)

# THis is how to select with dplyr package 
# ds <- ds01 %>%
#   dplyr::select(HHIDPN, DEGREE, GENDER, RACE, BIRTHMO, BIRTHYR)
# head(ds, 12)

# This is how to select with base package 

#  old -- new -- Description
# HHID     HOUSEHOLD IDENTIFICATION NUMBER
# PN       RESPONDENT PERSON IDENTIFICATION NUMBER
# HHIDP    Household ID = Person Number: Numeric
# BIRTHMO  Birthdate: Month 
# BIRTHYR  Birthdate: Year
# BIRTHYD  Max different between Tracker and core data birth
# BIRTHYF  Flags cases with birth year 0=No difference, 1-Difference, used tracker 2=difference used other
# JZ023    Cohort
# JSUBHHN  2002 Sub-Household Identifier
# JFAMR    Family Respondent
# JFINR    Financial Respondent
# JIVIEWMO Beginning of Interview: Month
# JIVIEWYR Beginning of Interview: Year
# JNHM     Respondent in nursing home derived from core data
# JNURSHM  Respondent in nursing home from Tracker
# JCOUPLE  Wave household - couple
# JPROXY   Proxy flag
# JPN_SP   SPOUSE/PARTNER PERSON NUMBER
# JB014 -- YRSEDUC  HIGHEST LEVEL OF EDUCATION
# JB026   FATHER EDUCATION- HIGHEST GRADE
# JB027   MOTHER EDUCATION- HIGHEST GRADE
# JB028   R HISPANIC/LATINO 
# JB033   NUMBER CHILDREN EVER
# JB034   NUMBER OF CHILDREN LIVING
# JB050   RELIGIOUS PREFERENCE
# JB082   HOW OFTEN ATTEND RELIGIOUS SERV
# JB053   IMPORTANCE OF RELIGION
# JB054   ENGLISH USUALLY SPOKEN IN HOME
# JB055   NEW MARRIAGE SINCE PREVIOUS WAVE
# JB056   BETWEEN WAVE MARRIAGE START-YEAR
#JA500    DATE OF INTERVIEW - MONTH




