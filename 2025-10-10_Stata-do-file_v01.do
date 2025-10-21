* SYNTAX for "Dynamic associations between intrinsic capacity and disability before death among older adults"

* STATA version: StataNow 19.5, MP-Parallel Edition

* STATA citation: StataCorp. 2025. Stata Statistical Software: Release 19. College Station, TX: StataCorp LLC. 

* Data access statement: Requests for access to data from the Precipitating Events Project for meritorious analyses from qualified investigators should be directed to Thomas M. Gill (thomas.gill@yale.edu). Processing and analytic code (Stata, Mplus, R, and SAS) are available in the GitHub repository at https://github.com/OliviaMalkowski/TVEM-intrinsic-capacity.git.

* Import master dataset
import sas using "P:\projects\PEP\Master\f2f_master_analysisvar306.sas7bdat"
* Count total number of participants and observations
unique StudyID
* 754 individuals, 5215 observations
* Assigns a number in ascending order to each row of observations
gen ascnr = _n
* Generate a variable that assigns the observation number (i.e., 1 for first data collection timepoint, 2 for second data collection timepoint) to each row by participant ID
bysort StudyID(intdateF2F): gen obsnr = _n
* Generate a variable that assigns the number of total observations to each row of data for a given participant
bysort StudyID: gen obscount = _N
* Check outcome code for comprehensive assessments that were refused
tab fout_fu if respondent==.
* Drop comprehensive assessments that were refused
drop if respondent==.
* Count total number of participants and observations
unique StudyID
* 754 individuals, 5168 observations
* Rename variables
rename ds1 ds1_m
rename ds11 ds11_m
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save master dataset with a new name
save master.dta
clear 

* Import baseline data
import sas using "P:\projects\PEP\Master\baseface.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep STUDYID fc1_wtlsbl fc2_exhsbl fc3_walkbl fc4_gripbl MEAN_peakfl_bl STD_peakfl_bl CV_peakfl_bl MED_peakfl_bl PEFR1 PEFR2 PEFR3 n_readings_bl pefr_max_bl balancebl chairscorebl time_chairbl WALK1 WALK9 visimpbl chair_t ppm4a_s mmsebl mbl_cf cogfbl cfcatbl mmsephbl mmrefbl mmph_ms dep11bl depbl simcesd depresbl gsavgbl gshibl gsavg2bl gripkg1 gripkg2 gripkg3 vis3cat_bl hearimp_bl hear3cat_bl
* Generate a new variable called interval and assign the number 1 to each observation
gen interval = 1
* Rename variables to ensure consistency across intervals
rename fc1_wtlsbl fc1_wtlsraw
rename fc2_exhsbl fc2_exhsraw
rename fc3_walkbl fc3_walkraw
rename fc4_gripbl fc4_gripraw
rename MEAN_peakfl_bl MEAN_peakfl_raw
rename STD_peakfl_bl STD_peakfl_raw
rename CV_peakfl_bl CV_peakfl_raw
rename MED_peakfl_bl MED_peakfl_raw
rename PEFR1 pefr1raw
rename PEFR2 pefr2raw
rename PEFR3 pefr3raw
rename n_readings_bl n_readings_raw
rename pefr_max_bl pefr_max_raw
rename balancebl balanceraw
rename chairscorebl chairscoreraw
rename time_chairbl time_chairraw
rename WALK1 walk1raw
rename WALK9 walk9raw
rename visimpbl visimpraw
rename chair_t chair_traw
rename ppm4a_s ppm4a_sraw
rename mmsebl mmseraw
rename mbl_cf mraw_cf
rename cogfbl cogfraw
rename cfcatbl cfcatraw
rename mmsephbl mmsephraw
rename mmrefbl mmrefraw
rename mmph_ms mmph_msraw
rename dep11bl dep11raw
rename depbl depraw
rename simcesd simcesdraw
rename depresbl depresraw
rename gsavgbl gsavgraw
rename gshibl gshiraw
rename gsavg2bl gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_bl vis3cat_raw
rename hearimp_bl hearimp_raw
rename hear3cat_bl hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save baseline dataset with a new name
save baseline.dta
clear

* Import 18-month follow-up data
import sas using "P:\projects\PEP\Master\fu18face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep STUDYID fc1_wtls18 fc2_exhs18 fc3_walk18 fc4_grip18 MEAN_peakfl_18 STD_peakfl_18 CV_peakfl_18 MED_peakfl_18 pefr1 pefr2 pefr3 n_readings_18 pefr_max_18 balance18 chairscore18 time_chair18 walk1 walk9 visimp18 chair_t ppm7a_s mmse_18 m18_cf cogf18 cfcat18 mmseph18 mmref18 mmph_ms dep11_18 dep18 simcesd depres18 gsavg18 gshi18 gsavg218 gripkg1 gripkg2 gripkg3 vis3cat_18 hearimp_18 hear3cat_18
* Generate a new variable called interval and assign the number 2 to each observation
gen interval = 2
* Rename variables to ensure consistency across intervals
rename fc1_wtls18 fc1_wtlsraw
rename fc2_exhs18 fc2_exhsraw
rename fc3_walk18 fc3_walkraw
rename fc4_grip18 fc4_gripraw
rename MEAN_peakfl_18 MEAN_peakfl_raw
rename STD_peakfl_18 STD_peakfl_raw
rename CV_peakfl_18 CV_peakfl_raw
rename MED_peakfl_18 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_18 n_readings_raw
rename pefr_max_18 pefr_max_raw
rename balance18 balanceraw
rename chairscore18 chairscoreraw
rename time_chair18 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp18 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_18 mmseraw
rename m18_cf mraw_cf
rename cogf18 cogfraw
rename cfcat18 cfcatraw
rename mmseph18 mmsephraw
rename mmref18 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_18 dep11raw
rename dep18 depraw
rename simcesd simcesdraw
rename depres18 depresraw
rename gsavg18 gsavgraw
rename gshi18 gshiraw
rename gsavg218 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_18 vis3cat_raw
rename hearimp_18 hearimp_raw
rename hear3cat_18 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 18-month follow-up dataset with a new name
save 18month.dta
clear

* Import 36-month follow-up data
import sas using "P:\projects\PEP\Master\fu36face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID fc1_wtls36 fc2_exhs36 fc3_walk36 fc4_grip36 MEAN_peakfl_36 STD_peakfl_36 CV_peakfl_36 MED_peakfl_36 pefr1 pefr2 pefr3 n_readings_36 pefr_max_36 balance36 chairscore36 time_chair36 walk1 walk9 visimp36 chair_t ppm7a_s mmse_36 m36_cf cogf36 cfcat36 mmseph36 mmref36 mmph_ms dep11_36 dep36 simcesd depres36 gsavg36 gshi36 gsavg236 gripkg1 gripkg2 gripkg3 vis3cat_36 hearimp_36 hear3cat_36
* Generate a new variable called interval and assign the number 3 to each observation
gen interval = 3
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename fc1_wtls36 fc1_wtlsraw
rename fc2_exhs36 fc2_exhsraw
rename fc3_walk36 fc3_walkraw
rename fc4_grip36 fc4_gripraw
rename MEAN_peakfl_36 MEAN_peakfl_raw
rename STD_peakfl_36 STD_peakfl_raw
rename CV_peakfl_36 CV_peakfl_raw
rename MED_peakfl_36 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_36 n_readings_raw
rename pefr_max_36 pefr_max_raw
rename balance36 balanceraw
rename chairscore36 chairscoreraw
rename time_chair36 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp36 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_36 mmseraw
rename m36_cf mraw_cf
rename cogf36 cogfraw
rename cfcat36 cfcatraw
rename mmseph36 mmsephraw
rename mmref36 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_36 dep11raw
rename dep36 depraw
rename simcesd simcesdraw
rename depres36 depresraw
rename gsavg36 gsavgraw
rename gshi36 gshiraw
rename gsavg236 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_36 vis3cat_raw
rename hearimp_36 hearimp_raw
rename hear3cat_36 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 36-month follow-up dataset with a new name
save 36month.dta
clear

* Import 54-month follow-up data
import sas using "P:\projects\PEP\Master\fu54face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID fc1_wtls54 fc2_exhs54 fc3_walk54 fc4_grip54 MEAN_peakfl_54 STD_peakfl_54 CV_peakfl_54 MED_peakfl_54 pefr1 pefr2 pefr3 n_readings_54 pefr_max_54 balance54 chairscore54 time_chair54 walk1 walk9 visimp54 chair_t ppm7a_s mmse_54 m54_cf cogf54 cfcat54 mmseph54 mmref54 mmph_ms dep11_54 dep54 simcesd depres54 gsavg54 gshi54 gsavg254 gripkg1 gripkg2 gripkg3 vis3cat_54 hearimp_54 hear3cat_54
* Generate a new variable called interval and assign the number 4 to each observation
gen interval = 4
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename fc1_wtls54 fc1_wtlsraw
rename fc2_exhs54 fc2_exhsraw
rename fc3_walk54 fc3_walkraw
rename fc4_grip54 fc4_gripraw
rename MEAN_peakfl_54 MEAN_peakfl_raw
rename STD_peakfl_54 STD_peakfl_raw
rename CV_peakfl_54 CV_peakfl_raw
rename MED_peakfl_54 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_54 n_readings_raw
rename pefr_max_54 pefr_max_raw
rename balance54 balanceraw
rename chairscore54 chairscoreraw
rename time_chair54 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp54 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_54 mmseraw
rename m54_cf mraw_cf
rename cogf54 cogfraw
rename cfcat54 cfcatraw
rename mmseph54 mmsephraw
rename mmref54 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_54 dep11raw
rename dep54 depraw
rename simcesd simcesdraw
rename depres54 depresraw
rename gsavg54 gsavgraw
rename gshi54 gshiraw
rename gsavg254 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_54 vis3cat_raw
rename hearimp_54 hearimp_raw
rename hear3cat_54 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 54-month follow-up dataset with a new name
save 54month.dta
clear

* Import 72-month follow-up data
import sas using "P:\projects\PEP\Master\fu72face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls72 fc2_exhs72 fc3_walk72 fc4_grip72 MEAN_peakfl_72 STD_peakfl_72 CV_peakfl_72 MED_peakfl_72 pefr1 pefr2 pefr3 n_readings_72 pefr_max_72 balance72 chairscore72 time_chair72 walk1 walk9 visimp72 chair_t ppm7a_s mmse_72 m72_cf cogf72 cfcat72 mmseph72 mmref72 mmph_ms dep11_72 dep72 simcesd depres72 gsavg72 gshi72 gsavg272 gripkg1 gripkg2 gripkg3 vis3cat_72 hearimp_72 hear3cat_72
* Generate a new variable called interval and assign the number 5 to each observation
gen interval = 5
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls72 fc1_wtlsraw
rename fc2_exhs72 fc2_exhsraw
rename fc3_walk72 fc3_walkraw
rename fc4_grip72 fc4_gripraw
rename MEAN_peakfl_72 MEAN_peakfl_raw
rename STD_peakfl_72 STD_peakfl_raw
rename CV_peakfl_72 CV_peakfl_raw
rename MED_peakfl_72 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_72 n_readings_raw
rename pefr_max_72 pefr_max_raw
rename balance72 balanceraw
rename chairscore72 chairscoreraw
rename time_chair72 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp72 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_72 mmseraw
rename m72_cf mraw_cf
rename cogf72 cogfraw
rename cfcat72 cfcatraw
rename mmseph72 mmsephraw
rename mmref72 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_72 dep11raw
rename dep72 depraw
rename simcesd simcesdraw
rename depres72 depresraw
rename gsavg72 gsavgraw
rename gshi72 gshiraw
rename gsavg272 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_72 vis3cat_raw
rename hearimp_72 hearimp_raw
rename hear3cat_72 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 72-month follow-up dataset with a new name
save 72month.dta
clear

* Import 90-month follow-up data
import sas using "P:\projects\PEP\Master\fu90face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls90 fc2_exhs90 fc3_walk90 fc4_grip90 MEAN_peakfl_90 STD_peakfl_90 CV_peakfl_90 MED_peakfl_90 pefr1 pefr2 pefr3 n_readings_90 pefr_max_90 balance90 chairscore90 time_chair90 walk1 walk9 visimp90 chair_t ppm7a_s mmse_90 m90_cf cogf90 cfcat90 mmseph90 mmref90 mmph_ms dep11_90 dep90 simcesd depres90 gsavg90 gshi90 gsavg290 gripkg1 gripkg2 gripkg3 vis3cat_90 hearimp_90 hear3cat_90
* Generate a new variable called interval and assign the number 6 to each observation
gen interval = 6
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls90 fc1_wtlsraw
rename fc2_exhs90 fc2_exhsraw
rename fc3_walk90 fc3_walkraw
rename fc4_grip90 fc4_gripraw
rename MEAN_peakfl_90 MEAN_peakfl_raw
rename STD_peakfl_90 STD_peakfl_raw
rename CV_peakfl_90 CV_peakfl_raw
rename MED_peakfl_90 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_90 n_readings_raw
rename pefr_max_90 pefr_max_raw
rename balance90 balanceraw
rename chairscore90 chairscoreraw
rename time_chair90 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp90 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_90 mmseraw
rename m90_cf mraw_cf
rename cogf90 cogfraw
rename cfcat90 cfcatraw
rename mmseph90 mmsephraw
rename mmref90 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_90 dep11raw
rename dep90 depraw
rename simcesd simcesdraw
rename depres90 depresraw
rename gsavg90 gsavgraw
rename gshi90 gshiraw
rename gsavg290 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_90 vis3cat_raw
rename hearimp_90 hearimp_raw
rename hear3cat_90 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 90-month follow-up dataset with a new name
save 90month.dta
clear

* Import 108-month follow-up data
import sas using "P:\projects\PEP\Master\fu108face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls108 fc2_exhs108 fc3_walk108 fc4_grip108 MEAN_peakfl_108 STD_peakfl_108 CV_peakfl_108 MED_peakfl_108 pefr1 pefr2 pefr3 n_readings_108 pefr_max_108 balance108 chairscore108 time_chair108 walk1 walk9 visimp108 ppm7a_s mmse_108 m108_cf cogf108 cfcat108 mmseph108 mmref108 mmph_ms dep11_108 dep108 simcesd depres108 gsavg108 gshi108 gsavg2108 gripkg1 gripkg2 gripkg3 vis3cat_108 hearimp_108 hear3cat_108
* Generate a new variable called interval and assign the number 7 to each observation
gen interval = 7
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls108 fc1_wtlsraw
rename fc2_exhs108 fc2_exhsraw
rename fc3_walk108 fc3_walkraw
rename fc4_grip108 fc4_gripraw
rename MEAN_peakfl_108 MEAN_peakfl_raw
rename STD_peakfl_108 STD_peakfl_raw
rename CV_peakfl_108 CV_peakfl_raw
rename MED_peakfl_108 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_108 n_readings_raw
rename pefr_max_108 pefr_max_raw
rename balance108 balanceraw
rename chairscore108 chairscoreraw
rename time_chair108 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp108 visimpraw
rename ppm7a_s ppm4a_sraw
rename mmse_108 mmseraw
rename m108_cf mraw_cf
rename cogf108 cogfraw
rename cfcat108 cfcatraw
rename mmseph108 mmsephraw
rename mmref108 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_108 dep11raw
rename dep108 depraw
rename simcesd simcesdraw
rename depres108 depresraw
rename gsavg108 gsavgraw
rename gshi108 gshiraw
rename gsavg2108 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_108 vis3cat_raw
rename hearimp_108 hearimp_raw
rename hear3cat_108 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 108-month follow-up dataset with a new name
save 108month_v2.dta
clear

* Import 144-month follow-up data
import sas using "P:\projects\PEP\Master\fu144face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls144 fc2_exhs144 fc3_walk144 fc4_grip144 MEAN_peakfl_144 STD_peakfl_144 CV_peakfl_144 MED_peakfl_144 pefr1 pefr2 pefr3 n_readings_144 pefr_max_144 balance144 chairscore144 time_chair144 walk1 walk9 visimp144 chair_t ppm7a_s mmse_144 m144_cf cogf144 cfcat144 mmseph144 mmref144 mmph_ms dep11_144 dep144 simcesd depres144 gsavg144 gshi144 gsavg2144 gripkg1 gripkg2 gripkg3 vis3cat_144 hearimp_144 hear3cat_144
* Generate a new variable called interval and assign the number 9 to each observation
gen interval = 9
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls144 fc1_wtlsraw
rename fc2_exhs144 fc2_exhsraw
rename fc3_walk144 fc3_walkraw
rename fc4_grip144 fc4_gripraw
rename MEAN_peakfl_144 MEAN_peakfl_raw
rename STD_peakfl_144 STD_peakfl_raw
rename CV_peakfl_144 CV_peakfl_raw
rename MED_peakfl_144 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_144 n_readings_raw
rename pefr_max_144 pefr_max_raw
rename balance144 balanceraw
rename chairscore144 chairscoreraw
rename time_chair144 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp144 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_144 mmseraw
rename m144_cf mraw_cf
rename cogf144 cogfraw
rename cfcat144 cfcatraw
rename mmseph144 mmsephraw
rename mmref144 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_144 dep11raw
rename dep144 depraw
rename simcesd simcesdraw
rename depres144 depresraw
rename gsavg144 gsavgraw
rename gshi144 gshiraw
rename gsavg2144 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_144 vis3cat_raw
rename hearimp_144 hearimp_raw
rename hear3cat_144 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 144-month follow-up dataset with a new name
save 144month.dta
clear

* Import 162-month follow-up data
import sas using "P:\projects\PEP\Master\fu162face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls162 fc2_exhs162 fc3_walk162 fc4_grip162 MEAN_peakfl_162 STD_peakfl_162 CV_peakfl_162 MED_peakfl_162 pefr1 pefr2 pefr3 n_readings_162 pefr_max_162 balance162 chairscore162 time_chair162 walk1 walk9 visimp162 chair_t ppm7a_s mmse_162 m162_cf cogf162 cfcat162 mmseph162 mmref162 mmph_ms dep11_162 dep162 simcesd depres162 gsavg162 gshi162 gsavg2162 gripkg1 gripkg2 gripkg3 vis3cat_162 hearimp_162 hear3cat_162
* Generate a new variable called interval and assign the number 10 to each observation
gen interval = 10
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls162 fc1_wtlsraw
rename fc2_exhs162 fc2_exhsraw
rename fc3_walk162 fc3_walkraw
rename fc4_grip162 fc4_gripraw
rename MEAN_peakfl_162 MEAN_peakfl_raw
rename STD_peakfl_162 STD_peakfl_raw
rename CV_peakfl_162 CV_peakfl_raw
rename MED_peakfl_162 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_162 n_readings_raw
rename pefr_max_162 pefr_max_raw
rename balance162 balanceraw
rename chairscore162 chairscoreraw
rename time_chair162 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp162 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_162 mmseraw
rename m162_cf mraw_cf
rename cogf162 cogfraw
rename cfcat162 cfcatraw
rename mmseph162 mmsephraw
rename mmref162 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_162 dep11raw
rename dep162 depraw
rename simcesd simcesdraw
rename depres162 depresraw
rename gsavg162 gsavgraw
rename gshi162 gshiraw
rename gsavg2162 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_162 vis3cat_raw
rename hearimp_162 hearimp_raw
rename hear3cat_162 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 162-month follow-up dataset with a new name
save 162month.dta
clear

* Import 180-month follow-up data
import sas using "P:\projects\PEP\Master\fu180face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls180 fc2_exhs180 fc3_walk180 fc4_grip180 MEAN_peakfl_180 STD_peakfl_180 CV_peakfl_180 MED_peakfl_180 pefr1 pefr2 pefr3 n_readings_180 pefr_max_180 balance180 chairscore180 time_chair180 walk1 walk9 visimp180 chair_t ppm7a_s mmse_180 m180_cf cogf180 cfcat180 mmseph180 mmref180 mmph_ms dep11_180 dep180 simcesd depres180 gsavg180 gshi180 gsavg2180 gripkg1 gripkg2 gripkg3 vis3cat_180 hearimp_180 hear3cat_180
* Generate a new variable called interval and assign the number 11 to each observation
gen interval = 11
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls180 fc1_wtlsraw
rename fc2_exhs180 fc2_exhsraw
rename fc3_walk180 fc3_walkraw
rename fc4_grip180 fc4_gripraw
rename MEAN_peakfl_180 MEAN_peakfl_raw
rename STD_peakfl_180 STD_peakfl_raw
rename CV_peakfl_180 CV_peakfl_raw
rename MED_peakfl_180 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_180 n_readings_raw
rename pefr_max_180 pefr_max_raw
rename balance180 balanceraw
rename chairscore180 chairscoreraw
rename time_chair180 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp180 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_180 mmseraw
rename m180_cf mraw_cf
rename cogf180 cogfraw
rename cfcat180 cfcatraw
rename mmseph180 mmsephraw
rename mmref180 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_180 dep11raw
rename dep180 depraw
rename simcesd simcesdraw
rename depres180 depresraw
rename gsavg180 gsavgraw
rename gshi180 gshiraw
rename gsavg2180 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_180 vis3cat_raw
rename hearimp_180 hearimp_raw
rename hear3cat_180 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 180-month follow-up dataset with a new name
save 180month.dta
clear

* Import 198-month follow-up data
import sas using "P:\projects\PEP\Master\fu198face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls198 fc2_exhs198 fc3_walk198 fc4_grip198 MEAN_peakfl_198 STD_peakfl_198 CV_peakfl_198 MED_peakfl_198 pefr1 pefr2 pefr3 n_readings_198 pefr_max_198 balance198 chairscore198 time_chair198 walk1 walk9 visimp198 chair_t ppm7a_s mmse_198 m198_cf cogf198 cfcat198 mmseph198 mmref198 mmph_ms dep11_198 dep198 simcesd depres198 gsavg198 gshi198 gsavg2198 gripkg1 gripkg2 gripkg3 vis3cat_198 hearimp_198 hear3cat_198
* Generate a new variable called interval and assign the number 12 to each observation
gen interval = 12
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls198 fc1_wtlsraw
rename fc2_exhs198 fc2_exhsraw
rename fc3_walk198 fc3_walkraw
rename fc4_grip198 fc4_gripraw
rename MEAN_peakfl_198 MEAN_peakfl_raw
rename STD_peakfl_198 STD_peakfl_raw
rename CV_peakfl_198 CV_peakfl_raw
rename MED_peakfl_198 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_198 n_readings_raw
rename pefr_max_198 pefr_max_raw
rename balance198 balanceraw
rename chairscore198 chairscoreraw
rename time_chair198 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp198 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_198 mmseraw
rename m198_cf mraw_cf
rename cogf198 cogfraw
rename cfcat198 cfcatraw
rename mmseph198 mmsephraw
rename mmref198 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_198 dep11raw
rename dep198 depraw
rename simcesd simcesdraw
rename depres198 depresraw
rename gsavg198 gsavgraw
rename gshi198 gshiraw
rename gsavg2198 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_198 vis3cat_raw
rename hearimp_198 hearimp_raw
rename hear3cat_198 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 198-month follow-up dataset with a new name
save 198month.dta
clear

* Import 216-month follow-up data
import sas using "P:\projects\PEP\Master\fu216face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls216 fc2_exhs216 fc3_walk216 fc4_grip216 MEAN_peakfl_216 MED_peakfl_216 pefr1 pefr2 pefr3 n_readings_216 pefr_max_216 balance216 chairscore216 time_chair216 walk1 walk9 visimp216 chair_t ppm7a_s mmse_216 m216_cf cogf216 cfcat216 mmseph216 mmref216 mmph_ms dep11_216 dep216 simcesd depres216 gsavg216 gshi216 gsavg2216 gripkg1 gripkg2 gripkg3 vis3cat_216 hearimp_216 hear3cat_216
* Generate a new variable called interval and assign the number 13 to each observation
gen interval = 13
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls216 fc1_wtlsraw
rename fc2_exhs216 fc2_exhsraw
rename fc3_walk216 fc3_walkraw
rename fc4_grip216 fc4_gripraw
rename MEAN_peakfl_216 MEAN_peakfl_raw
rename MED_peakfl_216 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_216 n_readings_raw
rename pefr_max_216 pefr_max_raw
rename balance216 balanceraw
rename chairscore216 chairscoreraw
rename time_chair216 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp216 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_216 mmseraw
rename m216_cf mraw_cf
rename cogf216 cogfraw
rename cfcat216 cfcatraw
rename mmseph216 mmsephraw
rename mmref216 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_216 dep11raw
rename dep216 depraw
rename simcesd simcesdraw
rename depres216 depresraw
rename gsavg216 gsavgraw
rename gshi216 gshiraw
rename gsavg2216 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_216 vis3cat_raw
rename hearimp_216 hearimp_raw
rename hear3cat_216 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 216-month follow-up dataset with a new name
save 216month.dta
clear

* Import 234-month follow-up data
import sas using "P:\projects\PEP\Master\fu234face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls234 fc2_exhs234 fc3_walk234 fc4_grip234 MEAN_peakfl_234 MED_peakfl_234 pefr1 pefr2 pefr3 n_readings_234 pefr_max_234 balance234 chairscore234 time_chair234 walk1 walk9 visimp234 chair_t ppm7a_s mmse_234 m234_cf cogf234 cfcat234 mmseph234 mmref234 mmph_ms dep11_234 dep234 simcesd depres234 gsavg234 gshi234 gsavg2234 gripkg1 gripkg2 gripkg3 vis3cat_234 hearimp_234 hear3cat_234
* Generate a new variable called interval and assign the number 14 to each observation
gen interval = 14
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls234 fc1_wtlsraw
rename fc2_exhs234 fc2_exhsraw
rename fc3_walk234 fc3_walkraw
rename fc4_grip234 fc4_gripraw
rename MEAN_peakfl_234 MEAN_peakfl_raw
rename MED_peakfl_234 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_234 n_readings_raw
rename pefr_max_234 pefr_max_raw
rename balance234 balanceraw
rename chairscore234 chairscoreraw
rename time_chair234 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp234 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_234 mmseraw
rename m234_cf mraw_cf
rename cogf234 cogfraw
rename cfcat234 cfcatraw
rename mmseph234 mmsephraw
rename mmref234 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_234 dep11raw
rename dep234 depraw
rename simcesd simcesdraw
rename depres234 depresraw
rename gsavg234 gsavgraw
rename gshi234 gshiraw
rename gsavg2234 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_234 vis3cat_raw
rename hearimp_234 hearimp_raw
rename hear3cat_234 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 234-month follow-up dataset with a new name
save 234month.dta
clear

