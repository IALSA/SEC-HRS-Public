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
#RESPONDENT DEMOGRAPHIC vARIABLES
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
# JB057   BETWEEN WAVE MARRIAGE START-YEAR
# JB058   DIVORCE/WIDOW SINCE PREVIOUS WAVE
# JB059   BETWEEN WAVE DIVORCE/WIDOW-MONTH
# JB060   BETWEEN WAVE DIVORCE/WINDOW-YEAR
# JB061   MARITAL STATUS IF UNMARRIED
# JB065   NUMBER OF MARRIAGES
# JB066_1 FIRST MARRIAGE YEAR BEGAN
# JB067_1 FIRST MARRIAGE MONTH BEGAN
#JB068_1 FIRST MARRIAGE END DIVORCE/WIDOW
# JB070_1 FIRST MARRIAGE-YEARS MARRIAGE
# JB066_2 SECOND MARRIAGE YEAR BEGAN
# JB067_2 SECOND MARRIAGE MONTH BEGAN
# JB068_2 SECOND MARRIAGE END DIVORCE/WIDOW
# JB070_2 SECOND MARRIAGE-YEARS MARRIAGE
# JB066_3 THIRD MARRIAGE YEAR BEGAN
# JB067_3 THIRD MARRIAGE MONTH BEGAN
# JB068_3 THIRD MARRIAGE END DIVORCE/WIDOW
# JB070_3 THIRD MARRIAGE-YEARS MARRIAGE
# JB066_4 MARRIAGE YEAR BEGAN -4
# JB067_4 MARRIAGE MONTH BEGAN -4
# JB068_4 MARRIAGE END DIVORCE/WIDOW -4
# JB070_4 MARRIAGE-YEARS MARRIED -4
# JB063 MARITAL STATUS ASSIGNED
# JA500    DATE OF INTERVIEW - MONTH
#HOUSEHOLD INFORMATION SECTION A COVERSCREEN VARIABLES
#JA022 VERIFY PREV WAVE SP IS NOW PARTNER
# JA023 PREVIOUS WAVE SP/P ALIVE
# JA024 MO COUPLE STOP LIVING TOGETHER/DIE
# JA025 YEAR COUPLE STOPPED LIVE TOGETHER/DIE
# JA026 R MARRIED
# JA027 LIVING W/P
# JA030 COUPLE LIVE TOGETHER
# JA031 MO R AND SP/P STOP LIVING IN SAME HH
# JA032 YR R AND SP/P STOP LIVING IN SAME HH
# JA033 SP/P IN NURSHOME
# JA034 MARRIED OR SEPARATED
# JA035 SEPARATED/PARTNERED
# JA036 MO STARTED LIVING WITH NEW SP/P
# JA037 YEAR STARTED LIVING WITH NEW SP/P
# JA045 R HAS NEW SPOUSE OR PARTNER
# JA044 SP/P CURRENT AGE CALCULATION
# JA050 NEW COHORT-CHOOSE FIN R
# JA055 FAM/FIN THIS WAVE
# JA056 SP/P FAMILY/FINANCIAL TYPE - CHANGED
# JA070 NH: STILL OWN/RENT HOME
# JA071 SAME RESID AS PREV WAVE #1
# JA072 SAME CITY/ST RESID # 1
# JA073 SAME RESID AS PREV WAVE #2
# JA074 SAME CITY/ST RESID #2
# JA076M CURRENT RESIDENCE STATE - MASKED
# JA078 NEW COHORT- YEARS IN CURRENT CITY/STATE
# JA079 OTHER HOMES/APTS
# JA081M OTHER RESIDENCE STATE - MASKED
# JA083 NEW COHORT - YEARS AT SECOND CITY/STATE
# JA084 ASSIGN 1 OR 2 RESIDENCES
# JA085 MAIN RESIDENCE
# JA098 COUNT OF HHM
# JA099 NUMBER OF RESIDENT CHILDREN
# JA100 COUNT OF NONRESIDENT KIDS
# JA101 COUNT OF KIDS - NOT THEIR SPOUSES
# JA102 COUNT OF MOVE IN/OUT
# JA106 COUNT OF CONTACT KIDS
# JA113 COUNT OF CHILD CHILDLAW AND GRANDCHILD



