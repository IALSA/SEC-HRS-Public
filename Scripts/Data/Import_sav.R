 # Importing raw RAND files version A.

library(foreign)
library(dplyr)
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
# Next three lines are run the first time on machine
 #ds0_1 <- read.spss(file = pathFile1, use.value.labels=TRUE)
 #ds0_1 <- data.frame(ds0_1)
 #saveRDS(object = ds0_1, file=pathFile1RDS, compress="xz")
ds04full <- readRDS(pathFile1RDS)




#names1 <- names(ds04full[1:3,])
#length(names1)
#write.csv(x=names1,file= file.path(pathFolder,"names1.csv"))

#Next three lines are run the first time on machine
#ds0_2 <- read.spss(file=pathFile2, use.value.labels=TRUE)
#ds0_2 <- data.frame(ds0_2)
#saveRDS(object = ds0_2, file=pathFile2RDS, compress="xz")
#ds06full <- readRDS(pathFile2RDS)

#Next three lines are run the first time on machine
#ds0_3 <- read.spss(file=pathFile3, use.value.labels=TRUE)
#ds0_3 <- data.frame(ds0_3)
#saveRDS(object = ds0_3, file=pathFile3RDS, compress="xz")
#ds08full <- readRDS(pathFile3RDS)

#Next three lines are run the first time on machine
ds0_4 <- read.spss(file=pathFile4, use.value.labels=TRUE)
ds0_4 <- data.frame(ds0_4)
saveRDS(object = ds0_4, file=pathFile4RDS, compress="xz")
ds10full <- readRDS(pathFile4RDS)

#Next three lines are run the first time on machine
ds0_5 <- read.spss(file=pathFile5, use.value.labels=TRUE)
ds0_5 <- data.frame(ds0_5)
saveRDS(object = ds0_5, file=pathFile5RDS, compress="xz")
ds12full <- readRDS(pathFile5RDS)

require(dplyr)

# THis is how to select with dplyr package
# ds <- ds01 %>%
#   dplyr::select(HHIDPN, DEGREE, GENDER, RACE, BIRTHMO, BIRTHYR)
# head(ds, 12)

# This is how to select with base package


# THis is how to rename with dplyr package
# Try to find names that are easy to type, but also that can be used in
# graphs for labels
ds04 <- ds04full %>%
  dplyr::select(  JPNCS=JPN_CS, JPNFAM=JPN_FAM, HHID, PN, HHIDPN, BIRTHMO, BIRTHYR,BIRTHYF, Gender=JX060_R, 
                  cohort=JZ023, age=JA019, NHM=JNHM, NURSHMT=JNURSHM, PROXY=JPROXY, IVIEWMO=JIVIEWMO, IVIEWYR=JIVIEWYR, hsplit04=JSUBHH, hsplit02=HSUBHH,
                  Spousenum=JPN_SP, CSR04=JCSR, FAMR=JFAMR, FINR=JFINR, yrsed=JB014A, 
                  degree=JB017M, Hispanic=JB028A, Race=JB031A, childEv=JB033, childliv=JB034, englishH=JB054, maritalstatus=JB063, newmarriage=JB055,
                  newmarrigmth=JB056, newmarrigyr=JB057, divwid=JB058, divwidmth=JB059,
                  divwidyr=JB060, nummarriages=JB065, marriage1yr=JB066_1, marriage1mth=JB067_1,
                  divwid1=JB068_1, marriage1lth = JB070_1, marriage2yr=JB066_2, marriage2mth=JB067_1, divwid2=JB068_2, 
                  marriage2lgth=JB070_2, marriage3yr=JB066_3, marriage3mth=JB067_3,
                  divwid3=JB068_3, marriage3lgth=JB070_4, marriage4yr=JB066_4, marriage4mth=JB067_4,
                  divwid4=JB068_4, marriage4lgth=JB070_4, religion=JB050, attendR=JB082, importanceR=JB053, assistdem=JB076,  
                  version=JVDATE, SAMESP/P=JA020, verifysp=JA022, SPalive=JA023, stplivtogethM=JA024, stplivtogethyr=JA025
                  livingW/P=JA027,newSPmth=JA036, newSPyr=JA037, newsp=JA045)
head(ds04, 12)

ds06 <- ds06full %>%
  dplyr::select(  HHIDPN, BIRTHMO, BIRTHYR, gender=KX060_R, yrsed=KBO14
                  cohort=KZ023, englishH=KB054, couplesplit=KSUBHH, Spousenum=KJN_SP, attend=KB082)
head(ds06, 12)

ds08 <- ds08full %>%
  dplyr::select(  HHIDPN, BIRTHMO, BIRTHYR, cohort=JZ023, married=JA026,
                  education=JB014, attend=JB082)
head(ds08, 12)

ds10 <- ds10full %>%
  dplyr::select( HHIDPN, BIRTHMO, BIRTHYR, cohort=JZ023, married=JA026,
                 kidsever=JB033, education=JB014, attend=JB082)
head(ds, 12)


dsTemp <- merge(x=ds04, y=ds06, by= c("HHIDPN","BIRTHMO","BIRTHYR", "gender"))
ds <- plyr::rename(dsTemp, replace=c("attend.x"="attend2004", "attend.y"="attend2006"))

#  old   -- new --   Description

#SECTION PR Preload Household
#JPN_CS -- JPNCS -- PERSON NUMBER OF COVER SCREEN RESPONDENT
#JPN_FAM -- JPNFAM -- 2004 FAMILY RESP PERSON NUMBER