* Import 252-month follow-up data
import sas using "P:\projects\PEP\Master\fu252face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls252 fc2_exhs252 fc3_walk252 fc4_grip252 MEAN_peakfl_252 MED_peakfl_252 pefr1 pefr2 pefr3 n_readings_252 pefr_max_252 balance252 chairscore252 time_chair252 walk1 walk9 visimp252 chair_t ppm7a_s mmse_252 m252_cf cogf252 cfcat252 mmseph252 mmref252 mmph_ms dep11_252 dep252 simcesd depres252 gsavg252 gshi252 gsavg2252 gripkg1 gripkg2 gripkg3 vis3cat_252 hearimp_252 hear3cat_252
* Generate a new variable called interval and assign the number 15 to each observation
gen interval = 15
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls252 fc1_wtlsraw
rename fc2_exhs252 fc2_exhsraw
rename fc3_walk252 fc3_walkraw
rename fc4_grip252 fc4_gripraw
rename MEAN_peakfl_252 MEAN_peakfl_raw
rename MED_peakfl_252 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_252 n_readings_raw
rename pefr_max_252 pefr_max_raw
rename balance252 balanceraw
rename chairscore252 chairscoreraw
rename time_chair252 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp252 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_252 mmseraw
rename m252_cf mraw_cf
rename cogf252 cogfraw
rename cfcat252 cfcatraw
rename mmseph252 mmsephraw
rename mmref252 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_252 dep11raw
rename dep252 depraw
rename simcesd simcesdraw
rename depres252 depresraw
rename gsavg252 gsavgraw
rename gshi252 gshiraw
rename gsavg2252 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_252 vis3cat_raw
rename hearimp_252 hearimp_raw
rename hear3cat_252 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 252-month follow-up dataset with a new name
save 252month.dta
clear

* Import 270-month follow-up data
import sas using "P:\projects\PEP\Master\fu270face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls270 fc2_exhs270 fc3_walk270 fc4_grip270 pefr1 pefr2 pefr3 n_readings_270 pefr_max_270 balance270 chairscore270 time_chair270 walk1 walk9 visimp270 chair_t ppm7a_s mmse_270 m270_cf cogf270 cfcat270 mmseph270 mmref270 mmph_ms dep11_270 dep270 simcesd depres270 gsavg270 gshi270 gsavg2270 gripkg1 gripkg2 gripkg3 vis3cat_270 hearimp_270 hear3cat_270
* Generate a new variable called interval and assign the number 16 to each observation
gen interval = 16
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls270 fc1_wtlsraw
rename fc2_exhs270 fc2_exhsraw
rename fc3_walk270 fc3_walkraw
rename fc4_grip270 fc4_gripraw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_270 n_readings_raw
rename pefr_max_270 pefr_max_raw
rename balance270 balanceraw
rename chairscore270 chairscoreraw
rename time_chair270 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp270 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_270 mmseraw
rename m270_cf mraw_cf
rename cogf270 cogfraw
rename cfcat270 cfcatraw
rename mmseph270 mmsephraw
rename mmref270 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_270 dep11raw
rename dep270 depraw
rename simcesd simcesdraw
rename depres270 depresraw
rename gsavg270 gsavgraw
rename gshi270 gshiraw
rename gsavg2270 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_270 vis3cat_raw
rename hearimp_270 hearimp_raw
rename hear3cat_270 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 270-month follow-up dataset with a new name
save 270month.dta
clear

* Import 288-month follow-up data
import sas using "P:\projects\PEP\Master\fu288face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls288 fc2_exhs288 fc3_walk288 fc4_grip288 pefr1 pefr2 pefr3 n_readings_288 pefr_max_288 balance288 chairscore288 time_chair288 walk1 walk9 visimp288 chair_t ppm7a_s mmse_288 m288_cf cogf288 cfcat288 mmseph288 mmref288 mmph_ms dep11_288 dep288 simcesd depres288 gsavg288 gshi288 gsavg2288 gripkg1 gripkg2 gripkg3 vis3cat_288 hearimp_288 hear3cat_288
* Generate a new variable called interval and assign the number 17 to each observation
gen interval = 17
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls288 fc1_wtlsraw
rename fc2_exhs288 fc2_exhsraw
rename fc3_walk288 fc3_walkraw
rename fc4_grip288 fc4_gripraw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_288 n_readings_raw
rename pefr_max_288 pefr_max_raw
rename balance288 balanceraw
rename chairscore288 chairscoreraw
rename time_chair288 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp288 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_288 mmseraw
rename m288_cf mraw_cf
rename cogf288 cogfraw
rename cfcat288 cfcatraw
rename mmseph288 mmsephraw
rename mmref288 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_288 dep11raw
rename dep288 depraw
rename simcesd simcesdraw
rename depres288 depresraw
rename gsavg288 gsavgraw
rename gshi288 gshiraw
rename gsavg2288 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_288 vis3cat_raw
rename hearimp_288 hearimp_raw
rename hear3cat_288 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 288-month follow-up dataset with a new name
save 288month.dta
clear

* Import 306-month follow-up data
import sas using "P:\projects\PEP\Master\fu306face.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyID fc1_wtls306 fc2_exhs306 fc3_walk306 fc4_grip306 MEAN_peakfl_306 STD_peakfl_306 CV_peakfl_306 MED_peakfl_306 pefr1 pefr2 pefr3 n_readings_306 pefr_max_306 balance306 chairscore306 time_chair306 walk1 walk9 visimp306 chair_t ppm7a_s mmse_306 m306_cf cogf306 cfcat306 mmseph306 mmref306 mmph_ms dep11_306 dep306 simcesd depres306 gsavg306 gshi306 gsavg2306 gripkg1 gripkg2 gripkg3 vis3cat_306 hearimp_306 hear3cat_306
* Generate a new variable called interval and assign the number 18 to each observation
gen interval = 18
* Rename variables to ensure consistency across intervals
rename studyID STUDYID
rename fc1_wtls306 fc1_wtlsraw
rename fc2_exhs306 fc2_exhsraw
rename fc3_walk306 fc3_walkraw
rename fc4_grip306 fc4_gripraw
rename MEAN_peakfl_306 MEAN_peakfl_raw
rename STD_peakfl_306 STD_peakfl_raw
rename CV_peakfl_306 CV_peakfl_raw
rename MED_peakfl_306 MED_peakfl_raw
rename pefr1 pefr1raw
rename pefr2 pefr2raw
rename pefr3 pefr3raw
rename n_readings_306 n_readings_raw
rename pefr_max_306 pefr_max_raw
rename balance306 balanceraw
rename chairscore306 chairscoreraw
rename time_chair306 time_chairraw
rename walk1 walk1raw
rename walk9 walk9raw
rename visimp306 visimpraw
rename chair_t chair_traw
rename ppm7a_s ppm4a_sraw
rename mmse_306 mmseraw
rename m306_cf mraw_cf
rename cogf306 cogfraw
rename cfcat306 cfcatraw
rename mmseph306 mmsephraw
rename mmref306 mmrefraw
rename mmph_ms mmph_msraw
rename dep11_306 dep11raw
rename dep306 depraw
rename simcesd simcesdraw
rename depres306 depresraw
rename gsavg306 gsavgraw
rename gshi306 gshiraw
rename gsavg2306 gsavg2raw
rename gripkg1 gripkg1raw
rename gripkg2 gripkg2raw
rename gripkg3 gripkg3raw
rename vis3cat_306 vis3cat_raw
rename hearimp_306 hearimp_raw
rename hear3cat_306 hear3cat_raw
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 306-month follow-up dataset with a new name
save 306month.dta
clear

* Append follow-up comprehensive assessment datasets to baseline dataset
use baseline.dta
append using 18month.dta
append using 36month.dta
append using 54month.dta
append using 72month.dta
append using 90month.dta
append using 108month_v2.dta
append using 144month.dta
append using 162month.dta
append using 180month.dta
append using 198month.dta
append using 216month.dta
append using 234month.dta
append using 252month.dta
append using 270month.dta
append using 288month.dta
append using 306month.dta
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save dataset with a new name
save rawf2f.dta
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5525 observations
clear 

* Use master dataset
use master.dta
* Rename StudyID variable to ensure consistency with combined comprehensive assessment dataset
rename StudyID STUDYID
* Overwrite dataset, by replacing the previously saved file
save master.dta, replace
* Merge master dataset with combined comprehensive assessment dataset
merge 1:1 STUDYID interval using rawf2f.dta, generate(merge_raw)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_raw,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save updated master dataset with a new name
save f2f.dta
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear

* Import raw baseline data
import sas using "P:\projects\PEP\Master\pepbase.sas7bdat"
* Keep relevant variables (demographics and intrinsic capacity)
keep STUDYID GDI1 GDI2 GDI3 GDI8 WALK1 WALK2 WALK3 WALK4 WALK5 WALK6 WALK7 WALK8 WALK9 MMSE1 MMSE2 MMSE3 MMSE4 MMSE5 MMSE6 MMSE7 MMSE8 MMSE9 MMSE10 MMSE11 MMSE12 MMSE13 MMSE14 MMSE15 MMSE16 MMSE17 MMSE18 MMSE19 MMSE20 MMSE21 MMSE22 MMSE23 MMSE24 MMSE25 MMSE26 MMSE27 MMSE28 MMSE29 MMSE30 ELG1 ELG2 ELG3 HT1 HT2 WT2A WT2B GS31 GS32 GS33 PEFR1 PEFR2 PEFR3 PEFR4 PEFR5 PEFR6 VT1A VT1B VT1C VT2 HEA1 HEA2 HEA3A HEA3B HEA3C HEA3D HEA3E HEA4A HEA4B HEA4C HEA4D PPM2 PPM3 PPM4A PPM4B PPM4C PPM6 PPM7 PPM8 DS1 DS2 DS3 DS4 DS5 DS6 DS7 DS8 DS9 DS10 DS11
* Generate a new variable called interval and assign the number 1 to each observation
gen interval = 1
* Rename variables to ensure consistency across intervals
rename GDI1 gender_p
rename GDI2 race_p
rename GDI3 age_p
rename GDI8 education_p
rename WALK1 walk1
rename WALK2 walk2
rename WALK3 walk3
rename WALK4 walk4
rename WALK5 walk5
rename WALK6 walk6
rename WALK7 walk7 
rename WALK8 walk8
rename WALK9 walk9
rename MMSE1 mmse1 
rename MMSE2 mmse2 
rename MMSE3 mmse3 
rename MMSE4 mmse4 
rename MMSE5 mmse5 
rename MMSE6 mmse6 
rename MMSE7 mmse7 
rename MMSE8 mmse8 
rename MMSE9 mmse9 
rename MMSE10 mmse10
rename MMSE11 mmse11 
rename MMSE12 mmse12 
rename MMSE13 mmse13 
rename MMSE14 mmse14
rename MMSE15 mmse15 
rename MMSE16 mmse16 
rename MMSE17 mmse17 
rename MMSE18 mmse18 
rename MMSE19 mmse19 
rename MMSE20 mmse20 
rename MMSE21 mmse21 
rename MMSE22 mmse22 
rename MMSE23 mmse23 
rename MMSE24 mmse24 
rename MMSE25 mmse25 
rename MMSE26 mmse26
rename MMSE27 mmse27 
rename MMSE28 mmse28 
rename MMSE29 mmse29 
rename MMSE30 mmse30
rename ELG1 ps4
rename ELG2 ps5
rename ELG3 ps6
rename WT2A wt1a 
rename WT2B wt1b
rename GS31 gs21 
rename GS32 gs22
rename GS33 gs23
rename PEFR1 pefr1 
rename PEFR2 pefr2 
rename PEFR3 pefr3 
rename PEFR4 pefr4
rename PEFR5 pefr5
rename PEFR6 pefr6
rename VT1A vt1a
rename VT1B vt1b
rename VT1C vt1c
rename VT2 vt2
rename HEA1 hea1 
rename HEA2 hea2 
rename HEA3A hea3a 
rename HEA3B hea3b 
rename HEA3C hea3c 
rename HEA3D hea3d 
rename HEA3E hea3e 
rename HEA4A hea4a 
rename HEA4B hea4b 
rename HEA4C hea4c 
rename HEA4D hea4d
rename PPM2 sitdown
rename PPM3 chairstand
rename PPM4A timedcsrp
rename PPM4B timedcsnoc
rename PPM4C timedcsa
rename PPM6 semitandem
rename PPM7 tandem
rename PPM8 sidebyside
rename DS1 ds1 
rename DS2 ds2
rename DS3 ds3
rename DS4 ds4 
rename DS5 ds5
rename DS6 ds6 
rename DS7 ds7
rename DS8 ds8 
rename DS9 ds9
rename DS10 ds10 
rename DS11 ds11
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw baseline dataset with a new name
save baseline_raw.dta
clear

* Import raw 18-month follow-up data
import sas using "P:\projects\PEP\sasdata\face18m.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt1a wt1b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 2 to each observation
gen interval = 2
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 18-month follow-up dataset with a new name
save 18m_raw.dta
clear

* Import raw 36-month follow-up data
import sas using "P:\projects\PEP\sasdata\face36mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt1a wt1b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 3 to each observation
gen interval = 3
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 36-month follow-up dataset with a new name
save 36m_raw.dta
clear

* Import raw 54-month follow-up data
import sas using "P:\projects\PEP\sasdata\face54mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 4 to each observation
gen interval = 4
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 54-month follow-up dataset with a new name
save 54m_raw.dta
clear

* Import raw 72-month follow-up data
import sas using "P:\projects\PEP\sasdata\face72mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 5 to each observation
gen interval = 5
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 72-month follow-up dataset with a new name
save 72m_raw.dta
clear

* Import raw 90-month follow-up data
import sas using "P:\projects\PEP\sasdata\face90mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 6 to each observation
gen interval = 6
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 90-month follow-up dataset with a new name
save 90m_raw.dta
clear

* Import raw 108-month follow-up data
import sas using "P:\projects\PEP\sasdata\face108mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 7 to each observation
gen interval = 7
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 108-month follow-up dataset with a new name
save 108m_raw.dta
clear

* Import raw 144-month follow-up data
import sas using "P:\projects\PEP\sasdata\face144mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 9 to each observation
gen interval = 9
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 144-month follow-up dataset with a new name
save 144m_raw.dta
clear

* Import raw 162-month follow-up data
import sas using "P:\projects\PEP\sasdata\face162mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 10 to each observation
gen interval = 10
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 162-month follow-up dataset with a new name
save 162m_raw.dta
clear

* Import raw 180-month follow-up data
import sas using "P:\projects\PEP\sasdata\face180mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 11 to each observation
gen interval = 11
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 180-month follow-up dataset with a new name
save 180m_raw.dta
clear

* Import raw 198-month follow-up data
import sas using "P:\projects\PEP\sasdata\face198mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 12 to each observation
gen interval = 12
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 198-month follow-up dataset with a new name
save 198m_raw.dta
clear

* Import raw 216-month follow-up data
import sas using "P:\projects\PEP\sasdata\face216mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 13 to each observation
gen interval = 13
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 216-month follow-up dataset with a new name
save 216m_raw.dta
clear

* Import raw 234-month follow-up data
import sas using "P:\projects\PEP\sasdata\face234mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 14 to each observation
gen interval = 14
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 234-month follow-up dataset with a new name
save 234m_raw.dta
clear

* Import raw 252-month follow-up data
import sas using "P:\projects\PEP\sasdata\face252mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 15 to each observation
gen interval = 15
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 252-month follow-up dataset with a new name
save 252m_raw.dta
clear

* Import raw 270-month follow-up data
import sas using "P:\projects\PEP\sasdata\face270mfu_amend_wrc.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep StudyID walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 16 to each observation
gen interval = 16
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 270-month follow-up dataset with a new name
save 270m_raw.dta
clear

* Import raw 288-month follow-up data
import sas using "P:\projects\PEP\sasdata\face288mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyid walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 17 to each observation
gen interval = 17
* Rename variables to ensure consistency across intervals
rename studyid STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 288-month follow-up dataset with a new name
save 288m_raw.dta
clear

* Import raw 306-month follow-up data
import sas using "P:\projects\PEP\sasdata\face306mfu.sas7bdat"
* Keep relevant variables (intrinsic capacity)
keep studyid walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 ps4 ps5 ps6 wt2a wt2b gs21 gs22 gs23 pefr1 pefr2 pefr3 pefr4 pefr5 pefr6 vt1a vt1b vt1c vt2 hea1 hea2 hea3a hea3b hea3c hea3d hea3e hea4a hea4b hea4c hea4d hea4e ppm2 ppm3 ppm4 ppm5 ppm6 ppm7a ppm7b ppm7c ds1 ds2 ds3 ds4 ds5 ds6 ds7 ds8 ds9 ds10 ds11
* Generate a new variable called interval and assign the number 18 to each observation
gen interval = 18
* Rename variables to ensure consistency across intervals
rename studyid STUDYID
rename wt2a wt1a
rename wt2b wt1b
rename ppm5 sitdown
rename ppm6 chairstand
rename ppm7a timedcsrp
rename ppm7b timedcsnoc
rename ppm7c timedcsa 
rename ppm2 semitandem
rename ppm3 tandem 
rename ppm4 sidebyside
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 306-month follow-up dataset with a new name
save 306m_raw.dta
clear

* Append raw follow-up comprehensive assessment datasets to raw baseline dataset
use baseline_raw.dta
append using 18m_raw.dta
append using 36m_raw.dta
append using 54m_raw.dta
append using 72m_raw.dta
append using 90m_raw.dta
append using 108m_raw.dta
append using 144m_raw.dta
append using 162m_raw.dta
append using 180m_raw.dta
append using 198m_raw.dta
append using 216m_raw.dta
append using 234m_raw.dta
append using 252m_raw.dta
append using 270m_raw.dta
append using 288m_raw.dta
append using 306m_raw.dta
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save dataset with a new name
save raw_f2f.dta
* Count total number of participants and observations
unique STUDYID
* 848 individuals, 5201 observations
clear 

* Use updated master dataset
use f2f.dta
* Merge updated master dataset with combined raw comprehensive assessment dataset
merge 1:1 STUDYID interval using raw_f2f.dta, generate(merge_raw2)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_raw2,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Overwrite dataset, by replacing the previously saved file
save f2f.dta, replace
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear

* Import baseline data
import sas using "P:\projects\PEP\Master\baseface.sas7bdat"
* Keep relevant variables (covariates)
keep STUDYID age_b female white edu_cont edu7cat age5cat BMI_bl highbp mi chf stroke cancer diabetes hipfx otherfx arthrit parkinsn legamput liver lung_d ccsumbl1 ccsumbl2 diff4adl diff7adl dep3adl diff3adl walk_dev hp_walk ds_walk hp_stair ds_stair hp_carry ds_carry hp_shop ds_shop hp_clean ds_clean hp_meal ds_meal hp_meds ds_meds hp_bills ds_bills iadl_dep iadl_dis hp_mobil ds_mobil bloc_cat blocksbl adl24_bl adl12ms badl14bl iadl10bl ra12 mobdisbl intdtebl
* Rename variables to ensure consistency across intervals
rename * raw_*
* Generate a new variable called interval and assign the number 1 to each observation
gen interval = 1
* Rename raw_STUDYID variable to ensure consistency with updated master dataset
rename raw_STUDYID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save baseline dataset with a new name
save other_vrb1.dta
clear

* Import 18-month follow-up data
import sas using "P:\projects\PEP\Master\fu18face.sas7bdat"
* Keep relevant variables (covariates)
keep STUDYID age_18 female white edu_cont agecat18 BMI_18 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_18 mi_18 chf_18 strok_18 cancr_18 diab_18 hipfx_18 lungd_18 arth_18 ccsum18a ccsum18b ccsum18c d_4adl18 d_7adl18 d_3adl18 hp3adl18 walkd_18 hpwalk18 dswalk18 hpstir18 dsstir18 hpcary18 dscary18 hpshop18 dsshop18 hpclen18 dsclen18 hpmeal18 dsmeal18 hpmeds18 dsmeds18 hpbill18 dsbill18 iadlhp18 iadlds18 hp_mob18 ds_mob18 bloc_c18 blocks18 adl24_18 adl12ms badl1418 iadl1018 mobdis18 intdate18
* Rename variables to ensure consistency across intervals
rename BMI_18 BMI_bl
rename agecat18 age5cat
rename age_18 age_b
rename ccsum18a ccsumbl1
rename ccsum18c ccsumbl2
rename Cancer cancer
rename d_4adl18 diff4adl 
rename d_7adl18 diff7adl
rename d_3adl18 diff3adl 
rename hp3adl18 dep3adl 
rename walkd_18 walk_dev
rename hpwalk18 hp_walk
rename dswalk18 ds_walk
rename hpstir18 hp_stair
rename dsstir18 ds_stair
rename hpcary18 hp_carry
rename dscary18 ds_carry
rename hpshop18 hp_shop
rename dsshop18 ds_shop 
rename hpclen18 hp_clean
rename dsclen18 ds_clean
rename hpmeal18 hp_meal
rename dsmeal18 ds_meal
rename hpmeds18 hp_meds
rename dsmeds18 ds_meds
rename hpbill18 hp_bills
rename dsbill18 ds_bills
rename iadlhp18 iadl_dep
rename iadlds18 iadl_dis
rename hp_mob18 hp_mobil
rename ds_mob18 ds_mobil
rename bloc_c18 bloc_cat
rename blocks18 blocksbl
rename adl24_18 adl24_bl
rename badl1418 badl14bl
rename iadl1018 iadl10bl
rename mobdis18 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 2 to each observation
gen interval = 2
* Rename raw_STUDYID variable to ensure consistency with updated master dataset
rename raw_STUDYID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 18-month follow-up dataset with a new name
save other_vrb2.dta
clear

* Import 36-month follow-up data
import sas using "P:\projects\PEP\Master\fu36face.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID age_36 female white edu_cont agecat36 BMI_36 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_36 mi_36 chf_36 strok_36 cancr_36 diab_36 hipfx_36 lungd_36 arth_36 ccsum36a ccsum36b ccsum36c d_4adl36 d_7adl36 d_3adl36 hp3adl36 walkd_36 hpwalk36 dswalk36 hpstir36 dsstir36 hpcary36 dscary36 hpshop36 dsshop36 hpclen36 dsclen36 hpmeal36 dsmeal36 hpmeds36 dsmeds36 hpbill36 dsbill36 iadlhp36 iadlds36 hp_mob36 ds_mob36 bloc_c36 blocks36 adl24_36 adl12ms badl1436 iadl1036 mobdis36 intdate36
* Rename variables to ensure consistency across intervals
rename BMI_36 BMI_bl
rename agecat36 age5cat
rename age_36 age_b
rename ccsum36a ccsumbl1
rename ccsum36c ccsumbl2
rename Cancer cancer
rename d_4adl36 diff4adl 
rename d_7adl36 diff7adl
rename d_3adl36 diff3adl 
rename hp3adl36 dep3adl 
rename walkd_36 walk_dev
rename hpwalk36 hp_walk
rename dswalk36 ds_walk
rename hpstir36 hp_stair
rename dsstir36 ds_stair
rename hpcary36 hp_carry
rename dscary36 ds_carry
rename hpshop36 hp_shop
rename dsshop36 ds_shop 
rename hpclen36 hp_clean
rename dsclen36 ds_clean
rename hpmeal36 hp_meal
rename dsmeal36 ds_meal
rename hpmeds36 hp_meds
rename dsmeds36 ds_meds
rename hpbill36 hp_bills
rename dsbill36 ds_bills
rename iadlhp36 iadl_dep
rename iadlds36 iadl_dis
rename hp_mob36 hp_mobil
rename ds_mob36 ds_mobil
rename bloc_c36 bloc_cat
rename blocks36 blocksbl
rename adl24_36 adl24_bl
rename badl1436 badl14bl
rename iadl1036 iadl10bl
rename mobdis36 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 3 to each observation
gen interval = 3
* Rename raw_StudyID variable to ensure consistency with updated master dataset
rename raw_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 36-month follow-up dataset with a new name
save other_vrb3.dta
clear

* Import 54-month follow-up data
import sas using "P:\projects\PEP\Master\fu54face.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID age_54 female white edu_cont agecat54 BMI_54 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_54 mi_54 chf_54 strok_54 cancr_54 diab_54 hipfx_54 lungd_54 arth_54 ccsum54a ccsum54b ccsum54c d_4adl54 d_7adl54 d_3adl54 hp3adl54 walkd_54 hpwalk54 dswalk54 hpstir54 dsstir54 hpcary54 dscary54 hpshop54 dsshop54 hpclen54 dsclen54 hpmeal54 dsmeal54 hpmeds54 dsmeds54 hpbill54 dsbill54 iadlhp54 iadlds54 hp_mob54 ds_mob54 bloc_c54 blocks54 adl24_54 adl12ms badl1454 iadl1054 mobdis54 intdate54
* Rename variables to ensure consistency across intervals
rename BMI_54 BMI_bl
rename agecat54 age5cat
rename age_54 age_b
rename ccsum54a ccsumbl1
rename ccsum54c ccsumbl2
rename Cancer cancer
rename d_4adl54 diff4adl 
rename d_7adl54 diff7adl
rename d_3adl54 diff3adl 
rename hp3adl54 dep3adl 
rename walkd_54 walk_dev
rename hpwalk54 hp_walk
rename dswalk54 ds_walk
rename hpstir54 hp_stair
rename dsstir54 ds_stair
rename hpcary54 hp_carry
rename dscary54 ds_carry
rename hpshop54 hp_shop
rename dsshop54 ds_shop 
rename hpclen54 hp_clean
rename dsclen54 ds_clean
rename hpmeal54 hp_meal
rename dsmeal54 ds_meal
rename hpmeds54 hp_meds
rename dsmeds54 ds_meds
rename hpbill54 hp_bills
rename dsbill54 ds_bills
rename iadlhp54 iadl_dep
rename iadlds54 iadl_dis
rename hp_mob54 hp_mobil
rename ds_mob54 ds_mobil
rename bloc_c54 bloc_cat
rename blocks54 blocksbl
rename adl24_54 adl24_bl
rename badl1454 badl14bl
rename iadl1054 iadl10bl
rename mobdis54 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 4 to each observation
gen interval = 4
* Rename raw_StudyID variable to ensure consistency with updated master dataset
rename raw_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 54-month follow-up dataset with a new name
save other_vrb4.dta
clear

* Import 72-month follow-up data
import sas using "P:\projects\PEP\Master\fu72face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_72 female white edu_cont agecat72 BMI_72 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_72 mi_72 chf_72 strok_72 cancr_72 diab_72 hipfx_72 lungd_72 arth_72 ccsum72a ccsum72b ccsum72c d_4adl72 d_7adl72 d_3adl72 hp3adl72 walkd_72 hpwalk72 dswalk72 hpstir72 dsstir72 hpcary72 dscary72 hpshop72 dsshop72 hpclen72 dsclen72 hpmeal72 dsmeal72 hpmeds72 dsmeds72 hpbill72 dsbill72 iadlhp72 iadlds72 hp_mob72 ds_mob72 bloc_c72 blocks72 adl24_72 adl12ms badl1472 iadl1072 mobdis72 intdate72
* Rename variables to ensure consistency across intervals
rename BMI_72 BMI_bl
rename agecat72 age5cat
rename age_72 age_b
rename ccsum72a ccsumbl1
rename ccsum72c ccsumbl2
rename Cancer cancer
rename d_4adl72 diff4adl 
rename d_7adl72 diff7adl
rename d_3adl72 diff3adl 
rename hp3adl72 dep3adl 
rename walkd_72 walk_dev
rename hpwalk72 hp_walk
rename dswalk72 ds_walk
rename hpstir72 hp_stair
rename dsstir72 ds_stair
rename hpcary72 hp_carry
rename dscary72 ds_carry
rename hpshop72 hp_shop
rename dsshop72 ds_shop 
rename hpclen72 hp_clean
rename dsclen72 ds_clean
rename hpmeal72 hp_meal
rename dsmeal72 ds_meal
rename hpmeds72 hp_meds
rename dsmeds72 ds_meds
rename hpbill72 hp_bills
rename dsbill72 ds_bills
rename iadlhp72 iadl_dep
rename iadlds72 iadl_dis
rename hp_mob72 hp_mobil
rename ds_mob72 ds_mobil
rename bloc_c72 bloc_cat
rename blocks72 blocksbl
rename adl24_72 adl24_bl
rename badl1472 badl14bl
rename iadl1072 iadl10bl
rename mobdis72 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 5 to each observation
gen interval = 5
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 72-month follow-up dataset with a new name
save other_vrb5.dta
clear

* Import 90-month follow-up data
import sas using "P:\projects\PEP\Master\fu90face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_90 female white edu_cont agecat90 BMI_90 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_90 mi_90 chf_90 strok_90 cancr_90 diab_90 hipfx_90 lungd_90 arth_90 ccsum90a ccsum90b ccsum90c d_4adl90 d_7adl90 d_3adl90 hp3adl90 walkd_90 hpwalk90 dswalk90 hpstir90 dsstir90 hpcary90 dscary90 hpshop90 dsshop90 hpclen90 dsclen90 hpmeal90 dsmeal90 hpmeds90 dsmeds90 hpbill90 dsbill90 iadlhp90 iadlds90 hp_mob90 ds_mob90 bloc_c90 blocks90 adl24_90 adl12ms badl1490 iadl1090 mobdis90 intdate90
* Rename variables to ensure consistency across intervals
rename BMI_90 BMI_bl
rename agecat90 age5cat
rename age_90 age_b
rename ccsum90a ccsumbl1
rename ccsum90c ccsumbl2
rename Cancer cancer
rename d_4adl90 diff4adl 
rename d_7adl90 diff7adl
rename d_3adl90 diff3adl 
rename hp3adl90 dep3adl 
rename walkd_90 walk_dev
rename hpwalk90 hp_walk
rename dswalk90 ds_walk
rename hpstir90 hp_stair
rename dsstir90 ds_stair
rename hpcary90 hp_carry
rename dscary90 ds_carry
rename hpshop90 hp_shop
rename dsshop90 ds_shop 
rename hpclen90 hp_clean
rename dsclen90 ds_clean
rename hpmeal90 hp_meal
rename dsmeal90 ds_meal
rename hpmeds90 hp_meds
rename dsmeds90 ds_meds
rename hpbill90 hp_bills
rename dsbill90 ds_bills
rename iadlhp90 iadl_dep
rename iadlds90 iadl_dis
rename hp_mob90 hp_mobil
rename ds_mob90 ds_mobil
rename bloc_c90 bloc_cat
rename blocks90 blocksbl
rename adl24_90 adl24_bl
rename badl1490 badl14bl
rename iadl1090 iadl10bl
rename mobdis90 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 6 to each observation
gen interval = 6
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 90-month follow-up dataset with a new name
save other_vrb6.dta
clear

* Import 108-month follow-up data
import sas using "P:\projects\PEP\Master\fu108face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_108 female white edu_cont agecat108 BMI_108 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_108 mi_108 chf_108 strok_108 cancr_108 diab_108 hipfx_108 lungd_108 arth_108 ccsum108a ccsum108b ccsum108c d_4adl108 d_7adl108 d_3adl108 hp3adl108 walkd_108 hpwalk108 dswalk108 hpstir108 dsstir108 hpcary108 dscary108 hpshop108 dsshop108 hpclen108 dsclen108 hpmeal108 dsmeal108 hpmeds108 dsmeds108 hpbill108 dsbill108 iadlhp108 iadlds108 hp_mob108 ds_mob108 bloc_c108 blocks108 adl24_108 adl12ms badl14108 iadl10108 mobdis108 intdate108
* Rename variables to ensure consistency across intervals
rename BMI_108 BMI_bl
rename agecat108 age5cat
rename age_108 age_b
rename ccsum108a ccsumbl1
rename ccsum108c ccsumbl2
rename Cancer cancer
rename d_4adl108 diff4adl 
rename d_7adl108 diff7adl
rename d_3adl108 diff3adl 
rename hp3adl108 dep3adl 
rename walkd_108 walk_dev
rename hpwalk108 hp_walk
rename dswalk108 ds_walk
rename hpstir108 hp_stair
rename dsstir108 ds_stair
rename hpcary108 hp_carry
rename dscary108 ds_carry
rename hpshop108 hp_shop
rename dsshop108 ds_shop 
rename hpclen108 hp_clean
rename dsclen108 ds_clean
rename hpmeal108 hp_meal
rename dsmeal108 ds_meal
rename hpmeds108 hp_meds
rename dsmeds108 ds_meds
rename hpbill108 hp_bills
rename dsbill108 ds_bills
rename iadlhp108 iadl_dep
rename iadlds108 iadl_dis
rename hp_mob108 hp_mobil
rename ds_mob108 ds_mobil
rename bloc_c108 bloc_cat
rename blocks108 blocksbl
rename adl24_108 adl24_bl
rename badl14108 badl14bl
rename iadl10108 iadl10bl
rename mobdis108 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 7 to each observation
gen interval = 7
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 108-month follow-up dataset with a new name
save other_vrb7.dta
clear

* Import 144-month follow-up data
import sas using "P:\projects\PEP\Master\fu144face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_144 female white edu_cont agecat144 BMI_144 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_144 mi_144 chf_144 strok_144 cancr_144 diab_144 hipfx_144 lungd_144 arth_144 ccsum144a ccsum144b ccsum144c d_4adl144 d_7adl144 d_3adl144 hp3adl144 walkd_144 hpwalk144 dswalk144 hpstir144 dsstir144 hpcary144 dscary144 hpshop144 dsshop144 hpclen144 dsclen144 hpmeal144 dsmeal144 hpmeds144 dsmeds144 hpbill144 dsbill144 iadlhp144 iadlds144 hp_mob144 ds_mob144 bloc_c144 blocks144 adl24_144 adl12ms badl14144 iadl10144 mobdis144 intdate144
* Rename variables to ensure consistency across intervals
rename BMI_144 BMI_bl
rename agecat144 age5cat
rename age_144 age_b
rename ccsum144a ccsumbl1
rename ccsum144c ccsumbl2
rename Cancer cancer
rename d_4adl144 diff4adl 
rename d_7adl144 diff7adl
rename d_3adl144 diff3adl 
rename hp3adl144 dep3adl 
rename walkd_144 walk_dev
rename hpwalk144 hp_walk
rename dswalk144 ds_walk
rename hpstir144 hp_stair
rename dsstir144 ds_stair
rename hpcary144 hp_carry
rename dscary144 ds_carry
rename hpshop144 hp_shop
rename dsshop144 ds_shop 
rename hpclen144 hp_clean
rename dsclen144 ds_clean
rename hpmeal144 hp_meal
rename dsmeal144 ds_meal
rename hpmeds144 hp_meds
rename dsmeds144 ds_meds
rename hpbill144 hp_bills
rename dsbill144 ds_bills
rename iadlhp144 iadl_dep
rename iadlds144 iadl_dis
rename hp_mob144 hp_mobil
rename ds_mob144 ds_mobil
rename bloc_c144 bloc_cat
rename blocks144 blocksbl
rename adl24_144 adl24_bl
rename badl14144 badl14bl
rename iadl10144 iadl10bl
rename mobdis144 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 9 to each observation
gen interval = 9
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 144-month follow-up dataset with a new name
save other_vrb9.dta
clear

* Import 162-month follow-up data
import sas using "P:\projects\PEP\Master\fu162face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_162 female white edu_cont agecat162 BMI_162 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_162 mi_162 chf_162 strok_162 cancr_162 diab_162 hipfx_162 lungd_162 arth_162 ccsum162a ccsum162b ccsum162c d_4adl162 d_7adl162 d_3adl162 hp3adl162 walkd_162 hpwalk162 dswalk162 hpstir162 dsstir162 hpcary162 dscary162 hpshop162 dsshop162 hpclen162 dsclen162 hpmeal162 dsmeal162 hpmeds162 dsmeds162 hpbill162 dsbill162 iadlhp162 iadlds162 hp_mob162 ds_mob162 bloc_c162 blocks162 adl24_162 adl12ms badl14162 iadl10162 mobdis162 intdate162
* Rename variables to ensure consistency across intervals
rename BMI_162 BMI_bl
rename agecat162 age5cat
rename age_162 age_b
rename ccsum162a ccsumbl1
rename ccsum162c ccsumbl2
rename Cancer cancer
rename d_4adl162 diff4adl 
rename d_7adl162 diff7adl
rename d_3adl162 diff3adl 
rename hp3adl162 dep3adl 
rename walkd_162 walk_dev
rename hpwalk162 hp_walk
rename dswalk162 ds_walk
rename hpstir162 hp_stair
rename dsstir162 ds_stair
rename hpcary162 hp_carry
rename dscary162 ds_carry
rename hpshop162 hp_shop
rename dsshop162 ds_shop 
rename hpclen162 hp_clean
rename dsclen162 ds_clean
rename hpmeal162 hp_meal
rename dsmeal162 ds_meal
rename hpmeds162 hp_meds
rename dsmeds162 ds_meds
rename hpbill162 hp_bills
rename dsbill162 ds_bills
rename iadlhp162 iadl_dep
rename iadlds162 iadl_dis
rename hp_mob162 hp_mobil
rename ds_mob162 ds_mobil
rename bloc_c162 bloc_cat
rename blocks162 blocksbl
rename adl24_162 adl24_bl
rename badl14162 badl14bl
rename iadl10162 iadl10bl
rename mobdis162 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 10 to each observation
gen interval = 10
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 162-month follow-up dataset with a new name
save other_vrb10.dta
clear

* Import 180-month follow-up data
import sas using "P:\projects\PEP\Master\fu180face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_180 female white edu_cont agecat180 BMI_180 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_180 mi_180 chf_180 strok_180 cancr_180 diab_180 hipfx_180 lungd_180 arth_180 ccsum180a ccsum180b ccsum180c d_4adl180 d_7adl180 d_3adl180 hp3adl180 walkd_180 hpwalk180 dswalk180 hpstir180 dsstir180 hpcary180 dscary180 hpshop180 dsshop180 hpclen180 dsclen180 hpmeal180 dsmeal180 hpmeds180 dsmeds180 hpbill180 dsbill180 iadlhp180 iadlds180 hp_mob180 ds_mob180 bloc_c180 blocks180 adl24_180 adl12ms badl14180 iadl10180 mobdis180 intdate180
* Rename variables to ensure consistency across intervals
rename BMI_180 BMI_bl
rename agecat180 age5cat
rename age_180 age_b
rename ccsum180a ccsumbl1
rename ccsum180c ccsumbl2
rename Cancer cancer
rename d_4adl180 diff4adl 
rename d_7adl180 diff7adl
rename d_3adl180 diff3adl 
rename hp3adl180 dep3adl 
rename walkd_180 walk_dev
rename hpwalk180 hp_walk
rename dswalk180 ds_walk
rename hpstir180 hp_stair
rename dsstir180 ds_stair
rename hpcary180 hp_carry
rename dscary180 ds_carry
rename hpshop180 hp_shop
rename dsshop180 ds_shop 
rename hpclen180 hp_clean
rename dsclen180 ds_clean
rename hpmeal180 hp_meal
rename dsmeal180 ds_meal
rename hpmeds180 hp_meds
rename dsmeds180 ds_meds
rename hpbill180 hp_bills
rename dsbill180 ds_bills
rename iadlhp180 iadl_dep
rename iadlds180 iadl_dis
rename hp_mob180 hp_mobil
rename ds_mob180 ds_mobil
rename bloc_c180 bloc_cat
rename blocks180 blocksbl
rename adl24_180 adl24_bl
rename badl14180 badl14bl
rename iadl10180 iadl10bl
rename mobdis180 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 11 to each observation
gen interval = 11
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 180-month follow-up dataset with a new name
save other_vrb11.dta
clear

* Import 198-month follow-up data
import sas using "P:\projects\PEP\Master\fu198face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_198 female white edu_cont agecat198 BMI_198 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_198 mi_198 chf_198 strok_198 cancr_198 diab_198 hipfx_198 lungd_198 arth_198 ccsum198a ccsum198b ccsum198c d_4adl198 d_7adl198 d_3adl198 hp3adl198 walkd_198 hpwalk198 dswalk198 hpstir198 dsstir198 hpcary198 dscary198 hpshop198 dsshop198 hpclen198 dsclen198 hpmeal198 dsmeal198 hpmeds198 dsmeds198 hpbill198 dsbill198 iadlhp198 iadlds198 hp_mob198 ds_mob198 bloc_c198 blocks198 adl24_198 adl12ms badl14198 iadl10198 mobdis198 intdate198
* Rename variables to ensure consistency across intervals
rename BMI_198 BMI_bl
rename agecat198 age5cat
rename age_198 age_b
rename ccsum198a ccsumbl1
rename ccsum198c ccsumbl2
rename Cancer cancer
rename d_4adl198 diff4adl 
rename d_7adl198 diff7adl
rename d_3adl198 diff3adl 
rename hp3adl198 dep3adl 
rename walkd_198 walk_dev
rename hpwalk198 hp_walk
rename dswalk198 ds_walk
rename hpstir198 hp_stair
rename dsstir198 ds_stair
rename hpcary198 hp_carry
rename dscary198 ds_carry
rename hpshop198 hp_shop
rename dsshop198 ds_shop 
rename hpclen198 hp_clean
rename dsclen198 ds_clean
rename hpmeal198 hp_meal
rename dsmeal198 ds_meal
rename hpmeds198 hp_meds
rename dsmeds198 ds_meds
rename hpbill198 hp_bills
rename dsbill198 ds_bills
rename iadlhp198 iadl_dep
rename iadlds198 iadl_dis
rename hp_mob198 hp_mobil
rename ds_mob198 ds_mobil
rename bloc_c198 bloc_cat
rename blocks198 blocksbl
rename adl24_198 adl24_bl
rename badl14198 badl14bl
rename iadl10198 iadl10bl
rename mobdis198 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 12 to each observation
gen interval = 12
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 198-month follow-up dataset with a new name
save other_vrb12.dta
clear

* Import 216-month follow-up data
import sas using "P:\projects\PEP\Master\fu216face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_216 female white edu_cont agecat216 BMI_216 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_216 mi_216 chf_216 strok_216 cancr_216 diab_216 hipfx_216 lungd_216 arth_216 ccsum216a ccsum216b ccsum216c d_4adl216 d_7adl216 d_3adl216 hp3adl216 walkd_216 hpwalk216 dswalk216 hpstir216 dsstir216 hpcary216 dscary216 hpshop216 dsshop216 hpclen216 dsclen216 hpmeal216 dsmeal216 hpmeds216 dsmeds216 hpbill216 dsbill216 iadlhp216 iadlds216 hp_mob216 ds_mob216 bloc_c216 blocks216 adl24_216 adl12ms badl14216 iadl10216 mobdis216 intdate216
* Rename variables to ensure consistency across intervals
rename BMI_216 BMI_bl
rename agecat216 age5cat
rename age_216 age_b
rename ccsum216a ccsumbl1
rename ccsum216c ccsumbl2
rename Cancer cancer
rename d_4adl216 diff4adl 
rename d_7adl216 diff7adl
rename d_3adl216 diff3adl 
rename hp3adl216 dep3adl 
rename walkd_216 walk_dev
rename hpwalk216 hp_walk
rename dswalk216 ds_walk
rename hpstir216 hp_stair
rename dsstir216 ds_stair
rename hpcary216 hp_carry
rename dscary216 ds_carry
rename hpshop216 hp_shop
rename dsshop216 ds_shop 
rename hpclen216 hp_clean
rename dsclen216 ds_clean
rename hpmeal216 hp_meal
rename dsmeal216 ds_meal
rename hpmeds216 hp_meds
rename dsmeds216 ds_meds
rename hpbill216 hp_bills
rename dsbill216 ds_bills
rename iadlhp216 iadl_dep
rename iadlds216 iadl_dis
rename hp_mob216 hp_mobil
rename ds_mob216 ds_mobil
rename bloc_c216 bloc_cat
rename blocks216 blocksbl
rename adl24_216 adl24_bl
rename badl14216 badl14bl
rename iadl10216 iadl10bl
rename mobdis216 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 13 to each observation
gen interval = 13
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 216-month follow-up dataset with a new name
save other_vrb13.dta
clear

* Import 234-month follow-up data
import sas using "P:\projects\PEP\Master\fu234face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_234 female white edu_cont agecat234 BMI_234 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_234 mi_234 chf_234 strok_234 cancr_234 diab_234 hipfx_234 lungd_234 arth_234 ccsum234a ccsum234b ccsum234c d_4adl234 d_7adl234 d_3adl234 hp3adl234 walkd_234 hpwalk234 dswalk234 hpstir234 dsstir234 hpcary234 dscary234 hpshop234 dsshop234 hpclen234 dsclen234 hpmeal234 dsmeal234 hpmeds234 dsmeds234 hpbill234 dsbill234 iadlhp234 iadlds234 hp_mob234 ds_mob234 bloc_c234 blocks234 adl24_234 adl12ms badl14234 iadl10234 mobdis234 intdate234
* Rename variables to ensure consistency across intervals
rename BMI_234 BMI_bl
rename agecat234 age5cat
rename age_234 age_b
rename ccsum234a ccsumbl1
rename ccsum234c ccsumbl2
rename Cancer cancer
rename d_4adl234 diff4adl 
rename d_7adl234 diff7adl
rename d_3adl234 diff3adl 
rename hp3adl234 dep3adl 
rename walkd_234 walk_dev
rename hpwalk234 hp_walk
rename dswalk234 ds_walk
rename hpstir234 hp_stair
rename dsstir234 ds_stair
rename hpcary234 hp_carry
rename dscary234 ds_carry
rename hpshop234 hp_shop
rename dsshop234 ds_shop 
rename hpclen234 hp_clean
rename dsclen234 ds_clean
rename hpmeal234 hp_meal
rename dsmeal234 ds_meal
rename hpmeds234 hp_meds
rename dsmeds234 ds_meds
rename hpbill234 hp_bills
rename dsbill234 ds_bills
rename iadlhp234 iadl_dep
rename iadlds234 iadl_dis
rename hp_mob234 hp_mobil
rename ds_mob234 ds_mobil
rename bloc_c234 bloc_cat
rename blocks234 blocksbl
rename adl24_234 adl24_bl
rename badl14234 badl14bl
rename iadl10234 iadl10bl
rename mobdis234 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 14 to each observation
gen interval = 14
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 234-month follow-up dataset with a new name
save other_vrb14.dta
clear

* Import 252-month follow-up data
import sas using "P:\projects\PEP\Master\fu252face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_252 female white edu_cont agecat252 BMI_252 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_252 mi_252 chf_252 strok_252 cancr_252 diab_252 hipfx_252 lungd_252 arth_252 ccsum252a ccsum252b ccsum252c d_4adl252 d_7adl252 d_3adl252 hp3adl252 walkd_252 hpwalk252 dswalk252 hpstir252 dsstir252 hpcary252 dscary252 hpshop252 dsshop252 hpclen252 dsclen252 hpmeal252 dsmeal252 hpmeds252 dsmeds252 hpbill252 dsbill252 iadlhp252 iadlds252 hp_mob252 ds_mob252 bloc_c252 blocks252 adl24_252 adl12ms badl14252 iadl10252 mobdis252 intdate252
* Rename variables to ensure consistency across intervals
rename BMI_252 BMI_bl
rename agecat252 age5cat
rename age_252 age_b
rename ccsum252a ccsumbl1
rename ccsum252c ccsumbl2
rename Cancer cancer
rename d_4adl252 diff4adl 
rename d_7adl252 diff7adl
rename d_3adl252 diff3adl 
rename hp3adl252 dep3adl 
rename walkd_252 walk_dev
rename hpwalk252 hp_walk
rename dswalk252 ds_walk
rename hpstir252 hp_stair
rename dsstir252 ds_stair
rename hpcary252 hp_carry
rename dscary252 ds_carry
rename hpshop252 hp_shop
rename dsshop252 ds_shop 
rename hpclen252 hp_clean
rename dsclen252 ds_clean
rename hpmeal252 hp_meal
rename dsmeal252 ds_meal
rename hpmeds252 hp_meds
rename dsmeds252 ds_meds
rename hpbill252 hp_bills
rename dsbill252 ds_bills
rename iadlhp252 iadl_dep
rename iadlds252 iadl_dis
rename hp_mob252 hp_mobil
rename ds_mob252 ds_mobil
rename bloc_c252 bloc_cat
rename blocks252 blocksbl
rename adl24_252 adl24_bl
rename badl14252 badl14bl
rename iadl10252 iadl10bl
rename mobdis252 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 15 to each observation
gen interval = 15
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 252-month follow-up dataset with a new name
save other_vrb15.dta
clear

* Import 270-month follow-up data
import sas using "P:\projects\PEP\Master\fu270face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_270 female white edu_cont agecat270 BMI_270 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_270 mi_270 chf_270 strok_270 cancr_270 diab_270 hipfx_270 lungd_270 arth_270 ccsum270a ccsum270b ccsum270c d_4adl270 d_7adl270 d_3adl270 hp3adl270 walkd_270 hpwalk270 dswalk270 hpstir270 dsstir270 hpcary270 dscary270 hpshop270 dsshop270 hpclen270 dsclen270 hpmeal270 dsmeal270 hpmeds270 dsmeds270 hpbill270 dsbill270 iadlhp270 iadlds270 hp_mob270 ds_mob270 bloc_c270 blocks270 adl24_270 adl12ms badl14270 iadl10270 mobdis270 intdate270
* Rename variables to ensure consistency across intervals
rename BMI_270 BMI_bl
rename agecat270 age5cat
rename age_270 age_b
rename ccsum270a ccsumbl1
rename ccsum270c ccsumbl2
rename Cancer cancer
rename d_4adl270 diff4adl 
rename d_7adl270 diff7adl
rename d_3adl270 diff3adl 
rename hp3adl270 dep3adl 
rename walkd_270 walk_dev
rename hpwalk270 hp_walk
rename dswalk270 ds_walk
rename hpstir270 hp_stair
rename dsstir270 ds_stair
rename hpcary270 hp_carry
rename dscary270 ds_carry
rename hpshop270 hp_shop
rename dsshop270 ds_shop 
rename hpclen270 hp_clean
rename dsclen270 ds_clean
rename hpmeal270 hp_meal
rename dsmeal270 ds_meal
rename hpmeds270 hp_meds
rename dsmeds270 ds_meds
rename hpbill270 hp_bills
rename dsbill270 ds_bills
rename iadlhp270 iadl_dep
rename iadlds270 iadl_dis
rename hp_mob270 hp_mobil
rename ds_mob270 ds_mobil
rename bloc_c270 bloc_cat
rename blocks270 blocksbl
rename adl24_270 adl24_bl
rename badl14270 badl14bl
rename iadl10270 iadl10bl
rename mobdis270 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 16 to each observation
gen interval = 16
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 270-month follow-up dataset with a new name
save other_vrb16.dta
clear

* Import 288-month follow-up data
import sas using "P:\projects\PEP\Master\fu288face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_288 female white edu_cont agecat288 BMI_288 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_288 mi_288 chf_288 strok_288 cancr_288 diab_288 hipfx_288 lungd_288 arth_288 ccsum288a ccsum288b ccsum288c d_4adl288 d_7adl288 d_3adl288 hp3adl288 walkd_288 hpwalk288 dswalk288 hpstir288 dsstir288 hpcary288 dscary288 hpshop288 dsshop288 hpclen288 dsclen288 hpmeal288 dsmeal288 hpmeds288 dsmeds288 hpbill288 dsbill288 iadlhp288 iadlds288 hp_mob288 ds_mob288 bloc_c288 blocks288 adl24_288 adl12ms badl14288 iadl10288 mobdis288 intdate288
* Rename variables to ensure consistency across intervals
rename BMI_288 BMI_bl
rename agecat288 age5cat
rename age_288 age_b
rename ccsum288a ccsumbl1
rename ccsum288c ccsumbl2
rename Cancer cancer
rename d_4adl288 diff4adl 
rename d_7adl288 diff7adl
rename d_3adl288 diff3adl 
rename hp3adl288 dep3adl 
rename walkd_288 walk_dev
rename hpwalk288 hp_walk
rename dswalk288 ds_walk
rename hpstir288 hp_stair
rename dsstir288 ds_stair
rename hpcary288 hp_carry
rename dscary288 ds_carry
rename hpshop288 hp_shop
rename dsshop288 ds_shop 
rename hpclen288 hp_clean
rename dsclen288 ds_clean
rename hpmeal288 hp_meal
rename dsmeal288 ds_meal
rename hpmeds288 hp_meds
rename dsmeds288 ds_meds
rename hpbill288 hp_bills
rename dsbill288 ds_bills
rename iadlhp288 iadl_dep
rename iadlds288 iadl_dis
rename hp_mob288 hp_mobil
rename ds_mob288 ds_mobil
rename bloc_c288 bloc_cat
rename blocks288 blocksbl
rename adl24_288 adl24_bl
rename badl14288 badl14bl
rename iadl10288 iadl10bl
rename mobdis288 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 17 to each observation
gen interval = 17
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 288-month follow-up dataset with a new name
save other_vrb17.dta
clear