#RESPONDENT DEMOGRAPHIC vARIABLES 2004 Section B
# HHID     HOUSEHOLD IDENTIFICATION NUMBER
# PN       RESPONDENT PERSON IDENTIFICATION NUMBER
# HHIDPN   HHIDPN     Household ID = Person Number: Numeric
# BIRTHMO  BIRTHMO    Birthdate: Month
# BIRTHYR  BIRTHYR    Birthdate: Year
# BIRTHYF  BIRTHYF    Flags cases with birth year 0=No difference, 1-Difference, used tracker 2=difference used other
# JX060_R  Gender     Gender
# JB014A   yrsed      YRSEDUC  HIGHEST LEVEL OF EDUCATION VARIABLE COMBINED FROM ALL WAVES
# JB017M   Degree     Highest degree
# JZ023    Cohort     Cohort
# JB028A   Hispanic   R Hispanic/Latino yes/no response
# JB031A   RACE       MASKED - COMBINED -- Race
# JB054--englishH--   ENGLISH USUALLY SPOKEN IN HOME
# JA019 -- Age--      R CURRENT AGE CALCULATION
# JA009 -- Proxy --   PROXY/SELF INTERVIEW
# JPN_SP --Spousenum--SPOUSE/PARTNER PERSON NUMBER
# JB055 --newmarriage--  NEW MARRIAGE SINCE PREVIOUS WAVE
# JB056 --newmarriagmth--  BETWEEN WAVE MARRIAGE START-Month
# JB057 --newmarriagyr--  BETWEEN WAVE MARRIAGE START-YEAR
# JB058 --divwid--  DIVORCE/WIDOW SINCE PREVIOUS WAVE
# JB059 --divwidmth -- BETWEEN WAVE DIVORCE/WIDOW-MONTH
# JB060 --divwidyr--  BETWEEN WAVE DIVORCE/WINDOW-YEAR
# JB065 --nummarriages--  NUMBER OF MARRIAGES
# JB066_1 --marriage1yr -- FIRST MARRIAGE YEAR BEGAN
# JB067_1 -- marriage1mth -- FIRST MARRIAGE MONTH BEGAN
# JB068_1 -- divwid1-- FIRST MARRIAGE END DIVORCE/WIDOW
# JB070_1 -- marriage1lgth -- FIRST MARRIAGE-YEARS MARRIAGE
# JB066_2 -- marriage2yr -- SECOND MARRIAGE YEAR BEGAN
# JB067_2 -- marriage2mth -- SECOND MARRIAGE MONTH BEGAN
# JB068_2 -- divwid2-- SECOND MARRIAGE END DIVORCE/WIDOW
# JB070_2 -- marriage2lgth -- SECOND MARRIAGE-YEARS MARRIAGE
# JB066_3 -- marriage3yr -- THIRD MARRIAGE YEAR BEGAN
# JB067_3 -- marriage2mth -- THIRD MARRIAGE MONTH BEGAN
# JB068_3 -- divwid3 -- THIRD MARRIAGE END DIVORCE/WIDOW
# JB070_3 -- marriage3lgth -- THIRD MARRIAGE-YEARS MARRIAGE
# JB066_4 -- marriage4yr -- MARRIAGE YEAR BEGAN -4
# JB067_4 -- marriage4mth -- MARRIAGE MONTH BEGAN -4
# JB068_4 -- divwid4 -- MARRIAGE END DIVORCE/WIDOW -4
# JB070_4 -- marriage4lgth -- MARRIAGE-YEARS MARRIED -4
# JB033 -- childev -- NUMBER CHILDREN EVER
# JB034 --childliv -- NUMBER OF CHILDREN LIVING
# JB050 -- religion-- RELIGIOUS PREFERENCE
# JB082 -- attend-- HOW OFTEN ATTEND RELIGIOUS SERV
# JB053 -- importanceR -- IMPORTANCE OF RELIGION
# JB045 -- LivArea -- Number of years living in area

# JIVIEWMO -- IvIEWMO -- Beginning of Interview: Month
# JIVIEWYR -- IVIEWYR -- Beginning of Interview: Year
# JNHM     -- NHM -- Respondent in nursing home derived from core data
# JNURSHM  -- NURSHMT -- Respondent in nursing home from Tracker
# JCOUPLE  -- coupleh -- Wave household - couple
# JPROXY  -- PROXY-- Proxy flag

#HOUSEHOLD INFORMATION SECTION A COVERSCREEN VARIABLES
# JA020 -- SAMESP/P -- 1ST R SAME SP/P
# JA022 -- VSPNOWPART -- VERIFY PREV WAVE SP IS NOW PARTNER
# JA023 -- SPALIVE -- PREVIOUS WAVE SP/P ALIVE
# JA024 -- MLIVEAP -- MO COUPLE STOP LIVING TOGETHER/DIE
# JA025 -- YLIVEAP -- YEAR COUPLE STOPPED LIVE TOGETHER/DIE
# JA027 -- LIVEW/P -- LIVING WITH PARTNER AS IF MARRIED
# JA030 -- LIVETOG -- COUPLE LIVE TOGETHER
# JA031 -- STOPLIVTM -- MO R AND SP/P STOP LIVING IN SAME HH
# JA032 -- STOPLIVTY-- YR R AND SP/P STOP LIVING IN SAME HH
# JA033 --SPNURSHOM-- SP/P IN NURSHOME
# JA034 --  MARRIED OR SEPARATED
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