* Import 306-month follow-up data
import sas using "P:\projects\PEP\Master\fu306face.sas7bdat"
* Keep relevant variables (covariates)
keep studyID age_306 female white edu_cont agecat306 BMI_306 highbp mi chf stroke Cancer diabetes hipfx arthrit lung_d hbp_306 mi_306 chf_306 strok_306 cancr_306 diab_306 hipfx_306 lungd_306 arth_306 ccsum306a ccsum306b ccsum306c d_4adl306 d_7adl306 d_3adl306 hp3adl306 walkd_306 hpwalk306 dswalk306 hpstir306 dsstir306 hpcary306 dscary306 hpshop306 dsshop306 hpclen306 dsclen306 hpmeal306 dsmeal306 hpmeds306 dsmeds306 hpbill306 dsbill306 iadlhp306 iadlds306 hp_mob306 ds_mob306 bloc_c306 blocks306 adl24_306 adl12ms badl14306 iadl10306 mobdis306 intdate306
* Rename variables to ensure consistency across intervals
rename BMI_306 BMI_bl
rename agecat306 age5cat
rename age_306 age_b
rename ccsum306a ccsumbl1
rename ccsum306c ccsumbl2
rename Cancer cancer
rename d_4adl306 diff4adl 
rename d_7adl306 diff7adl
rename d_3adl306 diff3adl 
rename hp3adl306 dep3adl 
rename walkd_306 walk_dev
rename hpwalk306 hp_walk
rename dswalk306 ds_walk
rename hpstir306 hp_stair
rename dsstir306 ds_stair
rename hpcary306 hp_carry
rename dscary306 ds_carry
rename hpshop306 hp_shop
rename dsshop306 ds_shop 
rename hpclen306 hp_clean
rename dsclen306 ds_clean
rename hpmeal306 hp_meal
rename dsmeal306 ds_meal
rename hpmeds306 hp_meds
rename dsmeds306 ds_meds
rename hpbill306 hp_bills
rename dsbill306 ds_bills
rename iadlhp306 iadl_dep
rename iadlds306 iadl_dis
rename hp_mob306 hp_mobil
rename ds_mob306 ds_mobil
rename bloc_c306 bloc_cat
rename blocks306 blocksbl
rename adl24_306 adl24_bl
rename badl14306 badl14bl
rename iadl10306 iadl10bl
rename mobdis306 mobdisbl
rename * raw_*
* Generate a new variable called interval and assign the number 18 to each observation
gen interval = 18
* Rename raw_studyID variable to ensure consistency with updated master dataset
rename raw_studyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save 306-month follow-up dataset with a new name
save other_vrb18.dta
clear

* Append follow-up comprehensive assessment datasets to baseline dataset
use other_vrb1.dta
append using other_vrb2.dta
append using other_vrb3.dta
append using other_vrb4.dta
append using other_vrb5.dta
append using other_vrb6.dta
append using other_vrb7.dta
append using other_vrb9.dta
append using other_vrb10.dta
append using other_vrb11.dta
append using other_vrb12.dta
append using other_vrb13.dta
append using other_vrb14.dta
append using other_vrb15.dta
append using other_vrb16.dta
append using other_vrb17.dta
append using other_vrb18.dta
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save dataset with a new name
save raw_other.dta
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5525 observations
clear 

* Use updated master dataset
use f2f.dta
* Merge updated master dataset with combined comprehensive assessment dataset
merge 1:1 STUDYID interval using raw_other.dta, generate(merge_rawother)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_rawother,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Overwrite dataset, by replacing the previously saved file
save f2f.dta, replace
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear

* Import raw baseline data
import sas using "P:\projects\PEP\Master\pepbase.sas7bdat"
* Keep relevant variables (covariates)
keep STUDYID GDI9 PF1 PF2 PF3 PF4 PF5A PF5B PF5C PF5D PF6A PF6B PF7A PF7B PF8A PF8B PF9A PF9B PF10A PF10B PF11A PF11B PF12A PF12B PF13A PF13B PF14A PF14B PF15A PF15B PF16A PF16B PF17 CC1A CC1B CC2 CC3 CC4A CC4B1 CC4B2 CC4B3 CC4B4 CC5 CC6A CC6B CC6C CC7 CC8A CC8B1 CC8B2 CC8B3 CC8B4 CC9A CC9B1 CC9B2 CC9B3 CC9B4 CC9B5 CC10 CC11A CC11B CC11C CC12 CC13A CC13B CC14
* Rename variables to ensure consistency across intervals
rename GDI9 pf18
rename PF1 pf1b
rename PF2 pf2b
rename PF3 pf3b
rename PF4 pf4b
rename PF5A pf5a
rename PF5B pf5b
rename PF5C pf5c 
rename PF5D pf5d 
rename PF6A pf6a
rename PF6B pf6b
rename PF7A pf7a
rename PF7B pf7b
rename PF8A pf8a 
rename PF8B pf8b
rename PF9A pf9a 
rename PF9B pf9b 
rename PF10A pf10a
rename PF10B pf10b 
rename PF11A pf11a 
rename PF11B pf11b 
rename PF12A pf12a 
rename PF12B pf12b 
rename PF13A pf13a 
rename PF13B pf13b 
rename PF14A pf14a 
rename PF14B pf14b 
rename PF15A pf15a 
rename PF15B pf15b 
rename PF16A pf16a 
rename PF16B pf16b 
rename PF17 pf17
rename CC1A cc1a 
rename CC1B cc1b 
rename CC2 cc2
rename CC3 cc3 
rename CC4A cc4a 
rename CC4B1 cc4b1 
rename CC4B2 cc4b2
rename CC4B3 cc4b3
rename CC4B4 cc4b4
rename CC5 cc5
rename CC6A cc6a
rename CC6B cc6b
rename CC6C cc6c
rename CC7 cc7
rename CC9A cc8a 
rename CC9B1 cc8b1 
rename CC9B2 cc8b2 
rename CC9B3 cc8b3
rename CC9B4 cc8b4 
rename CC9B5 cc8b5 
rename CC13A cc9a
rename CC13B cc9b 
rename * mfu_*
* Generate a new variable called interval and assign the number 1 to each observation
gen interval = 1
* Rename mfu_STUDYID variable to ensure consistency with updated master dataset
rename mfu_STUDYID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw baseline dataset with a new name
save other_mfu1.dta
clear

* Import raw 18-month follow-up data
import sas using "P:\projects\PEP\sasdata\face18m.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID pf1a pf1b pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b pf17 pf18 cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b cc10a cc10b cc11
* Rename variables to ensure consistency across intervals
rename * mfu_*
* Generate a new variable called interval and assign the number 2 to each observation
gen interval = 2
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 18-month follow-up dataset with a new name
save other_mfu2.dta
clear

* Import raw 36-month follow-up data
import sas using "P:\projects\PEP\sasdata\face36mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1 bath2a bath3 pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b pf17 cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b cc10a cc10b cc11
* Rename variables to ensure consistency across intervals
rename bath3 bath3g 
rename bath2a bath3 
rename bath1 bath2a 
rename * mfu_*
* Generate a new variable called interval and assign the number 3 to each observation
gen interval = 3
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 36-month follow-up dataset with a new name
save other_mfu3.dta
clear

* Import raw 54-month follow-up data
import sas using "P:\projects\PEP\sasdata\face54mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf2e pf3a pf3b pf3e pf4a pf4b pf4e pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf12e pf13a pf13b pf13e pf14a pf14b pf14e pf15a pf15b pf15e pf16a pf16b pf16c pf16d pf16e cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename pf2b pf2help3m
rename pf3b pf3help3m
rename pf4b pf4help3m
rename pf2e pf2e4
rename pf3e pf3e4 
rename pf4e pf4e4
rename pf12e pf12e4
rename pf13e pf13e4
rename pf14e pf14e4
rename pf15e pf15e4
rename pf16e pf16e4
rename * mfu_*
* Generate a new variable called interval and assign the number 4 to each observation
gen interval = 4
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 54-month follow-up dataset with a new name
save other_mfu4.dta
clear

* Import raw 72-month follow-up data
import sas using "P:\projects\PEP\sasdata\face72mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3g pf2a pf2b pf2f pf3a pf3b pf3f pf4a pf4b pf4f pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename pf2b pf2help1m
rename pf3b pf3help1m
rename pf4b pf4help1m
rename * mfu_*
* Generate a new variable called interval and assign the number 5 to each observation
gen interval = 5
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 72-month follow-up dataset with a new name
save other_mfu5.dta
clear

* Import raw 90-month follow-up data
import sas using "P:\projects\PEP\sasdata\face90mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3g pf2a pf2b pf2f pf3a pf3b pf3f pf4a pf4b pf4f pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename pf2b pf2help12m
rename pf3b pf3help12m
rename pf4b pf4help12m
rename * mfu_*
* Generate a new variable called interval and assign the number 6 to each observation
gen interval = 6
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 90-month follow-up dataset with a new name
save other_mfu6.dta
clear

* Import raw 108-month follow-up data
import sas using "P:\projects\PEP\sasdata\face108mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 7 to each observation
gen interval = 7
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 108-month follow-up dataset with a new name
save other_mfu7.dta
clear

* Import raw 144-month follow-up data
import sas using "P:\projects\PEP\sasdata\face144mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 9 to each observation
gen interval = 9
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 144-month follow-up dataset with a new name
save other_mfu9.dta
clear

* Import raw 162-month follow-up data
import sas using "P:\projects\PEP\sasdata\face162mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 10 to each observation
gen interval = 10
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 162-month follow-up dataset with a new name
save other_mfu10.dta
clear

* Import raw 180-month follow-up data
import sas using "P:\projects\PEP\sasdata\face180mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 11 to each observation
gen interval = 11
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 180-month follow-up dataset with a new name
save other_mfu11.dta
clear

* Import raw 198-month follow-up data
import sas using "P:\projects\PEP\sasdata\face198mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 12 to each observation
gen interval = 12
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 198-month follow-up dataset with a new name
save other_mfu12.dta
clear

* Import raw 216-month follow-up data
import sas using "P:\projects\PEP\sasdata\face216mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 13 to each observation
gen interval = 13
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 216-month follow-up dataset with a new name
save other_mfu13.dta
clear

* Import raw 234-month follow-up data
import sas using "P:\projects\PEP\sasdata\face234mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 14 to each observation
gen interval = 14
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 234-month follow-up dataset with a new name
save other_mfu14.dta
clear

* Import raw 252-month follow-up data
import sas using "P:\projects\PEP\sasdata\face252mfu.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 15 to each observation
gen interval = 15
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 252-month follow-up dataset with a new name
save other_mfu15.dta
clear

* Import raw 270-month follow-up data
import sas using "P:\projects\PEP\sasdata\face270mfu_amend_wrc.sas7bdat"
* Keep relevant variables (covariates)
keep StudyID bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 16 to each observation
gen interval = 16
* Rename mfu_StudyID variable to ensure consistency with updated master dataset
rename mfu_StudyID STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 270-month follow-up dataset with a new name
save other_mfu16.dta
clear

* Import raw 288-month follow-up data
import sas using "P:\projects\PEP\sasdata\face288mfu.sas7bdat"
* Keep relevant variables (covariates)
keep studyid bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 17 to each observation
gen interval = 17
* Rename mfu_studyid variable to ensure consistency with updated master dataset
rename mfu_studyid STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 288-month follow-up dataset with a new name
save other_mfu17.dta
clear

* Import raw 306-month follow-up data
import sas using "P:\projects\PEP\sasdata\face306mfu.sas7bdat"
* Keep relevant variables (covariates)
keep studyid bath1a bath2a bath3c pf2a pf2b pf3a pf3b pf4a pf4b pf5a pf5b pf5c pf5d pf6a pf6b pf7a pf7b pf8a pf8b pf9a pf9b pf10a pf10b pf11a pf11b pf12a pf12b pf13a pf13b pf14a pf14b pf15a pf15b pf16a pf16b cc1a cc1b cc2 cc3 cc4a cc4b1 cc4b2 cc4b3 cc4b4 cc5 cc6a cc6b cc6c cc7 cc8a cc8b1 cc8b2 cc8b3 cc8b4 cc8b5 cc9a cc9b
* Rename variables to ensure consistency across intervals
rename bath2a bath3
rename bath1a bath2a
rename bath3c bath3g
rename * mfu_*
* Generate a new variable called interval and assign the number 18 to each observation
gen interval = 18
* Rename mfu_studyid variable to ensure consistency with updated master dataset
rename mfu_studyid STUDYID
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw 306-month follow-up dataset with a new name
save other_mfu18.dta
clear

* Append raw follow-up comprehensive assessment datasets to raw baseline dataset
use other_mfu1.dta
append using other_mfu2.dta
append using other_mfu3.dta
append using other_mfu4.dta
append using other_mfu5.dta
append using other_mfu6.dta
append using other_mfu7.dta
append using other_mfu9.dta
append using other_mfu10.dta
append using other_mfu11.dta
append using other_mfu12.dta
append using other_mfu13.dta
append using other_mfu14.dta
append using other_mfu15.dta
append using other_mfu16.dta
append using other_mfu17.dta
append using other_mfu18.dta
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save dataset with a new name
save mfu_other.dta
* Count total number of participants and observations
unique STUDYID
* 848 individuals, 5201 observations
clear 

* Use updated master dataset
use f2f.dta
* Merge updated master dataset with combined raw comprehensive assessment dataset
merge 1:1 STUDYID interval using mfu_other.dta, generate(merge_mfuother)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_mfuother,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Overwrite dataset, by replacing the previously saved file
save f2f.dta, replace
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear

* Import raw baseline data
import sas using "P:\projects\PEP\Master\pepbase.sas7bdat"
* Keep relevant variables (self-reported date of birth)
keep STUDYID GDI4MO GDI4DY GDI4YR
* Generate a new variable called interval and assign the number 1 to each observation
gen interval = 1
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save raw baseline dataset with a new name
save birthmfu.dta
clear

* Use updated master dataset
use f2f.dta
* Merge updated master dataset with raw baseline dataset
merge 1:1 STUDYID interval using birthmfu.dta, generate(merge_mfubdate)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_mfubdate,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Overwrite dataset, by replacing the previously saved file
save f2f.dta, replace
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear

* Import corrected date of birth data
import sas using "P:\projects\PEP\sasdata\subjects_080521_dobfix.sas7bdat"
* Keep relevant variables (correct date of birth)
keep StudyID BDate DDate bdate_ss 
* Rename variables to ensure consistency across intervals
rename StudyID STUDYID
rename BDate BDates
rename DDate DDates
rename bdate_ss bdates_ss
* Count total number of participants and observations
unique STUDYID 
* 754 individuals
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save corrected date of birth dataset with a new name
save dobfix.dta
clear

* Use updated master dataset
use f2f.dta
* Merge updated master dataset with corrected date of birth dataset
merge m:1 STUDYID using dobfix.dta, generate(merge_dobfix)
* Keep if matched
keep if merge_dobfix==3
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Save dataset with a new name
save comprehensive.dta
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
clear 

* Use updated master dataset
use comprehensive.dta 

* Intrinsic capacity indicators
* Cognitive
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\baseface_3.sas"
replace mmse9 = 1 if STUDYID==3102 & interval==1
replace mmse14 = 8 if STUDYID==162 & interval==1
replace mmse15 = 8 if STUDYID==162 & interval==1
replace mmse14 = 8 if STUDYID==1884 & interval==1
replace mmse15 = 8 if STUDYID==1884 & interval==1
* All items contributing to the scores for the orientation, attention and spelling, recall, and language tests were coded as 0 (error/unable/refusal/don't know) versus 1 (correct)
recode mmse1 mmse2 mmse3 mmse4 mmse5 mmse6 mmse7 mmse8 mmse9 mmse10 mmse11 mmse12 mmse13 mmse14 mmse15 mmse16 mmse17 mmse18 mmse19 mmse20 mmse21 mmse22 mmse23 mmse24 mmse25 mmse26 mmse27 mmse28 mmse29 mmse30 (2=0) (7=0) (8=0) (6=0)

** Orientation
* Sum items
gen orientation = mmse1 + mmse2 + mmse3 + mmse4 + mmse5 + mmse6 + mmse7 + mmse8 + mmse9 + mmse10
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab orientation if STUDYID==696
tab orientation if STUDYID==1402 & interval==2
replace orientation = 0 if STUDYID==1402 & interval==2
tab orientation if STUDYID==3027 & interval==3
replace orientation = 0 if STUDYID==3027 & interval==3
tab orientation if STUDYID==3027 & interval==4
replace orientation = 0 if STUDYID==3027 & interval==4
tab orientation if STUDYID==2962 & interval==4
tab orientation if STUDYID==2320 & interval==6
replace orientation = . if STUDYID==2320 & interval==6

** Registration (omitted)
* Sum items
gen registration = mmse11 + mmse12 + mmse13
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab registration if STUDYID==696
tab registration if STUDYID==1402 & interval==2
replace registration = 0 if STUDYID==1402 & interval==2
tab registration if STUDYID==3027 & interval==3
replace registration = 0 if STUDYID==3027 & interval==3
tab registration if STUDYID==3027 & interval==4
replace registration = 0 if STUDYID==3027 & interval==4
tab registration if STUDYID==2962 & interval==4
tab registration if STUDYID==2320 & interval==6
replace registration = . if STUDYID==2320 & interval==6

** Attention and spelling
* Sum items
gen att_spell = mmse14 + mmse15 + mmse16 + mmse17 + mmse18
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab att_spell if STUDYID==696
tab att_spell if STUDYID==1402 & interval==2
replace att_spell = 0 if STUDYID==1402 & interval==2
tab att_spell if STUDYID==3027 & interval==3
replace att_spell = 0 if STUDYID==3027 & interval==3
tab att_spell if STUDYID==3027 & interval==4
replace att_spell = 0 if STUDYID==3027 & interval==4
tab att_spell if STUDYID==2962 & interval==4
tab att_spell if STUDYID==2320 & interval==6
replace att_spell = . if STUDYID==2320 & interval==6

** Recall
* Sum items
gen rec = mmse19 + mmse20 + mmse21
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab rec if STUDYID==696
tab rec if STUDYID==1402 & interval==2
replace rec = 0 if STUDYID==1402 & interval==2
tab rec if STUDYID==3027 & interval==3
replace rec = 0 if STUDYID==3027 & interval==3
tab rec if STUDYID==3027 & interval==4
replace rec = 0 if STUDYID==3027 & interval==4
tab rec if STUDYID==2962 & interval==4
tab rec if STUDYID==2320 & interval==6
replace rec = . if STUDYID==2320 & interval==6

** Language
* Sum items
gen language = mmse22 + mmse23 + mmse24 + mmse25 + mmse26 + mmse27 + mmse28 + mmse29
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab language if STUDYID==696
tab language if STUDYID==1402 & interval==2
replace language = 0 if STUDYID==1402 & interval==2
tab language if STUDYID==3027 & interval==3
replace language = 0 if STUDYID==3027 & interval==3
tab language if STUDYID==3027 & interval==4
replace language = 0 if STUDYID==3027 & interval==4
tab language if STUDYID==2962 & interval==4
tab language if STUDYID==2320 & interval==6
replace language = . if STUDYID==2320 & interval==6

** Visuospatial skills
gen visuospatial = mmse30
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu36face_3.sas", "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas"
tab visuospatial if STUDYID==696
tab visuospatial if STUDYID==1402 & interval==2
replace visuospatial = 0 if STUDYID==1402 & interval==2
tab visuospatial if STUDYID==3027 & interval==3
replace visuospatial = 0 if STUDYID==3027 & interval==3
tab visuospatial if STUDYID==3027 & interval==4
replace visuospatial = 0 if STUDYID==3027 & interval==4
tab visuospatial if STUDYID==2962 & interval==4
tab visuospatial if STUDYID==2320 & interval==6
replace visuospatial = . if STUDYID==2320 & interval==6

* Sensory
** Near vision
tab vis3cat_raw
* Hard code documented in "P:\projects\PEP\sas\FACE Master pgm\baseface_3.sas"
replace vt1c = 3 if STUDYID==1230 & interval==1
gen visp = 100 if vt1c==0
replace visp = 0 if inlist(vt1c,3,4)
replace visp = 5 if vt1c==5
replace visp = 10 if vt1c==6
replace visp = 50 if vt1c==8
replace visp = 60 if vt1c==10
replace visp = 95 if vt1c==14
replace visp = 98 if vt1c==26
* % impairment collapsed into terciles
gen vis3 = 0 if inlist(visp,0,5)
replace vis3 = 1 if visp==10
replace vis3 = 2 if visp>10 & visp!=.
* Hard codes documented in "P:\projects\PEP\Evelyne\Analysis\fu306face_3.sas"
replace vis3 = 2 if STUDYID==275 & interval==18
replace vis3 = 0 if STUDYID==853 & interval==18

** Hearing (Audioscope)
tab hear3cat_raw
* Number of tones missed (out of four) across 1000 and 2000 Hz measurements for the left and right ears
* Each tone (1000 Hz right ear; 2000 Hz right ear; 1000 Hz left ear; and 2000 Hz left ear) was considered missed if the participant did not indicate that a tone was heard ("Incorrect"), the tone was coded as "Rule out", or the corresponding test was refused
gen hears2 = 0 if hea3b==1 & hea3c==1 & hea4b==1 & hea4c==1
replace hears2 = 1 if hea3b==2 & hea3c==1 & hea4b==1 & hea4c==1
replace hears2 = 1 if hea3b==1 & hea3c==2 & hea4b==1 & hea4c==1
replace hears2 = 1 if hea3b==1 & hea3c==1 & hea4b==2 & hea4c==1
replace hears2 = 1 if hea3b==1 & hea3c==1 & hea4b==1 & hea4c==2
replace hears2 = 1 if inlist(hea3b,2,6,7) & hea3c==1 & hea4b==1 & hea4c==1
replace hears2 = 1 if hea3b==1 & inlist(hea3c,2,6,7) & hea4b==1 & hea4c==1
replace hears2 = 1 if hea3b==1 & hea3c==1 & inlist(hea4b,2,6,7) & hea4c==1
replace hears2 = 1 if hea3b==1 & hea3c==1 & hea4b==1 & inlist(hea4c,2,6,7)
replace hears2 = 2 if hea3b==2 & hea3c==2 & hea4b==1 & hea4c==1
replace hears2 = 2 if hea3b==2 & hea3c==1 & hea4b==2 & hea4c==1
replace hears2 = 2 if hea3b==2 & hea3c==1 & hea4b==1 & hea4c==2
replace hears2 = 2 if hea3b==1 & hea3c==2 & hea4b==2 & hea4c==1
replace hears2 = 2 if hea3b==1 & hea3c==2 & hea4b==1 & hea4c==2
replace hears2 = 2 if hea3b==1 & hea3c==1 & hea4b==2 & hea4c==2
replace hears2 = 2 if inlist(hea3b,2,6,7) & inlist(hea3c,2,6,7) & hea4b==1 & hea4c==1
replace hears2 = 2 if inlist(hea3b,2,6,7) & hea3c==1 & inlist(hea4b,2,6,7) & hea4c==1
replace hears2 = 2 if inlist(hea3b,2,6,7) & hea3c==1 & hea4b==1 & inlist(hea4c,2,6,7)
replace hears2 = 2 if hea3b==1 & inlist(hea3c,2,6,7) & inlist(hea4b,2,6,7) & hea4c==1
replace hears2 = 2 if hea3b==1 & inlist(hea3c,2,6,7) & hea4b==1 & inlist(hea4c,2,6,7)
replace hears2 = 2 if hea3b==1 & hea3c==1 & inlist(hea4b,2,6,7) & inlist(hea4c,2,6,7)
replace hears2 = 3 if hea3b==1 & hea3c==2 & hea4b==2 & hea4c==2
replace hears2 = 3 if hea3b==2 & hea3c==1 & hea4b==2 & hea4c==2
replace hears2 = 3 if hea3b==2 & hea3c==2 & hea4b==1 & hea4c==2
replace hears2 = 3 if hea3b==2 & hea3c==2 & hea4b==2 & hea4c==1
replace hears2 = 3 if hea3b==1 & inlist(hea3c,2,6,7) & inlist(hea4b,2,6,7) & inlist(hea4c,2,6,7)
replace hears2 = 3 if inlist(hea3b,2,6,7) & hea3c==1 & inlist(hea4b,2,6,7) & inlist(hea4c,2,6,7)
replace hears2 = 3 if inlist(hea3b,2,6,7) & inlist(hea3c,2,6,7) & hea4b==1 & inlist(hea4c,2,6,7)
replace hears2 = 3 if inlist(hea3b,2,6,7) & inlist(hea3c,2,6,7) & inlist(hea4b,2,6,7) & hea4c==1
replace hears2 = 4 if hea3b==2 & hea3c==2 & hea4b==2 & hea4c==2
replace hears2 = 4 if inlist(hea3b,6,7) & inlist(hea3c,6,7) & inlist(hea4b,6,7) & inlist(hea4c,6,7)
replace hears2 = 4 if inlist(hea3b,2,6,7) & inlist(hea3c,2,6,7) & inlist(hea4b,2,6,7) & inlist(hea4c,2,6,7)
* Collapsed into three categories
gen hear3 = 0 if inlist(hears2,0,1)
replace hear3 = 1 if inlist(hears2,2,3)
replace hear3 = 2 if hears2==4
* Hard codes documented in "P:\projects\PEP\Evelyne\Analysis\fu306face_3.sas"
replace hear3 = 2 if STUDYID==155 & interval==18
replace hear3 = 2 if STUDYID==275 & interval==18
replace hear3 = 0 if STUDYID==853 & interval==18

** Hearing (self-reported)
* Rated as "excellent", "very good", "good", "fair", or "poor"
gen hear_sr = hea2
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace hear_sr = . if inlist(hear_sr,7,8)

* Locomotive
** Gait speed
gen walk1n = walk1
* Time (in seconds) to complete the test was prorated for participants who walked less than 20 feet
replace walk1n = walk1n * ((2000/19)/100) if walk8==19
replace walk1n = walk1n * ((2000/18)/100) if walk8==18
replace walk1n = walk1n * ((2000/16)/100) if walk8==16
replace walk1n = walk1n * ((2000/13)/100) if walk8==13
replace walk1n = walk1n * ((2000/10)/100) if walk8==10
replace walk1n = walk1n * ((2000/8)/100) if walk8==8
* Times above 90 seconds or coded as "Unable" were collapsed to 90 prior to log-transformation
replace walk1n = 90 if walk1n > 90 & walk1n < 997
* Observations coded as "Refused" were treated as missing cases
replace walk1n = . if walk1n==997
* Round times to one decimal place
replace walk1n = round(walk1n,0.1)
* Compare values (in terms of precision) with variable from combined comprehensive assessment dataset
gen waminus = walk1raw - walk1n
replace waminus = round(waminus,0.1)
replace walk1n = walk1raw if waminus==0
* Round times to one decimal place
replace walk1n = round(walk1n,0.1)

** Timed chair stands
gen tcs = timedcsrp
* Times above 30 seconds or coded as "Unable" or "Not applicable" (the latter due to participants being unable to complete the single chair stand test) were collapsed to 30 prior to log-transformation, as were observations where participants completed less than three chair stands
replace tcs = 30 if inlist(timedcsnoc,1,2) | inlist(timedcsrp,996,999) | (timedcsrp > 30 & timedcsrp!=.) | chairstand==6
* Observations coded as "Refused" (or where participants had refused to complete the single chair stand test) were treated as missing cases
replace tcs = . if timedcsrp==997 | chairstand==7
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas", and "P:\projects\PEP\Evelyne\Analysis\Final\timedperf_306.sas"
replace tcs = 30 if STUDYID==853 & interval==18
replace tcs = 30 if STUDYID==2626 & interval==2
* Compare values (in terms of precision) with variable from combined comprehensive assessment dataset
gen chminus = tcs - time_chairraw
replace tcs = time_chairraw if chminus>0 & chminus!=.
gen chminus2 = tcs - time_chairraw
gen tcs2 = tcs
* As part of a new variable, round times to one decimal place
replace tcs2 = round(tcs2,0.1)

** Balance
* Did not hold the side-by-side stand for 10 seconds (including observations coded as "Unable", "Refusal", and "Not attempted")
gen balance_new = 0 if sidebyside!=10 & sidebyside!=.
* Held the side-by-side stand for 10 seconds and did not hold the semi-tandem stand for 10 seconds
replace balance_new = 1 if sidebyside==10 & semitandem!=10
* Held the semi-tandem stand for 10 seconds and did not hold the tandem stand for ≥ 3 seconds
replace balance_new = 2 if semitandem==10 & ! inlist(tandem,3,4,5,6,7,8,9,10)
* Held the tandem stand for ≥ 3 seconds and < 10 seconds
replace balance_new = 3 if tandem>=3 & tandem<10
* Held the tandem stand for 10 seconds
replace balance_new = 4 if tandem==10
* The composite balance score was recoded as missing if both the side-by-side and semi-tandem stand tests were refused
replace balance_new = . if semitandem==97 & sidebyside==97

* Vitality
** Handgrip strength
tab gripkg1raw
gen gs1 = gs21
* Tries coded as "Unable" were assigned a handgrip strength of 0 kg
replace gs1 = 0 if gs1==96
* Observations coded as "Refused" were treated as missing cases
replace gs1 = . if inlist(gs1,95,97)
tab gripkg2raw
gen gs2 = gs22
* Tries coded as "Unable" were assigned a handgrip strength of 0 kg
replace gs2 = 0 if gs2==96
* Observations coded as "Refused" or "Not applicable" were treated as missing cases
replace gs2 = . if inlist(gs2,95,97,99)
tab gripkg3raw
gen gs3 = gs23
* Tries coded as "Unable" were assigned a handgrip strength of 0 kg
replace gs3 = 0 if gs3==96
* Observations coded as "Refused" or "Not applicable" were treated as missing cases
replace gs3 = . if inlist(gs3,95,97,99)
* Mean of three tries (only among participants with three valid handgrip strength values)
gen avg_grip_nomiss = (gs1 + gs2 + gs3)/3

** Peak expiratory flow rate
gen pf1 = pefr1
* Readings coded as "Tried, unable" were assigned a peak expiratory flow rate of 30 liter/min
replace pf1 = 30 if pf1==996
* Observations coded as "Meter not working", "Refused", "Not done for safety reasons", or "Not applicable" were treated as missing cases
replace pf1 = . if inlist(pf1,995,997,998,999)
gen pf2 = pefr2
* Readings coded as "Tried, unable" were assigned a peak expiratory flow rate of 30 liter/min
replace pf2 = 30 if pf2==996
* Observations coded as "Meter not working", "Refused", "Not done for safety reasons", or "Not applicable" were treated as missing cases
replace pf2 = . if inlist(pf2,995,997,998,999)
gen pf3 = pefr3
* Readings coded as "Tried, unable" were assigned a peak expiratory flow rate of 30 liter/min
replace pf3 = 30 if pf3==996
* Observations coded as "Meter not working", "Refused", "Not done for safety reasons", or "Not applicable" were treated as missing cases
replace pf3 = . if inlist(pf3,995,997,998,999)
* Highest measure among participants' available readings (minimum of one and maximum of three attempts)
egen max_pef_miss = rowmax(pf1 pf2 pf3)
* Peak expiratory flow rate measures had been coded as missing for the entire cohort at the 288-month follow-up assessment, as no participants had three available readings, as documented in "P:\projects\PEP\Evelyne\Analysis\fu288face_3.sas", even though the "pefr_max_raw" variable (labeled "highest value of three tests") in the combined comprehensive assessment dataset included values for participants with fewer than three readings at all other follow-up assessments
* The 288-month follow-up data was therefore treated/recoded in accordance with the other intervals as follows:
replace max_pef_miss = . if STUDYID==224 & interval==17
replace max_pef_miss = 30 if STUDYID==302 & interval==17

** Weight loss
tab fc1_wtlsraw
gen wloss = wt1b if wt1b!=. & !inlist(wt1b,7,8)
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\pep_frailty_18.sas", "P:\projects\PEP\sas\FACE Master pgm\pep_frailty_36.sas", "P:\projects\PEP\sas\FACE Master pgm\pep_frailty_54.sas", "P:\projects\PEP\sas\FACE Master pgm\pep_frailty_72.sas", and "P:\projects\PEP\sas\FACE Master pgm\pep_frailty_108.sas"
replace wloss = 1 if inlist(STUDYID,184,2578,2621,3102,1018,1470) & interval==2
replace wloss = 2 if inlist(STUDYID,1687,2798,3083) & interval==2
replace wloss = 1 if inlist(STUDYID,2249,2760) & interval==3
replace wloss = 2 if inlist(STUDYID,1646,2422,2621) & interval==3
replace wloss = 1 if STUDYID==291 & interval==4
replace wloss = 2 if inlist(STUDYID,750,812,2225,2760,2946) & interval==4
replace wloss = 2 if inlist(STUDYID,1233,1576) & interval==5
replace wloss = 2 if STUDYID==221 & interval==7
* Recode as 0 if participants answered "No" to the question "In the past year, have you lost more than 10 pounds?"
replace wloss = 0 if wloss==2

* Psychological
* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\fu54face_3.sas"
replace ds1 = 1.5 if STUDYID==2946 & interval==4
replace ds5 = 1.5 if STUDYID==2946 & interval==4
replace ds8 = 1.5 if STUDYID==2946 & interval==4
* Reverse depression item 5 and item 8
gen _ds5 = 4-ds5 
replace _ds5 = 7 if _ds5==-3
replace _ds5 = 8 if _ds5==-4
gen _ds8 = 4-ds8
replace _ds8 = 7 if _ds8==-3
replace _ds8 = 8 if _ds8==-4
* Items were recoded from a 1-3 scale to a 0-2 scale
recode ds1 ds2 ds3 ds4 _ds5 ds6 ds7 _ds8 ds9 ds10 ds11 (1=0) (1.5=0.5) (2=1) (2.5=1.5) (3=2)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
recode ds1 ds2 ds3 ds4 _ds5 ds6 ds7 _ds8 ds9 ds10 ds11 (7=.) (8=.), prefix(new)

** Everything was an effort
tab newds1 

** My appetite was poor
tab newds2 

** My sleep was restless
tab newds3 

** I felt depressed 
tab newds4

** I was happy
tab new_ds5

** I felt lonely 
tab newds6

** People were unfriendly
tab newds7 

** I enjoyed life
tab new_ds8

** I felt sad
tab newds9

** People disliked me
tab newds10

** I could not get "going"
tab newds11

* Overwrite dataset, by replacing the previously saved file
save comprehensive.dta, replace

* Covariates
** Age (years)
gen age_fix = floor((intdateF2F-BDates) / 365.25)
gen age_fix_dec = ((intdateF2F-BDates) / 365.25)

** Biological sex (time-constant)
* Generate a new variable duplicating the gender_p variable at baseline
gen sex_cons = gender_p if interval==1
* Declare a panel dataset with participant ID "STUDYID" and time variable "interval"
tsset STUDYID interval 
* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
bysort STUDYID: carryforward sex_cons, replace
* Code "male" as 0
replace sex_cons = 0 if sex_cons==1
* Code "female" as 1
replace sex_cons = 1 if sex_cons==2

** Race (time-constant)
* Generate a new variable duplicating the race_p variable at baseline
gen eth_cons = race_p if interval==1
* Declare a panel dataset with participant ID "STUDYID" and time variable "interval"
tsset STUDYID interval 
* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
bysort STUDYID: carryforward eth_cons, replace
* Code "White" as 0
gen eth_bi = 0 if eth_cons==1
* Code "non-White" as 1
replace eth_bi = 1 if inlist(eth_cons,2,3,5)

** Education (time-constant)
* Generate a new variable duplicating the education_p variable at baseline
gen edu_cons = education_p if interval==1
* Declare a panel dataset with participant ID "STUDYID" and time variable "interval"
tsset STUDYID interval 
* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
bysort STUDYID: carryforward edu_cons, replace 

** Number of chronic conditions
*** Hypertension
* Code as 1 if the participant has been told by a doctor that they have high blood pressure or hypertension and the participant is currently taking any medicine for high blood pressure
gen highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1
* Code as 0 otherwise
replace highbl = 0 if highbl!=1
* Code as 0 if the participant responds "Don't know" to the question about having high blood pressure or the question about taking medicine for high blood pressure
replace highbl = 0 if mfu_cc1a==8 | mfu_cc1b==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having high blood pressure or the question about taking medicine for high blood pressure
replace highbl = . if inlist(mfu_cc1a,.,7) | mfu_cc1b==7
* Code as missing if the comprehensive assessment is not at baseline or 18-month follow-up (i.e., intervals 1-2)
replace highbl = . if ! inlist(interval,1,2)

* Carryforward observations (high blood pressure and on medication at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen hbp18_cons = raw_hbp_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward hbp18_cons, replace
gen hbp36_cons = raw_hbp_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward hbp36_cons, replace
gen hbp54_cons = raw_hbp_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward hbp54_cons, replace
gen hbp72_cons = raw_hbp_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward hbp72_cons, replace
gen hbp90_cons = raw_hbp_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward hbp90_cons, replace
gen hbp108_cons = raw_hbp_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward hbp108_cons, replace
gen hbp144_cons = raw_hbp_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward hbp144_cons, replace
gen hbp162_cons = raw_hbp_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward hbp162_cons, replace
gen hbp180_cons = raw_hbp_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward hbp180_cons, replace
gen hbp198_cons = raw_hbp_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward hbp198_cons, replace
gen hbp216_cons = raw_hbp_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward hbp216_cons, replace
gen hbp234_cons = raw_hbp_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward hbp234_cons, replace
gen hbp252_cons = raw_hbp_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward hbp252_cons, replace
gen hbp270_cons = raw_hbp_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward hbp270_cons, replace
gen hbp288_cons = raw_hbp_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward hbp288_cons, replace

* For intervals 3-18, code as 1 if the participant has been told by a doctor that they have high blood pressure or hypertension and the participant is currently taking any medicine for high blood pressure, and the participant was coded as NOT having hypertension at all prior comprehensive assessments (i.e., new condition)
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp18_cons==0 & interval==3
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp36_cons==0 & interval==4
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp54_cons==0 & interval==5
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp72_cons==0 & interval==6
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp90_cons==0 & interval==7
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp108_cons==0 & interval==9
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp144_cons==0 & interval==10
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp162_cons==0 & interval==11
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp180_cons==0 & interval==12
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp198_cons==0 & interval==13
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp216_cons==0 & interval==14
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp234_cons==0 & interval==15
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp252_cons==0 & interval==16
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp270_cons==0 & interval==17
replace highbl = 1 if mfu_cc1a==1 & mfu_cc1b==1 & hbp288_cons==0 & interval==18

* Code as 0 otherwise
replace highbl = 0 if highbl!=1
* Code as 0 if the participant responds "Don't know" to the question about having high blood pressure or the question about taking medicine for high blood pressure
replace highbl = 0 if mfu_cc1a==8 | mfu_cc1b==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having high blood pressure or the question about taking medicine for high blood pressure
replace highbl = . if inlist(mfu_cc1a,.,7) | mfu_cc1b==7
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace highbl = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen bpminus = highbl - raw_highbp

* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
gen hbp_cons = raw_highbp if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward hbp_cons, replace
* For each comprehensive assessment, code as 1 if the participant was newly coded as having hypertension at the corresponding comprehensive assessment or the participant was coded as having hypertension at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen hbp18 = 1 if (highbl==1 | hbp_cons==1) & interval==2
replace hbp18 = 0 if hbp18!=1 & interval==2
gen hbp36 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1) & interval==3
replace hbp36 = 0 if hbp36!=1 & interval==3
gen hbp54 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1) & interval==4
replace hbp54 = 0 if hbp54!=1 & interval==4
gen hbp72 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1) & interval==5
replace hbp72 = 0 if hbp72!=1 & interval==5
gen hbp90 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1) & interval==6
replace hbp90 = 0 if hbp90!=1 & interval==6
gen hbp108 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1) & interval==7
replace hbp108 = 0 if hbp108!=1 & interval==7
gen hbp144 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1) & interval==9
replace hbp144 = 0 if hbp144!=1 & interval==9
gen hbp162 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1) & interval==10
replace hbp162 = 0 if hbp162!=1 & interval==10
gen hbp180 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1) & interval==11
replace hbp180 = 0 if hbp180!=1 & interval==11
gen hbp198 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1) & interval==12
replace hbp198 = 0 if hbp198!=1 & interval==12
gen hbp216 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1) & interval==13
replace hbp216 = 0 if hbp216!=1 & interval==13
gen hbp234 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1 | hbp216_cons==1) & interval==14
replace hbp234 = 0 if hbp234!=1 & interval==14
gen hbp252 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1 | hbp216_cons==1 | hbp234_cons==1) & interval==15
replace hbp252 = 0 if hbp252!=1 & interval==15
gen hbp270 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1 | hbp216_cons==1 | hbp234_cons==1 | hbp252_cons==1) & interval==16
replace hbp270 = 0 if hbp270!=1 & interval==16
gen hbp288 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1 | hbp216_cons==1 | hbp234_cons==1 | hbp252_cons==1 | hbp270_cons==1) & interval==17
replace hbp288 = 0 if hbp288!=1 & interval==17
gen hbp306 = 1 if (highbl==1 | hbp_cons==1 | hbp18_cons==1 | hbp36_cons==1 | hbp54_cons==1 | hbp72_cons==1 | hbp90_cons==1 | hbp108_cons==1 | hbp144_cons==1 | hbp162_cons==1 | hbp180_cons==1 | hbp198_cons==1 | hbp216_cons==1 | hbp234_cons==1 | hbp252_cons==1 | hbp270_cons==1 | hbp288_cons==1) & interval==18
replace hbp306 = 0 if hbp306!=1 & interval==18

*** Myocardial infarction
* Code as 1 if the participant has been told by a doctor that they had a heart attack, or coronary, or myocardial infarction, and had to be hospitalized
gen heart = 1 if mfu_cc2==1
* Code as 0 if the participant responds "Suspect or possible" or "No"
replace heart = 0 if inlist(mfu_cc2,2,3)
* Code as 0 if the participant responds "Don't know"
replace heart = 0 if mfu_cc2==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having had a myocardial infarction
replace heart = . if inlist(mfu_cc2,.,7)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace heart = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen miminus = heart - raw_mi

* Carryforward observations (myocardial infarction and hospitalization at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen mi_cons = raw_mi if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward mi_cons, replace
gen mi18_cons = raw_mi_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward mi18_cons, replace
gen mi36_cons = raw_mi_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward mi36_cons, replace
gen mi54_cons = raw_mi_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward mi54_cons, replace
gen mi72_cons = raw_mi_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward mi72_cons, replace
gen mi90_cons = raw_mi_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward mi90_cons, replace
gen mi108_cons = raw_mi_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward mi108_cons, replace
gen mi144_cons = raw_mi_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward mi144_cons, replace
gen mi162_cons = raw_mi_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward mi162_cons, replace
gen mi180_cons = raw_mi_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward mi180_cons, replace
gen mi198_cons = raw_mi_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward mi198_cons, replace
gen mi216_cons = raw_mi_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward mi216_cons, replace
gen mi234_cons = raw_mi_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward mi234_cons, replace
gen mi252_cons = raw_mi_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward mi252_cons, replace
gen mi270_cons = raw_mi_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward mi270_cons, replace
gen mi288_cons = raw_mi_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward mi288_cons, replace

* For each comprehensive assessment, code as 1 if the participant was newly coded as having had a myocardial infarction and having been hospitalized at the corresponding comprehensive assessment or the participant was coded as having had a myocardial infarction at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen mi18 = 1 if (heart==1 | mi_cons==1) & interval==2
replace mi18 = 0 if mi18!=1 & interval==2
gen mi36 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1) & interval==3
replace mi36 = 0 if mi36!=1 & interval==3
gen mi54 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1) & interval==4
replace mi54 = 0 if mi54!=1 & interval==4
gen mi72 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1) & interval==5
replace mi72 = 0 if mi72!=1 & interval==5
gen mi90 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1) & interval==6
replace mi90 = 0 if mi90!=1 & interval==6
gen mi108 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1) & interval==7
replace mi108 = 0 if mi108!=1 & interval==7
gen mi144 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1) & interval==9
replace mi144 = 0 if mi144!=1 & interval==9
gen mi162 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1) & interval==10
replace mi162 = 0 if mi162!=1 & interval==10
gen mi180 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1) & interval==11
replace mi180 = 0 if mi180!=1 & interval==11
gen mi198 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1) & interval==12
replace mi198 = 0 if mi198!=1 & interval==12
gen mi216 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1) & interval==13
replace mi216 = 0 if mi216!=1 & interval==13
gen mi234 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1 | mi216_cons==1) & interval==14
replace mi234 = 0 if mi234!=1 & interval==14
gen mi252 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1 | mi216_cons==1 | mi234_cons==1) & interval==15
replace mi252 = 0 if mi252!=1 & interval==15
gen mi270 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1 | mi216_cons==1 | mi234_cons==1 | mi252_cons==1) & interval==16
replace mi270 = 0 if mi270!=1 & interval==16
gen mi288 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1 | mi216_cons==1 | mi234_cons==1 | mi252_cons==1 | mi270_cons==1) & interval==17
replace mi288 = 0 if mi288!=1 & interval==17
gen mi306 = 1 if (heart==1 | mi_cons==1 | mi18_cons==1 | mi36_cons==1 | mi54_cons==1 | mi72_cons==1 | mi90_cons==1 | mi108_cons==1 | mi144_cons==1 | mi162_cons==1 | mi180_cons==1 | mi198_cons==1 | mi216_cons==1 | mi234_cons==1 | mi252_cons==1 | mi270_cons==1 | mi288_cons==1) & interval==18
replace mi306 = 0 if mi306!=1 & interval==18

*** Congestive heart failure
* Code as 1 if the participant has been told by a doctor that they had heart failure or congestive heart failure
gen chf = 1 if mfu_cc3==1
* Code as 0 otherwise
replace chf = 0 if chf!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having had congestive heart failure
replace chf = . if inlist(mfu_cc3,7,.)
* Code as missing if the comprehensive assessment is not at baseline or 18-month follow-up (i.e., intervals 1-2)
replace chf = . if ! inlist(interval,1,2)

* Carryforward observations (congestive heart failure at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen chf18_cons = raw_chf_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward chf18_cons, replace
gen chf36_cons = raw_chf_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward chf36_cons, replace
gen chf54_cons = raw_chf_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward chf54_cons, replace
gen chf72_cons = raw_chf_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward chf72_cons, replace
gen chf90_cons = raw_chf_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward chf90_cons, replace
gen chf108_cons = raw_chf_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward chf108_cons, replace
gen chf144_cons = raw_chf_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward chf144_cons, replace
gen chf162_cons = raw_chf_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward chf162_cons, replace
gen chf180_cons = raw_chf_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward chf180_cons, replace
gen chf198_cons = raw_chf_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward chf198_cons, replace
gen chf216_cons = raw_chf_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward chf216_cons, replace
gen chf234_cons = raw_chf_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward chf234_cons, replace
gen chf252_cons = raw_chf_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward chf252_cons, replace
gen chf270_cons = raw_chf_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward chf270_cons, replace
gen chf288_cons = raw_chf_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward chf288_cons, replace

* For intervals 3-18, code as 1 if the participant has been told by a doctor that they had heart failure or congestive heart failure, and the participant was coded as NOT having had congestive heart failure at all prior comprehensive assessments (i.e., new condition)
replace chf = 1 if mfu_cc3==1 & chf18_cons==0 & interval==3
replace chf = 1 if mfu_cc3==1 & chf36_cons==0 & interval==4
replace chf = 1 if mfu_cc3==1 & chf54_cons==0 & interval==5
replace chf = 1 if mfu_cc3==1 & chf72_cons==0 & interval==6
replace chf = 1 if mfu_cc3==1 & chf90_cons==0 & interval==7
replace chf = 1 if mfu_cc3==1 & chf108_cons==0 & interval==9
replace chf = 1 if mfu_cc3==1 & chf144_cons==0 & interval==10
replace chf = 1 if mfu_cc3==1 & chf162_cons==0 & interval==11
replace chf = 1 if mfu_cc3==1 & chf180_cons==0 & interval==12
replace chf = 1 if mfu_cc3==1 & chf198_cons==0 & interval==13
replace chf = 1 if mfu_cc3==1 & chf216_cons==0 & interval==14
replace chf = 1 if mfu_cc3==1 & chf234_cons==0 & interval==15
replace chf = 1 if mfu_cc3==1 & chf252_cons==0 & interval==16
replace chf = 1 if mfu_cc3==1 & chf270_cons==0 & interval==17
replace chf = 1 if mfu_cc3==1 & chf288_cons==0 & interval==18

* Code as 0 otherwise
replace chf = 0 if chf!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having had congestive heart failure
replace chf = . if inlist(mfu_cc3,7,.)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace chf = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen chfminus = chf - raw_chf

* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
gen chf_cons = raw_chf if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward chf_cons, replace
* For each comprehensive assessment, code as 1 if the participant was newly coded as having had congestive heart failure at the corresponding comprehensive assessment or the participant was coded as having had congestive heart failure at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen chf18 = 1 if (chf==1 | chf_cons==1) & interval==2
replace chf18 = 0 if chf18!=1 & interval==2
gen chf36 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1) & interval==3
replace chf36 = 0 if chf36!=1 & interval==3
gen chf54 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1) & interval==4
replace chf54 = 0 if chf54!=1 & interval==4
gen chf72 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1) & interval==5
replace chf72 = 0 if chf72!=1 & interval==5
gen chf90 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1) & interval==6
replace chf90 = 0 if chf90!=1 & interval==6
gen chf108 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1) & interval==7
replace chf108 = 0 if chf108!=1 & interval==7
gen chf144 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1) & interval==9
replace chf144 = 0 if chf144!=1 & interval==9
gen chf162 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1) & interval==10
replace chf162 = 0 if chf162!=1 & interval==10
gen chf180 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1) & interval==11
replace chf180 = 0 if chf180!=1 & interval==11
gen chf198 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1) & interval==12
replace chf198 = 0 if chf198!=1 & interval==12
gen chf216 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1) & interval==13
replace chf216 = 0 if chf216!=1 & interval==13
gen chf234 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1 | chf216_cons==1) & interval==14
replace chf234 = 0 if chf234!=1 & interval==14
gen chf252 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1 | chf216_cons==1 | chf234_cons==1) & interval==15
replace chf252 = 0 if chf252!=1 & interval==15
gen chf270 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1 | chf216_cons==1 | chf234_cons==1 | chf252_cons==1) & interval==16
replace chf270 = 0 if chf270!=1 & interval==16
gen chf288 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1 | chf216_cons==1 | chf234_cons==1 | chf252_cons==1 | chf270_cons==1) & interval==17
replace chf288 = 0 if chf288!=1 & interval==17
gen chf306 = 1 if (chf==1 | chf_cons==1 | chf18_cons==1 | chf36_cons==1 | chf54_cons==1 | chf72_cons==1 | chf90_cons==1 | chf108_cons==1 | chf144_cons==1 | chf162_cons==1 | chf180_cons==1 | chf198_cons==1 | chf216_cons==1 | chf234_cons==1 | chf252_cons==1 | chf270_cons==1 | chf288_cons==1) & interval==18
replace chf306 = 0 if chf306!=1 & interval==18

*** Stroke
* Code as 1 if the participant has been told by a doctor that they had a stroke or brain hemorrhage and had to be hospitalized
gen stroke = 1 if mfu_cc4a==1
* Code as 0 if the participant responds "Suspect or possible" or "No"
replace stroke = 0 if inlist(mfu_cc4a,2,3)
* Code as 0 if the participant responds "Don't know"
replace stroke = 0 if mfu_cc4a==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having had a stroke
replace stroke = . if inlist(mfu_cc4a,.,7)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace stroke = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen stminus = stroke - raw_stroke

* Carryforward observations (stroke and hospitalization at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen stroke_cons = raw_stroke if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward stroke_cons, replace
gen stroke18_cons = raw_strok_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward stroke18_cons, replace
gen stroke36_cons = raw_strok_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward stroke36_cons, replace
gen stroke54_cons = raw_strok_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward stroke54_cons, replace
gen stroke72_cons = raw_strok_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward stroke72_cons, replace
gen stroke90_cons = raw_strok_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward stroke90_cons, replace
gen stroke108_cons = raw_strok_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward stroke108_cons, replace
gen stroke144_cons = raw_strok_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward stroke144_cons, replace
gen stroke162_cons = raw_strok_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward stroke162_cons, replace
gen stroke180_cons = raw_strok_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward stroke180_cons, replace
gen stroke198_cons = raw_strok_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward stroke198_cons, replace
gen stroke216_cons = raw_strok_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward stroke216_cons, replace
gen stroke234_cons = raw_strok_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward stroke234_cons, replace
gen stroke252_cons = raw_strok_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward stroke252_cons, replace
gen stroke270_cons = raw_strok_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward stroke270_cons, replace
gen stroke288_cons = raw_strok_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward stroke288_cons, replace

* For each comprehensive assessment, code as 1 if the participant was newly coded as having had a stroke and having been hospitalized at the corresponding comprehensive assessment or the participant was coded as having had a stroke at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen stroke18 = 1 if (stroke==1 | stroke_cons==1) & interval==2
replace stroke18 = 0 if stroke18!=1 & interval==2
gen stroke36 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1) & interval==3
replace stroke36 = 0 if stroke36!=1 & interval==3
gen stroke54 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1) & interval==4
replace stroke54 = 0 if stroke54!=1 & interval==4
gen stroke72 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1) & interval==5
replace stroke72 = 0 if stroke72!=1 & interval==5
gen stroke90 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1) & interval==6
replace stroke90 = 0 if stroke90!=1 & interval==6
gen stroke108 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1) & interval==7
replace stroke108 = 0 if stroke108!=1 & interval==7
gen stroke144 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1) & interval==9
replace stroke144 = 0 if stroke144!=1 & interval==9
gen stroke162 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1) & interval==10
replace stroke162 = 0 if stroke162!=1 & interval==10
gen stroke180 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1) & interval==11
replace stroke180 = 0 if stroke180!=1 & interval==11
gen stroke198 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1) & interval==12
replace stroke198 = 0 if stroke198!=1 & interval==12
gen stroke216 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1) & interval==13
replace stroke216 = 0 if stroke216!=1 & interval==13
gen stroke234 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1 | stroke216_cons==1) & interval==14
replace stroke234 = 0 if stroke234!=1 & interval==14
gen stroke252 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1 | stroke216_cons==1 | stroke234_cons==1) & interval==15
replace stroke252 = 0 if stroke252!=1 & interval==15
gen stroke270 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1 | stroke216_cons==1 | stroke234_cons==1 | stroke252_cons==1) & interval==16
replace stroke270 = 0 if stroke270!=1 & interval==16
gen stroke288 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1 | stroke216_cons==1 | stroke234_cons==1 | stroke252_cons==1 | stroke270_cons==1) & interval==17
replace stroke288 = 0 if stroke288!=1 & interval==17
gen stroke306 = 1 if (stroke==1 | stroke_cons==1 | stroke18_cons==1 | stroke36_cons==1 | stroke54_cons==1 | stroke72_cons==1 | stroke90_cons==1 | stroke108_cons==1 | stroke144_cons==1 | stroke162_cons==1 | stroke180_cons==1 | stroke198_cons==1 | stroke216_cons==1 | stroke234_cons==1 | stroke252_cons==1 | stroke270_cons==1 | stroke288_cons==1) & interval==18
replace stroke306 = 0 if stroke306!=1 & interval==18

*** Cancer
* Code as 1 if the participant has been told by a doctor that they had cancer or a malignant tumor, excluding minor skin cancers
gen cancer = 1 if mfu_cc5==1
* Code as 0 if the participant responds "Suspect or possible" or "No"
replace cancer = 0 if inlist(mfu_cc5,2,3)
* Code as 0 if the participant responds "Don't know"
replace cancer = 0 if mfu_cc5==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having had cancer
replace cancer = . if inlist(mfu_cc5,.,7)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace cancer = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen caminus = cancer - raw_cancer

* Carryforward observations (cancer at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen cancer_cons = raw_cancer if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward cancer_cons, replace
gen cancer18_cons = raw_cancr_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward cancer18_cons, replace
gen cancer36_cons = raw_cancr_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward cancer36_cons, replace
gen cancer54_cons = raw_cancr_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward cancer54_cons, replace
gen cancer72_cons = raw_cancr_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward cancer72_cons, replace
gen cancer90_cons = raw_cancr_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward cancer90_cons, replace
gen cancer108_cons = raw_cancr_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward cancer108_cons, replace
gen cancer144_cons = raw_cancr_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward cancer144_cons, replace
gen cancer162_cons = raw_cancr_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward cancer162_cons, replace
gen cancer180_cons = raw_cancr_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward cancer180_cons, replace
gen cancer198_cons = raw_cancr_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward cancer198_cons, replace
gen cancer216_cons = raw_cancr_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward cancer216_cons, replace
gen cancer234_cons = raw_cancr_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward cancer234_cons, replace
gen cancer252_cons = raw_cancr_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward cancer252_cons, replace
gen cancer270_cons = raw_cancr_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward cancer270_cons, replace
gen cancer288_cons = raw_cancr_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward cancer288_cons, replace

* For each comprehensive assessment, code as 1 if the participant was newly coded as having had cancer at the corresponding comprehensive assessment or the participant was coded as having had a cancer at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen cancer18 = 1 if (cancer==1 | cancer_cons==1) & interval==2
replace cancer18 = 0 if cancer18!=1 & interval==2
gen cancer36 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1) & interval==3
replace cancer36 = 0 if cancer36!=1 & interval==3
gen cancer54 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1) & interval==4
replace cancer54 = 0 if cancer54!=1 & interval==4
gen cancer72 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1) & interval==5
replace cancer72 = 0 if cancer72!=1 & interval==5
gen cancer90 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1) & interval==6
replace cancer90 = 0 if cancer90!=1 & interval==6
gen cancer108 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1) & interval==7
replace cancer108 = 0 if cancer108!=1 & interval==7
gen cancer144 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1) & interval==9
replace cancer144 = 0 if cancer144!=1 & interval==9
gen cancer162 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1) & interval==10
replace cancer162 = 0 if cancer162!=1 & interval==10
gen cancer180 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1) & interval==11
replace cancer180 = 0 if cancer180!=1 & interval==11
gen cancer198 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1) & interval==12
replace cancer198 = 0 if cancer198!=1 & interval==12
gen cancer216 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1) & interval==13
replace cancer216 = 0 if cancer216!=1 & interval==13
gen cancer234 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1 | cancer216_cons==1) & interval==14
replace cancer234 = 0 if cancer234!=1 & interval==14
gen cancer252 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1 | cancer216_cons==1 | cancer234_cons==1) & interval==15
replace cancer252 = 0 if cancer252!=1 & interval==15
gen cancer270 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1 | cancer216_cons==1 | cancer234_cons==1 | cancer252_cons==1) & interval==16
replace cancer270 = 0 if cancer270!=1 & interval==16
gen cancer288 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1 | cancer216_cons==1 | cancer234_cons==1 | cancer252_cons==1 | cancer270_cons==1) & interval==17
replace cancer288 = 0 if cancer288!=1 & interval==17
gen cancer306 = 1 if (cancer==1 | cancer_cons==1 | cancer18_cons==1 | cancer36_cons==1 | cancer54_cons==1 | cancer72_cons==1 | cancer90_cons==1 | cancer108_cons==1 | cancer144_cons==1 | cancer162_cons==1 | cancer180_cons==1 | cancer198_cons==1 | cancer216_cons==1 | cancer234_cons==1 | cancer252_cons==1 | cancer270_cons==1 | cancer288_cons==1) & interval==18
replace cancer306 = 0 if cancer306!=1 & interval==18

*** Diabetes mellitus
* Code as 1 if the participant has been told by a doctor that they had diabetes, sugar in their urine, or high blood sugar ("Yes" or "Suspect or possible"), and the participant is now using medication that they swallow to treat or control their diabetes or the participant is now using insulin injections
gen diabetes_bl = 1 if inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)
* Code as 0 otherwise
replace diabetes_bl = 0 if diabetes_bl!=1
* Code as missing if the participant responds "Refused" or "Don't know" to the question about having had diabetes
replace diabetes_bl = . if inlist(mfu_cc6a,7,8)
* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
gen diab_cons = diabetes_bl if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward diab_cons, replace
* Generate a new variable replicating the "diabetes_bl" variable for all baseline comprehensive assessments
gen diabetes = diabetes_bl if interval==1
* Code as 1 if the participant has been told by a doctor that they had diabetes, sugar in their urine, or high blood sugar ("Yes" or "Suspect or possible"), and the participant is now using medication that they swallow to treat or control their diabetes or the participant is now using insulin injections, and the participant was coded as NOT having diabetes at all prior comprehensive assessments (i.e., new condition)
replace diabetes = 1 if diab_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1))
* Code as 0 otherwise
replace diabetes = 0 if diabetes!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having had diabetes
replace diabetes = . if inlist(mfu_cc6a,.,7)
* Code as missing if the comprehensive assessment is not at baseline or 18-month follow-up (i.e., intervals 1-2)
replace diabetes = . if ! inlist(interval,1,2)

* Carryforward observations (diabetes at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen diab18_cons = raw_diab_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward diab18_cons, replace
gen diab36_cons = raw_diab_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward diab36_cons, replace
gen diab54_cons = raw_diab_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward diab54_cons, replace
gen diab72_cons = raw_diab_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward diab72_cons, replace
gen diab90_cons = raw_diab_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward diab90_cons, replace
gen diab108_cons = raw_diab_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward diab108_cons, replace
gen diab144_cons = raw_diab_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward diab144_cons, replace
gen diab162_cons = raw_diab_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward diab162_cons, replace
gen diab180_cons = raw_diab_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward diab180_cons, replace
gen diab198_cons = raw_diab_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward diab198_cons, replace
gen diab216_cons = raw_diab_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward diab216_cons, replace
gen diab234_cons = raw_diab_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward diab234_cons, replace
gen diab252_cons = raw_diab_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward diab252_cons, replace
gen diab270_cons = raw_diab_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward diab270_cons, replace
gen diab288_cons = raw_diab_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward diab288_cons, replace

* For intervals 3-18, code as 1 if the participant has been told by a doctor that they had diabetes, sugar in their urine, or high blood sugar ("Yes" or "Suspect or possible"), and the participant is now using medication that they swallow to treat or control their diabetes or the participant is now using insulin injections, and the participant was coded as NOT having diabetes at all prior comprehensive assessments (i.e., new condition)
replace diabetes = 1 if diab18_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==3
replace diabetes = 1 if diab36_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==4
replace diabetes = 1 if diab54_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==5
* Note that in the original syntax ("P:\projects\PEP\sas\FACE Master pgm\fu90face_3.sas" - not written by the authors of the current article) for the 90-month follow-up comprehensive assessment dataset compilation, "diab54_cons" was used in the following line of code rather than "diab72_cons" - this has been corrected here (the mistake in the comprehensive assessment dataset does not affect the raw_ccsumbl2 variable)
replace diabetes = 1 if diab72_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==6
replace diabetes = 1 if diab90_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==7
replace diabetes = 1 if diab108_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==9
replace diabetes = 1 if diab144_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==10
replace diabetes = 1 if diab162_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==11
replace diabetes = 1 if diab180_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==12
replace diabetes = 1 if diab198_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==13
replace diabetes = 1 if diab216_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==14
replace diabetes = 1 if diab234_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==15
replace diabetes = 1 if diab252_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==16
replace diabetes = 1 if diab270_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==17
replace diabetes = 1 if diab288_cons==0 & (inlist(mfu_cc6a,1,3) & (mfu_cc6b==1 | mfu_cc6c==1)) & interval==18

* Code as 0 otherwise
replace diabetes = 0 if diabetes!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having had diabetes
replace diabetes = . if inlist(mfu_cc6a,.,7)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace diabetes = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen diabminus = diabetes - raw_diabetes

* For each comprehensive assessment, code as 1 if the participant was newly coded as having had diabetes at the corresponding comprehensive assessment or the participant was coded as having had diabetes at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen diab18 = 1 if (diabetes==1 | diab_cons==1) & interval==2
replace diab18 = 0 if diab18!=1 & interval==2
gen diab36 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1) & interval==3
replace diab36 = 0 if diab36!=1 & interval==3
gen diab54 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1) & interval==4
replace diab54 = 0 if diab54!=1 & interval==4
gen diab72 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1) & interval==5
replace diab72 = 0 if diab72!=1 & interval==5
gen diab90 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1) & interval==6
replace diab90 = 0 if diab90!=1 & interval==6
gen diab108 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1) & interval==7
replace diab108 = 0 if diab108!=1 & interval==7
gen diab144 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1) & interval==9
replace diab144 = 0 if diab144!=1 & interval==9
gen diab162 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1) & interval==10
replace diab162 = 0 if diab162!=1 & interval==10
gen diab180 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1) & interval==11
replace diab180 = 0 if diab180!=1 & interval==11
gen diab198 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1) & interval==12
replace diab198 = 0 if diab198!=1 & interval==12
gen diab216 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1) & interval==13
replace diab216 = 0 if diab216!=1 & interval==13
gen diab234 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1 | diab216_cons==1) & interval==14
replace diab234 = 0 if diab234!=1 & interval==14
gen diab252 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1 | diab216_cons==1 | diab234_cons==1) & interval==15
replace diab252 = 0 if diab252!=1 & interval==15
gen diab270 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1 | diab216_cons==1 | diab234_cons==1 | diab252_cons==1) & interval==16
replace diab270 = 0 if diab270!=1 & interval==16
gen diab288 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1 | diab216_cons==1 | diab234_cons==1 | diab252_cons==1 | diab270_cons==1) & interval==17
replace diab288 = 0 if diab288!=1 & interval==17
gen diab306 = 1 if (diabetes==1 | diab_cons==1 | diab18_cons==1 | diab36_cons==1 | diab54_cons==1 | diab72_cons==1 | diab90_cons==1 | diab108_cons==1 | diab144_cons==1 | diab162_cons==1 | diab180_cons==1 | diab198_cons==1 | diab216_cons==1 | diab234_cons==1 | diab252_cons==1 | diab270_cons==1 | diab288_cons==1) & interval==18
replace diab306 = 0 if diab306!=1 & interval==18

*** Hip fracture
* Code as 1 if the participant has been told by a doctor that they had a broken or fractured hip and had to be hospitalized
gen hipf = 1 if mfu_cc7==1
* Code as 0 if the participant responds "Suspect or possible" or "No"
replace hipf = 0 if inlist(mfu_cc7,2,3)
* Code as 0 if the participant responds "Don't know"
replace hipf = 0 if mfu_cc7==8
* Code as missing if the participant refused to answer the question (or it was left blank) about having had a hip fracture
replace hipf = . if inlist(mfu_cc7,.,7)
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace hipf = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen hfminus = hipf - raw_hipfx

* Carryforward observations (hip fracture at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen hipfx_cons = raw_hipfx if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx_cons, replace
gen hipfx18_cons = raw_hipfx_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx18_cons, replace
gen hipfx36_cons = raw_hipfx_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx36_cons, replace
gen hipfx54_cons = raw_hipfx_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx54_cons, replace
gen hipfx72_cons = raw_hipfx_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx72_cons, replace
gen hipfx90_cons = raw_hipfx_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx90_cons, replace
gen hipfx108_cons = raw_hipfx_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx108_cons, replace
gen hipfx144_cons = raw_hipfx_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx144_cons, replace
gen hipfx162_cons = raw_hipfx_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx162_cons, replace
gen hipfx180_cons = raw_hipfx_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx180_cons, replace
gen hipfx198_cons = raw_hipfx_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx198_cons, replace
gen hipfx216_cons = raw_hipfx_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx216_cons, replace
gen hipfx234_cons = raw_hipfx_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx234_cons, replace
gen hipfx252_cons = raw_hipfx_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx252_cons, replace
gen hipfx270_cons = raw_hipfx_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx270_cons, replace
gen hipfx288_cons = raw_hipfx_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward hipfx288_cons, replace

* For each comprehensive assessment, code as 1 if the participant was newly coded as having had a hip fracture at the corresponding comprehensive assessment or the participant was coded as having had a hip fracture at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen hipfx18 = 1 if (hipf==1 | hipfx_cons==1) & interval==2
replace hipfx18 = 0 if hipfx18!=1 & interval==2
gen hipfx36 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1) & interval==3
replace hipfx36 = 0 if hipfx36!=1 & interval==3
gen hipfx54 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1) & interval==4
replace hipfx54 = 0 if hipfx54!=1 & interval==4
gen hipfx72 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1) & interval==5
replace hipfx72 = 0 if hipfx72!=1 & interval==5
gen hipfx90 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1) & interval==6
replace hipfx90 = 0 if hipfx90!=1 & interval==6
gen hipfx108 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1) & interval==7
replace hipfx108 = 0 if hipfx108!=1 & interval==7
gen hipfx144 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1) & interval==9
replace hipfx144 = 0 if hipfx144!=1 & interval==9
gen hipfx162 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1) & interval==10
replace hipfx162 = 0 if hipfx162!=1 & interval==10
gen hipfx180 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1) & interval==11
replace hipfx180 = 0 if hipfx180!=1 & interval==11
gen hipfx198 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1) & interval==12
replace hipfx198 = 0 if hipfx198!=1 & interval==12
gen hipfx216 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1) & interval==13
replace hipfx216 = 0 if hipfx216!=1 & interval==13
gen hipfx234 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1 | hipfx216_cons==1) & interval==14
replace hipfx234 = 0 if hipfx234!=1 & interval==14
gen hipfx252 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1 | hipfx216_cons==1 | hipfx234_cons==1) & interval==15
replace hipfx252 = 0 if hipfx252!=1 & interval==15
gen hipfx270 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1 | hipfx216_cons==1 | hipfx234_cons==1 | hipfx252_cons==1) & interval==16
replace hipfx270 = 0 if hipfx270!=1 & interval==16
gen hipfx288 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1 | hipfx216_cons==1 | hipfx234_cons==1 | hipfx252_cons==1 | hipfx270_cons==1) & interval==17
replace hipfx288 = 0 if hipfx288!=1 & interval==17
gen hipfx306 = 1 if (hipf==1 | hipfx_cons==1 | hipfx18_cons==1 | hipfx36_cons==1 | hipfx54_cons==1 | hipfx72_cons==1 | hipfx90_cons==1 | hipfx108_cons==1 | hipfx144_cons==1 | hipfx162_cons==1 | hipfx180_cons==1 | hipfx198_cons==1 | hipfx216_cons==1 | hipfx234_cons==1 | hipfx252_cons==1 | hipfx270_cons==1 | hipfx288_cons==1) & interval==18
replace hipfx306 = 0 if hipfx306!=1 & interval==18

*** Arthritis
* For all baseline comprehensive assessments, code as 1 if the participant has seen a doctor specifically for arthritis or rheumatism and they had pain and/or stiffness in their hands/fingers, shoulders, knees, hips, and/or back/spine
gen arth = 1 if inlist(mfu_cc8a,1,3) & (mfu_cc8b1==1 | mfu_cc8b2==1 | mfu_cc8b3==1 | mfu_cc8b4==1 | mfu_cc8b5==1) & interval==1
* Code as 0 if the participant has not seen a doctor specifically for athritis or rhematism, or if the participant has seen a doctor specifically for arthritis or rheumatism but they did not have pain and/or stiffness in their joints
replace arth = 0 if (mfu_cc8a==2 | (inlist(mfu_cc8a,1,3) & (mfu_cc8b1!=1 & mfu_cc8b2!=1 & mfu_cc8b3!=1 & mfu_cc8b4!=1 & mfu_cc8b5!=1))) & interval==1
* For all follow-up comprehensive assessments, code as 1 if the participant has seen a doctor specifically for arthritis or rheumatism and they had pain and/or stiffness in their hands/fingers, shoulders, knees, hips, and/or back/spine
replace arth = 1 if inlist(mfu_cc8a,1,3) & (mfu_cc8b1==1 | mfu_cc8b2==1 | mfu_cc8b3==1 | mfu_cc8b4==1 | mfu_cc8b5==1) & interval!=1
* Code as 0 if the participant has not seen a doctor specifically for athritis or rhematism, or if the participant has seen a doctor specifically for arthritis or rheumatism but they did not have pain and/or stiffness in their joints
replace arth = 0 if (mfu_cc8a==2 | (inlist(mfu_cc8a,1,3) & (mfu_cc8b1!=1 & mfu_cc8b2!=1 & mfu_cc8b3!=1 & mfu_cc8b4!=1 & mfu_cc8b5!=1))) & interval!=1
* Code as 0 if the participant responds "Don't know"
replace arth = 0 if mfu_cc8a==8 & interval!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having seen a doctor specifically for arthritis or rheumatism
replace arth = . if inlist(mfu_cc8a,.,7) & interval!=1
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace arth = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen arminus = arth - raw_arthrit

* Carryforward observations (arthritis at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen arth_cons = raw_arthrit if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward arth_cons, replace
gen arth18_cons = raw_arth_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward arth18_cons, replace
gen arth36_cons = raw_arth_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward arth36_cons, replace
gen arth54_cons = raw_arth_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward arth54_cons, replace
gen arth72_cons = raw_arth_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward arth72_cons, replace
gen arth90_cons = raw_arth_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward arth90_cons, replace
gen arth108_cons = raw_arth_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward arth108_cons, replace
gen arth144_cons = raw_arth_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward arth144_cons, replace
gen arth162_cons = raw_arth_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward arth162_cons, replace
gen arth180_cons = raw_arth_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward arth180_cons, replace
gen arth198_cons = raw_arth_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward arth198_cons, replace
gen arth216_cons = raw_arth_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward arth216_cons, replace
gen arth234_cons = raw_arth_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward arth234_cons, replace
gen arth252_cons = raw_arth_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward arth252_cons, replace
gen arth270_cons = raw_arth_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward arth270_cons, replace
gen arth288_cons = raw_arth_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward arth288_cons, replace

* For each comprehensive assessment, code as 1 if the participant was newly coded as having arthritis at the corresponding comprehensive assessment or the participant was coded as having arthritis at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen arth18 = 1 if (arth==1 | arth_cons==1) & interval==2
replace arth18 = 0 if arth18!=1 & interval==2
gen arth36 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1) & interval==3
replace arth36 = 0 if arth36!=1 & interval==3
gen arth54 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1) & interval==4
replace arth54 = 0 if arth54!=1 & interval==4
gen arth72 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1) & interval==5
replace arth72 = 0 if arth72!=1 & interval==5
gen arth90 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1) & interval==6
replace arth90 = 0 if arth90!=1 & interval==6
gen arth108 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1) & interval==7
replace arth108 = 0 if arth108!=1 & interval==7
gen arth144 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1) & interval==9
replace arth144 = 0 if arth144!=1 & interval==9
gen arth162 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1) & interval==10
replace arth162 = 0 if arth162!=1 & interval==10
gen arth180 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1) & interval==11
replace arth180 = 0 if arth180!=1 & interval==11
gen arth198 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1) & interval==12
replace arth198 = 0 if arth198!=1 & interval==12
gen arth216 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1) & interval==13
replace arth216 = 0 if arth216!=1 & interval==13
gen arth234 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1 | arth216_cons==1) & interval==14
replace arth234 = 0 if arth234!=1 & interval==14
gen arth252 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1 | arth216_cons==1 | arth234_cons==1) & interval==15
replace arth252 = 0 if arth252!=1 & interval==15
gen arth270 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1 | arth216_cons==1 | arth234_cons==1 | arth252_cons==1) & interval==16
replace arth270 = 0 if arth270!=1 & interval==16
gen arth288 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1 | arth216_cons==1 | arth234_cons==1 | arth252_cons==1 | arth270_cons==1) & interval==17
replace arth288 = 0 if arth288!=1 & interval==17
gen arth306 = 1 if (arth==1 | arth_cons==1 | arth18_cons==1 | arth36_cons==1 | arth54_cons==1 | arth72_cons==1 | arth90_cons==1 | arth108_cons==1 | arth144_cons==1 | arth162_cons==1 | arth180_cons==1 | arth198_cons==1 | arth216_cons==1 | arth234_cons==1 | arth252_cons==1 | arth270_cons==1 | arth288_cons==1) & interval==18
replace arth306 = 0 if arth306!=1 & interval==18

*** Chronic lung disease
* For all baseline comprehensive assessments, code as 1 if the participant has been told by a doctor that they have chronic lung disease such as chronic bronchitis, COPD, asthma, or emphysema ("Yes"), or the participant has been told by a doctor that they possibly have chronic lung disease ("Suspect or possible") and the participant's lung disease limits their usual activities such as household chores
gen copd = 1 if (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1)) & interval==1
* Code as 0 otherwise
replace copd = 0 if copd!=1 & interval==1
* Code as missing if either question was left blank
replace copd = . if mfu_cc9a==. & mfu_cc9b==. & interval==1
* Carryforward observations with respect to the time variable "interval" (i.e., from baseline to the follow-up comprehensive assessments) by participant ID
gen copd_cons = copd if interval==1
tsset STUDYID interval 
bysort STUDYID: carryforward copd_cons, replace
* For all 18-month follow-up comprehensive assessments, code as 1 if the participant has been told by a doctor that they have chronic lung disease such as chronic bronchitis, COPD, asthma, or emphysema ("Yes"), or the participant has been told by a doctor that they possibly have chronic lung disease ("Suspect or possible") and the participant's lung disease limits their usual activities such as household chores, and the participant was coded as NOT having chronic lung disease at the baseline comprehensive assessment (i.e., new condition)
replace copd = 1 if (copd_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==2
* Code as 0 otherwise
replace copd = 0 if copd!=1 & interval==2
* Code as missing if the participant refused to answer the question (or it was left blank) about having chronic lung disease
replace copd = . if inlist(mfu_cc9a,.,7)
* Code as missing if the comprehensive assessment is not at baseline or 18-month follow-up (i.e., intervals 1-2)
replace copd = . if ! inlist(interval,1,2)

* Carryforward observations (chronic lung disease at the current comprehensive assessment or any prior comprehensive assessment) with respect to the time variable "interval" (i.e., to all subsequent comprehensive assessments) by participant ID
gen lungd18_cons = raw_lungd_18 if interval==2
tsset STUDYID interval 
bysort STUDYID: carryforward lungd18_cons, replace
gen lungd36_cons = raw_lungd_36 if interval==3
tsset STUDYID interval 
bysort STUDYID: carryforward lungd36_cons, replace
gen lungd54_cons = raw_lungd_54 if interval==4
tsset STUDYID interval 
bysort STUDYID: carryforward lungd54_cons, replace
gen lungd72_cons = raw_lungd_72 if interval==5
tsset STUDYID interval 
bysort STUDYID: carryforward lungd72_cons, replace
gen lungd90_cons = raw_lungd_90 if interval==6
tsset STUDYID interval 
bysort STUDYID: carryforward lungd90_cons, replace
gen lungd108_cons = raw_lungd_108 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward lungd108_cons, replace
gen lungd144_cons = raw_lungd_144 if interval==9
tsset STUDYID interval 
bysort STUDYID: carryforward lungd144_cons, replace
gen lungd162_cons = raw_lungd_162 if interval==10
tsset STUDYID interval 
bysort STUDYID: carryforward lungd162_cons, replace
gen lungd180_cons = raw_lungd_180 if interval==11
tsset STUDYID interval 
bysort STUDYID: carryforward lungd180_cons, replace
gen lungd198_cons = raw_lungd_198 if interval==12
tsset STUDYID interval 
bysort STUDYID: carryforward lungd198_cons, replace
gen lungd216_cons = raw_lungd_216 if interval==13
tsset STUDYID interval 
bysort STUDYID: carryforward lungd216_cons, replace
gen lungd234_cons = raw_lungd_234 if interval==14
tsset STUDYID interval 
bysort STUDYID: carryforward lungd234_cons, replace
gen lungd252_cons = raw_lungd_252 if interval==15
tsset STUDYID interval 
bysort STUDYID: carryforward lungd252_cons, replace
gen lungd270_cons = raw_lungd_270 if interval==16
tsset STUDYID interval 
bysort STUDYID: carryforward lungd270_cons, replace
gen lungd288_cons = raw_lungd_288 if interval==17
tsset STUDYID interval 
bysort STUDYID: carryforward lungd288_cons, replace

* For intervals 3-18, code as 1 if the participant has been told by a doctor that they have chronic lung disease such as chronic bronchitis, COPD, asthma, or emphysema ("Yes"), or the participant has been told by a doctor that they possibly have chronic lung disease ("Suspect or possible") and the participant's lung disease limits their usual activities such as household chores, and the participant was coded as NOT having chronic lung disease at all prior comprehensive assessments (i.e., new condition)
replace copd = 1 if (lungd18_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==3
replace copd = 1 if (lungd36_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==4
replace copd = 1 if (lungd54_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==5
replace copd = 1 if (lungd72_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==6
replace copd = 1 if (lungd90_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==7
replace copd = 1 if (lungd108_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==9
replace copd = 1 if (lungd144_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==10
replace copd = 1 if (lungd162_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==11
replace copd = 1 if (lungd180_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==12
replace copd = 1 if (lungd198_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==13
replace copd = 1 if (lungd216_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==14
replace copd = 1 if (lungd234_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==15
replace copd = 1 if (lungd252_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==16
replace copd = 1 if (lungd270_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==17
replace copd = 1 if (lungd288_cons==0 & (mfu_cc9a==1 | (mfu_cc9a==3 & mfu_cc9b==1))) & interval==18

* Code as 0 otherwise
replace copd = 0 if copd!=1
* Code as missing if the participant refused to answer the question (or it was left blank) about having chronic lung disease
replace copd = . if inlist(mfu_cc9a,.,7)
* Generate a new variable replicating the "copd" variable
gen lung_d = copd
* Code as 0 if the participant responds "Don't know"
replace lung_d = 0 if mfu_cc9a==8
* If mfu_cc1a or mfu_cc1b; mfu_cc2; mfu_cc3; mfu_cc4a; mfu_cc5; mfu_cc6a or mfu_cc6b or mfu_cc6c; mfu_cc7; mfu_cc8a; and mfu_cc9a are coded as "Don't know", treat observation as a missing case
replace lung_d = . if STUDYID==2007 & interval==2
* Compare values with variable from combined comprehensive assessment dataset
gen lungminus = lung_d - raw_lung_d
* If mfu_cc9a is coded as "Suspect or possible" and mfu_cc9b is coded as "Yes", but chronic lung disease at the previous comprehensive assessment was left blank, code as 1
replace lung_d = 1 if STUDYID==510 & interval==3
* Compare values with variable from combined comprehensive assessment dataset
gen lungminus2 = lung_d - raw_lung_d

* For each comprehensive assessment, code as 1 if the participant was newly coded as having chronic lung disease at the corresponding comprehensive assessment or the participant was coded as having chronic lung disease at any prior comprehensive assessment(s)
* Code as 0 otherwise
gen lungd18 = 1 if (lung_d==1 | copd_cons==1) & interval==2
replace lungd18 = 0 if lungd18!=1 & interval==2
gen lungd36 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1) & interval==3
replace lungd36 = 0 if lungd36!=1 & interval==3
gen lungd54 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1) & interval==4
replace lungd54 = 0 if lungd54!=1 & interval==4
gen lungd72 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1) & interval==5
replace lungd72 = 0 if lungd72!=1 & interval==5
gen lungd90 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1) & interval==6
replace lungd90 = 0 if lungd90!=1 & interval==6
gen lungd108 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1) & interval==7
replace lungd108 = 0 if lungd108!=1 & interval==7
gen lungd144 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1) & interval==9
replace lungd144 = 0 if lungd144!=1 & interval==9
gen lungd162 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1) & interval==10
replace lungd162 = 0 if lungd162!=1 & interval==10
gen lungd180 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1) & interval==11
replace lungd180 = 0 if lungd180!=1 & interval==11
gen lungd198 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1) & interval==12
replace lungd198 = 0 if lungd198!=1 & interval==12
gen lungd216 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1) & interval==13
replace lungd216 = 0 if lungd216!=1 & interval==13
gen lungd234 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1 | lungd216_cons==1) & interval==14
replace lungd234 = 0 if lungd234!=1 & interval==14
gen lungd252 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1 | lungd216_cons==1 | lungd234_cons==1) & interval==15
replace lungd252 = 0 if lungd252!=1 & interval==15
gen lungd270 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1 | lungd216_cons==1 | lungd234_cons==1 | lungd252_cons==1) & interval==16
replace lungd270 = 0 if lungd270!=1 & interval==16
gen lungd288 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1 | lungd216_cons==1 | lungd234_cons==1 | lungd252_cons==1 | lungd270_cons==1) & interval==17
replace lungd288 = 0 if lungd288!=1 & interval==17
gen lungd306 = 1 if (lung_d==1 | copd_cons==1 | lungd18_cons==1 | lungd36_cons==1 | lungd54_cons==1 | lungd72_cons==1 | lungd90_cons==1 | lungd108_cons==1 | lungd144_cons==1 | lungd162_cons==1 | lungd180_cons==1 | lungd198_cons==1 | lungd216_cons==1 | lungd234_cons==1 | lungd252_cons==1 | lungd270_cons==1 | lungd288_cons==1) & interval==18
replace lungd306 = 0 if lungd306!=1 & interval==18

*** Sum
tab raw_ccsumbl2
* At baseline and each follow-up comprehensive assessment, generate a count of the number of chronic conditions
gen chronic3 = (hbp18 + mi18 + chf18 + stroke18 + cancer18 + diab18 + hipfx18 + lungd18 + arth18) if interval==2
replace chronic3 = (hbp36 + mi36 + chf36 + stroke36 + cancer36 + diab36 + hipfx36 + lungd36 + arth36) if interval==3
replace chronic3 = (hbp54 + mi54 + chf54 + stroke54 + cancer54 + diab54 + hipfx54 + lungd54 + arth54) if interval==4
replace chronic3 = (hbp72 + mi72 + chf72 + stroke72 + cancer72 + diab72 + hipfx72 + lungd72 + arth72) if interval==5
replace chronic3 = (hbp90 + mi90 + chf90 + stroke90 + cancer90 + diab90 + hipfx90 + lungd90 + arth90) if interval==6
replace chronic3 = (hbp108 + mi108 + chf108 + stroke108 + cancer108 + diab108 + hipfx108 + lungd108 + arth108) if interval==7
replace chronic3 = (hbp144 + mi144 + chf144 + stroke144 + cancer144 + diab144 + hipfx144 + lungd144 + arth144) if interval==9
replace chronic3 = (hbp162 + mi162 + chf162 + stroke162 + cancer162 + diab162 + hipfx162 + lungd162 + arth162) if interval==10
replace chronic3 = (hbp180 + mi180 + chf180 + stroke180 + cancer180 + diab180 + hipfx180 + lungd180 + arth180) if interval==11
replace chronic3 = (hbp198 + mi198 + chf198 + stroke198 + cancer198 + diab198 + hipfx198 + lungd198 + arth198) if interval==12
replace chronic3 = (hbp216 + mi216 + chf216 + stroke216 + cancer216 + diab216 + hipfx216 + lungd216 + arth216) if interval==13
replace chronic3 = (hbp234 + mi234 + chf234 + stroke234 + cancer234 + diab234 + hipfx234 + lungd234 + arth234) if interval==14
replace chronic3 = (hbp252 + mi252 + chf252 + stroke252 + cancer252 + diab252 + hipfx252 + lungd252 + arth252) if interval==15
replace chronic3 = (hbp270 + mi270 + chf270 + stroke270 + cancer270 + diab270 + hipfx270 + lungd270 + arth270) if interval==16
replace chronic3 = (hbp288 + mi288 + chf288 + stroke288 + cancer288 + diab288 + hipfx288 + lungd288 + arth288) if interval==17
replace chronic3 = (hbp306 + mi306 + chf306 + stroke306 + cancer306 + diab306 + hipfx306 + lungd306 + arth306) if interval==18
replace chronic3 = (highbl + heart + chf + stroke + cancer + diabetes + hipf + arth + lung_d) if interval==1
* Compare values with variable from combined comprehensive assessment dataset
gen ch3minus = chronic3 - raw_ccsumbl2

** Disability at the comprehensive assessments
gen shopping = mfu_pf12a 
* Code as 0 if the participant responds "No help" to the question "At the present time, aside from transportation, do you need help from another person to shop (go to the store)?"
replace shopping = 0 if shopping==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace shopping = 1 if inlist(shopping,2,3)
* Code as missing if the participant refused to answer the question
replace shopping = . if shopping==7
tab raw_hp_shop

gen housework = mfu_pf13a 
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to do housework, such as washing the dishes, taking out the trash, or scrubbing the floor?"
replace housework = 0 if housework==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace housework = 1 if inlist(housework,2,3)
* Code as missing if the participant refused to answer the question
replace housework = . if housework==7
tab raw_hp_clean

* Hard code documented in "P:\projects\PEP\sas\FACE Master pgm\baseface_3.sas"
replace mfu_pf14a = 2 if STUDYID==2675 & interval==1
gen meals = mfu_pf14a 
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to prepare a meal?"
replace meals = 0 if meals==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace meals = 1 if inlist(meals,2,3)
* Code as missing if the participant refused to answer the question
replace meals = . if meals==7
tab raw_hp_meal

gen medication = mfu_pf15a 
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to take your medications?"
replace medication = 0 if medication==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace medication = 1 if inlist(medication,2,3)
* Code as missing if the participant refused to answer the question
replace medication = . if medication==7
tab raw_hp_meds

* Hard codes documented in "P:\projects\PEP\sas\FACE Master pgm\baseface_3.sas", and "P:\projects\PEP\sas\FACE Master pgm\fu18face_3.sas"
replace mfu_pf16a = 2 if STUDYID==267 & interval==1
replace mfu_pf16a = 2 if STUDYID==686 & interval==1
replace mfu_pf16a = 2 if STUDYID==720 & interval==2
gen finances = mfu_pf16a 
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to manage your finances, such as paying the bills?"
replace finances = 0 if finances==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace finances = 1 if inlist(finances,2,3)
* Code as missing if the participant refused to answer the question
replace finances = . if finances==7
tab raw_hp_bills 

*** Sum
* Generate a count of the number of instrumental activities of daily living (IADL) requiring personal assistance
gen iadldep = shopping + housework + meals + medication + finances
tab raw_iadl_dep
* Code as 0 if the participant is fully independent 
gen iadldep_bi = 0 if raw_iadl_dep==0
* Code as 1 if the participant is dependent in one or more IADL
replace iadldep_bi = 1 if inlist(raw_iadl_dep,1,2,3,4,5)

* Overwrite dataset, by replacing the previously saved file
save comprehensive.dta, replace
clear 

* Import monthly data
import sas using "P:\projects\PEP\Master\pepmonth_le123124\pepmonth_le123124.sas7bdat"
* Keep data pertaining only to decedents
keep if Died==1
* Keep data from the first monthly interview
keep if intbloc==1
* Rename StudyID variable to ensure consistency with updated master dataset
rename StudyID STUDYID
* Keep relevant variables (correct date of death)
keep STUDYID DDate 
* Rename DDate variable to differentiate it from the less recent DDate variable in the updated master dataset
rename DDate DDate2
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save corrected date of death dataset with a new name
save deaths.dta
clear

* Use updated master dataset
use comprehensive.dta 
* Merge updated master dataset with corrected date of death dataset
merge m:1 STUDYID using deaths.dta, generate(merge_death)
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
* Overwrite dataset, by replacing the previously saved file
save comprehensive.dta, replace
* Keep data pertaining only to decedents
keep if merge_death==3
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 5038 observations
* Save dataset with a new name
save wave8temp.dta

* Drop interval 8 (no comprehensive assessments took place at 126-month follow-up due to lack of funding)
drop if interval==8
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 4744 observations
* Keep intrinsic capacity indicators
keep STUDYID interval orientation att_spell rec language visuospatial vis3cat_raw hear3cat_raw hear_sr walk1n tcs2 balance_new avg_grip_nomiss max_pef_miss fc1_wtlsraw newds1 newds2 newds3 newds4 new_ds5 newds6 newds7 new_ds8 newds9 newds10 newds11
* For each cognitive test, participants who correctly answered all relevant items were assigned a score of 1 and participants who answered any items incorrectly were assigned a score of 0
gen orientation_bi = 1 if orientation==10
replace orientation_bi = 0 if orientation<10
gen rec_bi = 1 if rec==3
replace rec_bi = 0 if rec<3
gen language_bi = 1 if language==8
replace language_bi = 0 if language<8
gen spell_bi = 1 if att_spell==5
replace spell_bi = 0 if att_spell<5
* Near-vision acuity (% impairment, collapsed into terciles) was reversed: ≥ 26.25 (coded as 0); ≥ 5.6 and < 26.25 (coded as 1); and < 5.6 (coded as 2)
gen vis_rev = 0 if vis3cat_raw==2
replace vis_rev = 1 if vis3cat_raw==1
replace vis_rev = 2 if vis3cat_raw==0
* Hearing impairment (evaluated with an Audioscope and based on the number of tones missed across 1000 and 2000 Hz measurements for the left and right ears) was reversed: 4 out of 4 tones missed (coded as 0); 2 or 3 out of 4 tones missed (coded as 1); and 0 or 1 out of 4 tones missed (coded as 2)
gen hear_rev = 0 if hear3cat_raw==2
replace hear_rev = 1 if hear3cat_raw==1
replace hear_rev = 2 if hear3cat_raw==0
* Self-reported hearing was reversed: "Poor" (coded as 1); "Fair" (coded as 2); "Good" (coded as 3); "Very good" (coded as 4); and "Excellent" (coded as 5)
revrs hear_sr
* The gait speed variable (time in seconds rounded to one decimal place) was log-transformed and reversed such that higher values reflected quicker times to complete the test
gen logwalk1n = log(walk1n)
replace logwalk1n = logwalk1n*-1
sum logwalk1n
replace logwalk1n = logwalk1n-r(min)
* The timed chair stands variable (time in seconds rounded to one decimal place) was log-transformed and reversed such that higher values reflected quicker times to complete the test
gen logtcs2 = log(tcs2)
replace logtcs2 = logtcs2*-1
sum logtcs2
replace logtcs2 = logtcs2-r(min)
* Rename variable
rename balance_new balance
* Code as 0 if participants responded "Yes" to the question asking them if they had lost more than 10 pounds in the last year
gen wtls_rev = 0 if fc1_wtlsraw==1
* Code as 1 if participants responded "No" to the question asking them if they had lost more than 10 pounds in the last year
replace wtls_rev = 1 if fc1_wtlsraw==0
* Round the hard coded values down to the nearest integer (so that there are only three response categories per item, and there isn't a fourth category with only one observation in analyses)
replace newds1 = 0 if newds1==0.5
replace new_ds5 = 1 if new_ds5==1.5
replace new_ds8 = 1 if new_ds8==1.5
* Reverse code all depressive symptom items
revrs newds1 newds2 newds3 newds4 new_ds5 newds6 newds7 new_ds8 newds9 newds10 newds11
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds1 = revnewds1-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds2 = revnewds2-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds3 = revnewds3-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds4 = revnewds4-1
* Response options: "Rarely or never" (coded as 0); "Some of the time" (coded as 1); and "Much or most of the time" (coded as 2)
replace revnew_ds5 = revnew_ds5-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds6 = revnewds6-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds7 = revnewds7-1
* Response options: "Rarely or never" (coded as 0); "Some of the time" (coded as 1); and "Much or most of the time" (coded as 2)
replace revnew_ds8 = revnew_ds8-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds9 = revnewds9-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds10 = revnewds10-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds11 = revnewds11-1
* Drop the variables that are no longer needed
drop fc1_wtlsraw vis3cat_raw hear3cat_raw orientation att_spell rec language hear_sr walk1n tcs2 newds1 newds2 newds3 newds4 new_ds5 newds6 newds7 new_ds8 newds9 newds10 newds11
* Generate a new variable equal to the sum of items with available "non-missing" data for each observation
egen nmcount = rownonmiss(_all), strok
tab nmcount
tab STUDYID interval if nmcount==2
* Drop observations where the only available data are the participant ID and interval number
drop if nmcount==2
* Save dataset with a new name
save decedents.dta
* Drop unnecessary variable
drop nmcount
* Generate a new variable equal to the sum of items with available "non-missing" data for each observation
egen nmcount = rownonmiss(_all), strok
tab nmcount
* Every observation has an available participant ID and interval number, therefore 2 is subtracted from the variable to give the number of "non-missing" items across the 25 intrinsic capacity indicators
replace nmcount = nmcount-2
* Keep baseline data only
keep if interval==1
tab nmcount
* Save dataset with a new name
save factorstructure_test.dta

* Convert dataset into a data file and Mplus input file
stata2mplus using factorstructure_test.dta
clear

* Run factor analysis code from file "2025-10-10_Mplus-input_v01.docx" in Mplus

* Use master dataset limited to observations pertaining to decedents with at least some intrinsic capacity data
use decedents.dta
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 4741 observations
drop nmcount
* Re-order variables to match Methods and Supplementary Tables S2-S3
order STUDYID interval orientation_bi spell_bi rec_bi language_bi visuospatial vis_rev hear_rev revhear_sr logwalk1n logtcs2 balance avg_grip_nomiss max_pef_miss wtls_rev revnewds1 revnewds2 revnewds3 revnewds4 revnew_ds5 revnewds6 revnewds7 revnew_ds8 revnewds9 revnewds10 revnewds11
* Generate a new variable equal to the sum of items with available "non-missing" data for each observation
egen nmcount = rownonmiss(_all), strok
tab nmcount
* Every observation has an available participant ID and interval number, therefore 2 is subtracted from the variable to give the number of "non-missing" items across the 25 intrinsic capacity indicators
replace nmcount = nmcount-2
* Keep observations with data on at least 13/25 items (i.e., more than half) 
keep if nmcount>=12.5
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 4591 observations
* Save dataset with a new name
save mcmcmlirt.dta

* Before developing the metric, items comprising the intrinsic capacity construct were rescaled with the proportion of maximum scaling method so that values ranged from 0 to 1
* Cognitive 
sum orientation_bi, meanonly
gen orientation_bi_rs = (orientation_bi - r(min) ) / ( r(max)-r(min) )
sum orientation_bi orientation_bi_rs
sum spell_bi, meanonly
gen spell_bi_rs = (spell_bi - r(min) ) / ( r(max)-r(min) )
sum spell_bi spell_bi_rs
sum rec_bi, meanonly
gen rec_bi_rs = (rec_bi - r(min) ) / ( r(max)-r(min) )
sum rec_bi rec_bi_rs
sum language_bi, meanonly
gen language_bi_rs = (language_bi - r(min) ) / ( r(max)-r(min) )
sum language_bi language_bi_rs
sum visuospatial, meanonly
gen visuospatial_rs = (visuospatial - r(min) ) / ( r(max)-r(min) )
sum visuospatial visuospatial_rs
* Sensory
sum vis_rev, meanonly
gen vis_rev_rs = (vis_rev - r(min) ) / ( r(max)-r(min) )
sum vis_rev vis_rev_rs
sum hear_rev, meanonly
gen hear_rev_rs = (hear_rev - r(min) ) / ( r(max)-r(min) )
sum hear_rev hear_rev_rs
sum revhear_sr, meanonly
gen revhear_sr_rs = (revhear_sr - r(min) ) / ( r(max)-r(min) )
sum revhear_sr revhear_sr_rs
* Locomotive
sum logwalk1n, meanonly
gen logwalk1n_rs = (logwalk1n - r(min) ) / ( r(max)-r(min) )
sum logwalk1n logwalk1n_rs
sum logtcs2, meanonly
gen logtcs2_rs = (logtcs2 - r(min) ) / ( r(max)-r(min) )
sum logtcs2 logtcs2_rs
sum balance, meanonly
gen balance_rs = (balance - r(min) ) / ( r(max)-r(min) )
sum balance balance_rs
* Vitality 
sum avg_grip_nomiss, meanonly
gen avg_grip_nomiss_rs = (avg_grip_nomiss - r(min) ) / ( r(max)-r(min) )
sum avg_grip_nomiss avg_grip_nomiss_rs
sum max_pef_miss, meanonly
gen max_pef_miss_rs = (max_pef_miss - r(min) ) / ( r(max)-r(min) )
sum max_pef_miss max_pef_miss_rs
sum wtls_rev, meanonly
gen wtls_rev_rs = (wtls_rev - r(min) ) / ( r(max)-r(min) )
sum wtls_rev wtls_rev_rs
* Psychological 
sum revnewds1, meanonly
gen revnewds1_rs = (revnewds1 - r(min) ) / ( r(max)-r(min) )
sum revnewds1 revnewds1_rs
sum revnewds2, meanonly
gen revnewds2_rs = (revnewds2 - r(min) ) / ( r(max)-r(min) )
sum revnewds2 revnewds2_rs
sum revnewds3, meanonly
gen revnewds3_rs = (revnewds3 - r(min) ) / ( r(max)-r(min) )
sum revnewds3 revnewds3_rs
sum revnewds4, meanonly
gen revnewds4_rs = (revnewds4 - r(min) ) / ( r(max)-r(min) )
sum revnewds4 revnewds4_rs
sum revnew_ds5, meanonly
gen revnew_ds5_rs = (revnew_ds5 - r(min) ) / ( r(max)-r(min) )
sum revnew_ds5 revnew_ds5_rs
sum revnewds6, meanonly
gen revnewds6_rs = (revnewds6 - r(min) ) / ( r(max)-r(min) )
sum revnewds6 revnewds6_rs
sum revnewds7, meanonly
gen revnewds7_rs = (revnewds7 - r(min) ) / ( r(max)-r(min) )
sum revnewds7 revnewds7_rs
sum revnew_ds8, meanonly
gen revnew_ds8_rs = (revnew_ds8 - r(min) ) / ( r(max)-r(min) )
sum revnew_ds8 revnew_ds8_rs
sum revnewds9, meanonly
gen revnewds9_rs = (revnewds9 - r(min) ) / ( r(max)-r(min) )
sum revnewds9 revnewds9_rs
sum revnewds10, meanonly
gen revnewds10_rs = (revnewds10 - r(min) ) / ( r(max)-r(min) )
sum revnewds10 revnewds10_rs
sum revnewds11, meanonly
gen revnewds11_rs = (revnewds11 - r(min) ) / ( r(max)-r(min) )
sum revnewds11 revnewds11_rs
* Drop unnecessary variables
drop avg_grip_nomiss max_pef_miss visuospatial orientation_bi rec_bi language_bi spell_bi wtls_rev hear_rev vis_rev revhear_sr logwalk1n logtcs2 balance revnewds1 revnewds2 revnewds3 revnewds4 revnew_ds5 revnewds6 revnewds7 revnew_ds8 revnewds9 revnewds10 revnewds11
* Save dataset with a new name
save mcmcmlirt_rsnew.dta
* Export dataset to .csv file
export delimited using mcmcmlirt_rsnew
clear

* Run Bayesian Multilevel Item Response Theory code from file "2025-10-10_R-script_v01.R" in RStudio

* Import the dataset containing the intrinsic capacity metric generated using Bayesian Multilevel Item Response Theory
import delimited "P:\projects\PEP\OMalkowski\Intrinsic capacity\mcmcmlirtrsnewdata.csv", numericcols(_all) 
* Rename studyid variable to ensure consistency with updated master dataset
rename studyid STUDYID
* Rename intrinsic capacity variable
rename icscore intrinsic3
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Save intrinsic capacity metric dataset with a new name
save mcmcmlirtrsnewdata.dta
clear

* Use updated master dataset
use comprehensive.dta 
* Merge updated master dataset with intrinsic capacity metric dataset
merge 1:1 STUDYID interval using mcmcmlirtrsnewdata.dta, generate(merge_mcmcrs)
* Keep comprehensive assessments that were not refused
keep if inlist(merge_mcmcrs,1,3)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 5168 observations
* Save dataset with a new name
save comprehensive_analyses.dta
* Keep data pertaining only to decedents
keep if merge_death==3
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 5038 observations
* Drop interval 8 (no comprehensive assessments took place at 126-month follow-up due to lack of funding)
drop if interval==8
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 4744 observations
* Overwrite dataset, by replacing the previously saved file
save comprehensive_analyses.dta, replace

* For each cognitive test, participants who correctly answered all relevant items were assigned a score of 1 and participants who answered any items incorrectly were assigned a score of 0
gen orientation_bi = 1 if orientation==10
replace orientation_bi = 0 if orientation<10
gen rec_bi = 1 if rec==3
replace rec_bi = 0 if rec<3
gen language_bi = 1 if language==8
replace language_bi = 0 if language<8
gen spell_bi = 1 if att_spell==5
replace spell_bi = 0 if att_spell<5
* Near-vision acuity (% impairment, collapsed into terciles) was reversed: ≥ 26.25 (coded as 0); ≥ 5.6 and < 26.25 (coded as 1); and < 5.6 (coded as 2)
gen vis_rev = 0 if vis3cat_raw==2
replace vis_rev = 1 if vis3cat_raw==1
replace vis_rev = 2 if vis3cat_raw==0
* Hearing impairment (evaluated with an Audioscope and based on the number of tones missed across 1000 and 2000 Hz measurements for the left and right ears) was reversed: 4 out of 4 tones missed (coded as 0); 2 or 3 out of 4 tones missed (coded as 1); and 0 or 1 out of 4 tones missed (coded as 2)
gen hear_rev = 0 if hear3cat_raw==2
replace hear_rev = 1 if hear3cat_raw==1
replace hear_rev = 2 if hear3cat_raw==0
* Self-reported hearing was reversed: "Poor" (coded as 1); "Fair" (coded as 2); "Good" (coded as 3); "Very good" (coded as 4); and "Excellent" (coded as 5)
revrs hear_sr
* The gait speed variable (time in seconds rounded to one decimal place) was log-transformed and reversed such that higher values reflected quicker times to complete the test
gen logwalk1n = log(walk1n)
replace logwalk1n = logwalk1n*-1
sum logwalk1n
replace logwalk1n = logwalk1n-r(min)
* The timed chair stands variable (time in seconds rounded to one decimal place) was log-transformed and reversed such that higher values reflected quicker times to complete the test
gen logtcs2 = log(tcs2)
replace logtcs2 = logtcs2*-1
sum logtcs2
replace logtcs2 = logtcs2-r(min)
* Code as 0 if participants responded "Yes" to the question asking them if they had lost more than 10 pounds in the last year
gen wtls_rev = 0 if fc1_wtlsraw==1
* Code as 1 if participants responded "No" to the question asking them if they had lost more than 10 pounds in the last year
replace wtls_rev = 1 if fc1_wtlsraw==0
* Round the hard coded values down to the nearest integer (so that there are only three response categories per item, and there isn't a fourth category with only one observation in analyses)
replace newds1 = 0 if newds1==0.5
replace new_ds5 = 1 if new_ds5==1.5
replace new_ds8 = 1 if new_ds8==1.5
* Reverse code all depressive symptom items
revrs newds1 newds2 newds3 newds4 new_ds5 newds6 newds7 new_ds8 newds9 newds10 newds11
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds1 = revnewds1-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds2 = revnewds2-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds3 = revnewds3-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds4 = revnewds4-1
* Response options: "Rarely or never" (coded as 0); "Some of the time" (coded as 1); and "Much or most of the time" (coded as 2)
replace revnew_ds5 = revnew_ds5-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds6 = revnewds6-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds7 = revnewds7-1
* Response options: "Rarely or never" (coded as 0); "Some of the time" (coded as 1); and "Much or most of the time" (coded as 2)
replace revnew_ds8 = revnew_ds8-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds9 = revnewds9-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds10 = revnewds10-1
* Response options: "Much or most of the time" (coded as 0); "Some of the time" (coded as 1); and "Rarely or never" (coded as 2)
replace revnewds11 = revnewds11-1

* Items comprising the intrinsic capacity construct were rescaled with the proportion of maximum scaling method so that values ranged from 0 to 1
* Cognitive 
sum orientation_bi, meanonly
gen orientation_bi_rs2 = (orientation_bi - r(min) ) / ( r(max)-r(min) )
sum orientation_bi orientation_bi_rs2
sum spell_bi, meanonly
gen spell_bi_rs2 = (spell_bi - r(min) ) / ( r(max)-r(min) )
sum spell_bi spell_bi_rs2
sum rec_bi, meanonly
gen rec_bi_rs2 = (rec_bi - r(min) ) / ( r(max)-r(min) )
sum rec_bi rec_bi_rs2
sum language_bi, meanonly
gen language_bi_rs2 = (language_bi - r(min) ) / ( r(max)-r(min) )
sum language_bi language_bi_rs2
sum visuospatial, meanonly
gen visuospatial_rs2 = (visuospatial - r(min) ) / ( r(max)-r(min) )
sum visuospatial visuospatial_rs2
* Sensory
sum vis_rev, meanonly
gen vis_rev_rs2 = (vis_rev - r(min) ) / ( r(max)-r(min) )
sum vis_rev vis_rev_rs2
sum hear_rev, meanonly
gen hear_rev_rs2 = (hear_rev - r(min) ) / ( r(max)-r(min) )
sum hear_rev hear_rev_rs2
sum revhear_sr, meanonly
gen revhear_sr_rs2 = (revhear_sr - r(min) ) / ( r(max)-r(min) )
sum revhear_sr revhear_sr_rs2
* Locomotive
sum logwalk1n, meanonly
gen logwalk1n_rs2 = (logwalk1n - r(min) ) / ( r(max)-r(min) )
sum logwalk1n logwalk1n_rs2
sum logtcs2, meanonly
gen logtcs2_rs2 = (logtcs2 - r(min) ) / ( r(max)-r(min) )
sum logtcs2 logtcs2_rs2
sum balance_new, meanonly
gen balance_rs2 = (balance_new - r(min) ) / ( r(max)-r(min) )
sum balance_new balance_rs2
* Vitality 
sum avg_grip_nomiss, meanonly
gen avg_grip_nomiss_rs2 = (avg_grip_nomiss - r(min) ) / ( r(max)-r(min) )
sum avg_grip_nomiss avg_grip_nomiss_rs2
sum max_pef_miss, meanonly
gen max_pef_miss_rs2 = (max_pef_miss - r(min) ) / ( r(max)-r(min) )
sum max_pef_miss max_pef_miss_rs2
sum wtls_rev, meanonly
gen wtls_rev_rs2 = (wtls_rev - r(min) ) / ( r(max)-r(min) )
sum wtls_rev wtls_rev_rs2
* Psychological 
sum revnewds1, meanonly
gen revnewds1_rs2 = (revnewds1 - r(min) ) / ( r(max)-r(min) )
sum revnewds1 revnewds1_rs2
sum revnewds2, meanonly
gen revnewds2_rs2 = (revnewds2 - r(min) ) / ( r(max)-r(min) )
sum revnewds2 revnewds2_rs2
sum revnewds3, meanonly
gen revnewds3_rs2 = (revnewds3 - r(min) ) / ( r(max)-r(min) )
sum revnewds3 revnewds3_rs2
sum revnewds4, meanonly
gen revnewds4_rs2 = (revnewds4 - r(min) ) / ( r(max)-r(min) )
sum revnewds4 revnewds4_rs2
sum revnew_ds5, meanonly
gen revnew_ds5_rs2 = (revnew_ds5 - r(min) ) / ( r(max)-r(min) )
sum revnew_ds5 revnew_ds5_rs2
sum revnewds6, meanonly
gen revnewds6_rs2 = (revnewds6 - r(min) ) / ( r(max)-r(min) )
sum revnewds6 revnewds6_rs2
sum revnewds7, meanonly
gen revnewds7_rs2 = (revnewds7 - r(min) ) / ( r(max)-r(min) )
sum revnewds7 revnewds7_rs2
sum revnew_ds8, meanonly
gen revnew_ds8_rs2 = (revnew_ds8 - r(min) ) / ( r(max)-r(min) )
sum revnew_ds8 revnew_ds8_rs2
sum revnewds9, meanonly
gen revnewds9_rs2 = (revnewds9 - r(min) ) / ( r(max)-r(min) )
sum revnewds9 revnewds9_rs2
sum revnewds10, meanonly
gen revnewds10_rs2 = (revnewds10 - r(min) ) / ( r(max)-r(min) )
sum revnewds10 revnewds10_rs2
sum revnewds11, meanonly
gen revnewds11_rs2 = (revnewds11 - r(min) ) / ( r(max)-r(min) )
sum revnewds11 revnewds11_rs2
* Generate domain scores, calculated as the mean of relevant items, multiplied by 100
gen cognitive_mean = (orientation_bi_rs2 + spell_bi_rs2 + rec_bi_rs2 + language_bi_rs2 + visuospatial_rs2)/5
replace cognitive_mean = cognitive_mean*100
gen sensory_mean = (vis_rev_rs2 + hear_rev_rs2 + revhear_sr_rs2)/3
replace sensory_mean = sensory_mean*100
gen locomotive_mean = (logwalk1n_rs2 + logtcs2_rs2 + balance_rs2)/3
replace locomotive_mean = locomotive_mean*100
gen vitality_mean = (avg_grip_nomiss_rs2 + max_pef_miss_rs2 + wtls_rev_rs2)/3
replace vitality_mean = vitality_mean*100
gen psychological_mean = (revnewds1_rs2 + revnewds2_rs2 + revnewds3_rs2 + revnewds4_rs2 + revnew_ds5_rs2 + revnewds6_rs2 + revnewds7_rs2 + revnew_ds8_rs2 + revnewds9_rs2 + revnewds10_rs2 + revnewds11_rs2)/11
replace psychological_mean = psychological_mean*100
* Generate a "simpler" intrinsic capacity score, calculated as the mean of five domain scores
gen intrinsic_pomp = (cognitive_mean + sensory_mean + locomotive_mean + vitality_mean + psychological_mean)/5
sum intrinsic_pomp
* Overwrite dataset, by replacing the previously saved file
save comprehensive_analyses.dta, replace

* Descriptive characteristics (Table 1)
* Age at death (years)
gen ageatdeath = floor((DDate2-BDates) / 365.25)
* Mean age at death
sum ageatdeath if interval==1
* Mean age at baseline 
sum age_fix if interval==1
* Other baseline characteristics of decedents 
tab sex_cons if interval==1
tab eth_bi if interval==1
sum edu_cons if interval==1
sum raw_ccsumbl2 if interval==1
tab iadldep_bi if interval==1

* Perform a Shapiro-Wilk test for normality
swilk intrinsic3 
swilk intrinsic_pomp
* Perform a Pearson correlation (large sample size) to quantify the relationship between the metric generated using Bayesian Multilevel Item Response Theory and the "simpler" intrinsic capacity score
pwcorr intrinsic3 intrinsic_pomp, sig star(.05) obs 
correlate intrinsic3 intrinsic_pomp
ci2 intrinsic3 intrinsic_pomp, corr
* Overwrite dataset, by replacing the previously saved file
save comprehensive_analyses.dta, replace
clear

* Import monthly data
import sas using "P:\projects\PEP\Master\pepmonth_le123124\pepmonth_le123124.sas7bdat"
* Rename StudyID variable to ensure consistency with updated master dataset
rename StudyID STUDYID
* Generate a variable that assigns the observation number (i.e., 1 for first data collection timepoint, 2 for second data collection timepoint) to each row by participant ID
bysort STUDYID(intbloc): gen obsnr_m = _n
* Generate a variable that assigns the number of total observations to each row of data for a given participant
bysort STUDYID: gen obscount_m = _N

** Disability during the monthly interviews
gen act8n = ACT8
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to shop (go to the store)?"
replace act8n = 0 if act8n==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace act8n = 1 if inlist(act8n,2,3)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace act8n = . if inlist(act8n,7,8)
gen act9n = ACT9
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to do housework, such as washing the dishes, taking out the trash, or washing/cleaning the floor?"
replace act9n = 0 if act9n==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace act9n = 1 if inlist(act9n,2,3)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace act9n = . if inlist(act9n,7,8)
gen act10n = ACT10
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to prepare a meal?"
replace act10n = 0 if act10n==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace act10n = 1 if inlist(act10n,2,3)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace act10n = . if inlist(act10n,7,8)
gen act11n = ACT11
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to take your medications?"
replace act11n = 0 if act11n==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace act11n = 1 if inlist(act11n,2,3)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace act11n = . if inlist(act11n,7,8)
gen act12n = ACT12
* Code as 0 if the participant responds "No help" to the question "At the present time, do you need help from another person to manage your finances, such as paying the bills?"
replace act12n = 0 if act12n==1
* Code as 1 if the participant responds "Help" or "Unable to do"
replace act12n = 1 if inlist(act12n,2,3)
* Observations coded as "Refused" or "Don't know" were treated as missing cases
replace act12n = . if inlist(act12n,7,8)

*** Sum
* Generate a count of the number of IADL requiring personal assistance
gen instrumental = act8n + act9n + act10n + act11n + act12n
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 87704 observations
* Save dataset with a new name
save monthly.dta
clear

* Use updated master dataset
use comprehensive.dta
* Keep interview dates of comprehensive assessments and other relevant variables
keep STUDYID interval intdateF2F 
* Reshape data into wide format for observations identified by participant ID and add interval as an identifying time period
reshape wide intdateF2F, i(STUDYID) j(interval)
* Generate a new variable called interval and assign the number 1 to each observation
generate interval = 1
* Save interview dates dataset with a new name
save wide_intdateF2F.dta
clear

* Use monthly dataset
use monthly.dta 
* Merge monthly dataset with interview dates dataset
merge m:1 STUDYID using wide_intdateF2F.dta, generate(merge_date)
* Keep if matched
keep if merge_date==3
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 87704 observations
* Overwrite dataset, by replacing the previously saved file
save monthly.dta, replace
clear 

* Import temporary interview dates 
import sas using "P:\projects\PEP\sas\OTHER Source pgm\f2fdates_306.sas7bdat"
* Change working directory
cd "P:\projects\PEP\OMalkowski\Intrinsic capacity"
* Rename StudyID variable to ensure consistency with monthly dataset
rename StudyID STUDYID
* Save temporary interview dates dataset with a new name
save wide_tmpdates.dta
clear 

* Use monthly dataset
use monthly.dta
* Merge monthly dataset with temporary interview dates dataset
merge m:1 STUDYID using wide_tmpdates.dta, generate(merge_date2)
* Keep if matched
keep if merge_date2==3
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 87704 observations
* Overwrite dataset, by replacing the previously saved file
save monthly.dta, replace

* Generate a variable that allows data from the comprehensive assessments to be merged with and carried forward to all monthly observations between consecutive comprehensive assessments
gen interval4 = 1 if intdate>=tmpdate0 & intdate<tmpdate18
replace interval4 = 2 if intdate>=tmpdate18 & intdate<tmpdate36
replace interval4 = 3 if intdate>=tmpdate36 & intdate<tmpdate54
replace interval4 = 4 if intdate>=tmpdate54 & intdate<tmpdate72
replace interval4 = 5 if intdate>=tmpdate72 & intdate<tmpdate90
replace interval4 = 6 if intdate>=tmpdate90 & intdate<tmpdate108
replace interval4 = 7 if intdate>=tmpdate108 & intdate<tmpdate126
replace interval4 = 8 if intdate>=tmpdate126 & intdate<tmpdate144
replace interval4 = 9 if intdate>=tmpdate144 & intdate<tmpdate162
replace interval4 = 10 if intdate>=tmpdate162 & intdate<tmpdate180
replace interval4 = 11 if intdate>=tmpdate180 & intdate<tmpdate198
replace interval4 = 12 if intdate>=tmpdate198 & intdate<tmpdate216
replace interval4 = 13 if intdate>=tmpdate216 & intdate<tmpdate234
replace interval4 = 14 if intdate>=tmpdate234 & intdate<tmpdate252
replace interval4 = 15 if intdate>=tmpdate252 & intdate<tmpdate270
replace interval4 = 16 if intdate>=tmpdate270 & intdate<tmpdate288
replace interval4 = 17 if intdate>=tmpdate288 & intdate<tmpdate306
replace interval4 = 18 if intdate>=tmpdate306 & intdate<.
* Two participants died before their first monthly interview, but took part in the baseline comprehensive assessment
replace interval4 = 1 if STUDYID==1523 & intbloc==1
replace interval4 = 1 if STUDYID==2409 & intbloc==1
* Overwrite dataset, by replacing the previously saved file
save monthly.dta, replace
clear

* Use dataset with all observations pertaining to decedents (including placeholder for interval 8)
use wave8temp.dta 
* Keep temporary interview dates of 126-month follow-up comprehensive assessments and other relevant variables
keep STUDYID interval tmpdate126
* Save 126-month follow-up temporary interview dates dataset with a new name
save wave8merge.dta
clear

* Use updated master dataset (decedents)
use comprehensive_analyses.dta
* Assigns a number in ascending order to each row of observations
gen ascnr2 = _n 
* Generate a variable that assigns the observation number (i.e., 1 for first data collection timepoint, 2 for second data collection timepoint) to each row by participant ID
bysort STUDYID(interval): gen obsnr2 = _n
* Generate a variable that assigns the number of total observations to each row of data for a given participant
bysort STUDYID: gen obscount2 = _N
* Summarise the average number of comprehensive assessments completed by decedents
sum obscount2 if obsnr2==1 
clear

* Use updated master dataset (decedents)
use comprehensive_analyses.dta
* Merge updated master dataset (decedents) with 126-month follow-up temporary interview dates dataset
merge 1:1 STUDYID interval using wave8merge.dta, generate(merge_8)
* Sort by participant ID and interval (lowest to highest)
sort STUDYID interval
* Carryforward observations with respect to the time variable "interval" (i.e., from interval 7 to the follow-up comprehensive assessments) by participant ID, and replace values at interval 8 with values from interval 7
gen ageatdeath_cons = ageatdeath if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward ageatdeath_cons, replace
replace ageatdeath = ageatdeath_cons if interval==8
gen sex_cons_cons = sex_cons if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward sex_cons_cons, replace
replace sex_cons = sex_cons_cons if interval==8
gen eth_bi_cons = eth_bi if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward eth_bi_cons, replace
replace eth_bi = eth_bi_cons if interval==8
gen edu_cons_cons = edu_cons if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward edu_cons_cons, replace
replace edu_cons = edu_cons_cons if interval==8
gen raw_ccsumbl2_cons = raw_ccsumbl2 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward raw_ccsumbl2_cons, replace
replace raw_ccsumbl2 = raw_ccsumbl2_cons if interval==8
gen intrinsic_cons = intrinsic3 if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward intrinsic_cons, replace
replace intrinsic3 = intrinsic_cons if interval==8
gen cognitive_mean_cons = cognitive_mean if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward cognitive_mean_cons, replace
replace cognitive_mean = cognitive_mean_cons if interval==8
gen sensory_mean_cons = sensory_mean if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward sensory_mean_cons, replace
replace sensory_mean = sensory_mean_cons if interval==8
gen locomotive_mean_cons = locomotive_mean if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward locomotive_mean_cons, replace
replace locomotive_mean = locomotive_mean_cons if interval==8
gen vitality_mean_cons = vitality_mean if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward vitality_mean_cons, replace
replace vitality_mean = vitality_mean_cons if interval==8
gen psychological_mean_cons = psychological_mean if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward psychological_mean_cons, replace
replace psychological_mean = psychological_mean_cons if interval==8
gen intrinsic_pomp_cons = intrinsic_pomp if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward intrinsic_pomp_cons, replace
replace intrinsic_pomp = intrinsic_pomp_cons if interval==8
gen iadldep_cons = iadldep if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward iadldep_cons, replace
replace iadldep = iadldep_cons if interval==8
gen iadldep_bi_cons = iadldep_bi if interval==7
tsset STUDYID interval 
bysort STUDYID: carryforward iadldep_bi_cons, replace
replace iadldep_bi = iadldep_bi_cons if interval==8
* Overwrite dataset, by replacing the previously saved file
save comprehensive_analyses.dta, replace

* Keep necessary variables from the comprehensive assessments
keep STUDYID interval ageatdeath sex_cons eth_bi edu_cons raw_ccsumbl2 intrinsic3 cognitive_mean sensory_mean locomotive_mean vitality_mean psychological_mean intrinsic_pomp iadldep iadldep_bi
* Rename variable to ensure consistency with the monthly dataset
rename interval interval4
* Save comprehensive assessment variables dataset with a new name
save comprehensive_merge.dta
clear

* Use monthly dataset
use monthly.dta
* Merge monthly dataset with comprehensive assessment variables dataset
merge m:1 STUDYID interval4 using comprehensive_merge.dta, generate(merge_f2f)
* Keep all observations from the monthly dataset
keep if inlist(merge_f2f,1,3)
* Count total number of participants and observations
unique STUDYID
* 754 individuals, 87704 observations
* Save dataset with a new name
save monthly_analysis.dta

* Time before death (i.e., date of death minus date of monthly interview rounded to the nearest integer) in months (anchored to participants' date of death)
gen timetodeath = (DDate-intdate)/(365/12)
replace timetodeath = round(timetodeath,1)
gen timetodeath_rev = timetodeath*-1

* Time to death from baseline (i.e., date of death minus date of baseline comprehensive assessment rounded to the nearest integer) in months (anchored to participants' date of death)
gen timetodeath_bl = (DDate-intdateF2F1)/(365/12)
replace timetodeath_bl = round(timetodeath_bl,1)
gen timetodeath_rev_bl = timetodeath_bl*-1

* Transform the unit of the time before death and time to death variables from months to years for descriptive purposes
gen timetodeath_yr = timetodeath/12
gen timetodeath_bl_yr = timetodeath_bl/12
sum timetodeath_yr if intbloc==1,d
* Calculate the median time to death from baseline
sum timetodeath_bl_yr if intbloc==1,d
* Perform a Shapiro-Wilk test for normality
swilk timetodeath_bl_yr if intbloc==1
* Calculate the interquartile range
tabstat timetodeath_bl_yr if intbloc==1, statistics(iqr)

* Generate the time to death from baseline variable (in months and years) without rounding to the nearest integer
gen timetodeath_bl2 = (DDate-intdateF2F1)/(365/12)
gen timetodeath_bl2_yr = timetodeath_bl2/12
* Calculate the median time to death from baseline
sum timetodeath_bl2_yr if intbloc==1,d
* Calculate the interquartile range
tabstat timetodeath_bl2_yr if intbloc==1, statistics(iqr)
* Overwrite dataset, by replacing the previously saved file
save monthly_analysis.dta, replace

* Keep data pertaining only to decedents
keep if Died==1
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 85434 observations
* Time to refusal from baseline (i.e., date of refusal minus date of baseline comprehensive assessment) in months
gen timebaserefusal = (daterefuse-intdateF2F1)/(365/12)
* Keep one observation per participant and limit observations to permanent refusers
replace timebaserefusal = . if intbloc!=1
replace timebaserefusal = . if permrefuser==0
* Calculate the median time to refusal from baseline
sum timebaserefusal,d 
* Perform a Shapiro-Wilk test for normality
swilk timebaserefusal
* Calculate the interquartile range
tabstat timebaserefusal, statistics(iqr)

* Keep necessary variables for time-varying effect modeling analyses
keep STUDYID Died DDate intdate intbloc interval4 timetodeath_rev instrumental ageatdeath sex_cons eth_bi edu_cons raw_ccsumbl2 intrinsic3 cognitive_mean sensory_mean locomotive_mean vitality_mean psychological_mean intrinsic_pomp iadldep iadldep_bi
* Count total number of participants and observations
unique STUDYID 
* 746 individuals, 85434 observations 
* Generate intercept variable for time-varying effect modeling analyses
gen intercept = 1
* Save analysis dataset with a new name
save decedents_monthly.dta
* Assigns a number in ascending order to each row of observations
gen ascnr = _n
* Generate a variable that assigns the observation number (i.e., 1 for first data collection timepoint, 2 for second data collection timepoint) to each row by participant ID
bysort STUDYID(intdate): gen obsnr = _n
* Generate a variable that assigns the number of total observations to each row of data for a given participant
bysort STUDYID: gen obscount = _N
* Summarise the average number of monthly interviews completed by decedents
sum obscount if obsnr==1 
clear

* Use analysis dataset
use decedents_monthly.dta
* Count total number of participants and observations with non-missing time before death variable
unique STUDYID if timetodeath_rev!=.
* 744 individuals, 85432 observations (two participants died before their first monthly interview)
tab STUDYID if timetodeath_rev==.
tab instrumental
tab timetodeath_rev
* Observations from more than 20 years before death were omitted
drop if timetodeath_rev<-240
* Sample size for Figure 2A
unique STUDYID if intrinsic3!=. & timetodeath_rev!=.
* 743 individuals, 81047 observations (one additional participant withdrew from the study more than 20 years before death)
* Check the distribution of the disability count variable
sum instrumental,d
histogram instrumental
* Generate a variable replicating the disability count variable
gen instrumental_bi = instrumental 
* Collapse to 1 if the participant is dependent in one or more IADL
replace instrumental_bi = 1 if inlist(instrumental_bi,1,2,3,4,5)
* Sample size for Figure 2B
unique STUDYID if instrumental_bi!=. & timetodeath_rev!=.
* 743 individuals, 83182 observations
* Sample size for Figure 3
unique STUDYID if instrumental_bi!=. & timetodeath_rev!=. & intrinsic3!=.
* 743 individuals, 80601 observations
* Divide the metric generated using Bayesian Multilevel Item Response Theory and the "simpler" intrinsic capacity score by ten, so that results can be interpreted per 10-point increase in intrinsic capacity score
gen tenunits = intrinsic3/10
gen tenunitsp = intrinsic_pomp/10
* Save main analysis dataset with a new name
save ADLsample.dta
* Count total number of participants and observations
unique STUDYID 
* 745 individuals, 83909 observations
* Keep data pertaining only to male decedents
keep if sex_cons==0
* Count total number of participants and observations
unique STUDYID 
* 266 individuals, 27598 observations 
* Save male dataset with a new name
save male.dta 
clear 
* Use main analysis dataset
use ADLsample.dta
* Keep data pertaining only to female decedents
keep if sex_cons==1
* Count total number of participants and observations
unique STUDYID 
* 479 individuals, 55367 observations 
* Save female dataset with a new name
save female.dta 
clear 

* Use main analysis dataset
use ADLsample.dta
* Sample size for Supplementary Figure S1A (male)
unique STUDYID if intrinsic3!=. & timetodeath_rev!=. & sex_cons==0
* 264 individuals, 27265 observations
* Sample size for Supplementary Figure S1A (female)
unique STUDYID if intrinsic3!=. & timetodeath_rev!=. & sex_cons==1
* 479 individuals, 53782 observations
* Sample size for Supplementary Figure S1B (male)
unique STUDYID if instrumental_bi!=. & timetodeath_rev!=. & sex_cons==0
* 264 individuals, 27484 observations
* Sample size for Supplementary Figure S1B (female)
unique STUDYID if instrumental_bi!=. & timetodeath_rev!=. & sex_cons==1
* 479 individuals, 55024 observations
* Sample size for Supplementary Figure S2
unique STUDYID if intrinsic_pomp!=. & timetodeath_rev!=.
* 740 participants, 74369 observations (three additional decedents were missing data on the "simpler" intrinsic capacity score at all the comprehensive assessments they took part in)
* Sample size for Supplementary Figure S3 (male)
unique STUDYID if intrinsic3!=. & timetodeath_rev!=. & instrumental_bi!=. & sex_cons==0
* 264 individuals, 27155 observations
* Sample size for Supplementary Figure S3 (female)
unique STUDYID if intrinsic3!=. & timetodeath_rev!=. & instrumental_bi!=. & sex_cons==1
* 479 individuals, 53446 observations
* Sample size for Supplementary Figure S4
unique STUDYID if intrinsic_pomp!=. & timetodeath_rev!=. & instrumental_bi!=.
* 740 individuals, 73977 observations
clear

* Run time-varying effect modeling code from file "2025-10-10_SAS-input_v01.docx" in SAS