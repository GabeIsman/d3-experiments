/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 34981
 |                NATIONAL PRISONER STATISTICS, 1978-2012
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 34981-0001-statasetup.do)
 |
 **************************************************************************/

set mem 8m  /* Allocating 8 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */


set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "data-filename"
local dict "dictionary-filename"
local outfile "stata-datafile"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear


/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "National Prisoner Statistics, 1978-2012"

#delimit ;
label define STATEID   1 "01. Alabama" 2 "02. Alaska" 4 "04. Arizona"
                       5 "05. Arkansas" 6 "06. California" 8 "08. Colorado"
                       9 "09. Connecticut" 10 "10. Delaware"
                       11 "11. District of Columbia" 12 "12. Florida"
                       13 "13. Georgia" 15 "15. Hawaii" 16 "16. Idaho"
                       17 "17. Illinois" 18 "18. Indiana" 19 "19. Iowa"
                       20 "20. Kansas" 21 "21. Kentucky" 22 "22. Louisiana"
                       23 "23. Maine" 24 "24. Maryland"
                       25 "25. Massachusetts" 26 "26. Michigan"
                       27 "27. Minnesota" 28 "28. Mississippi"
                       29 "29. Missouri" 30 "30. Montana" 31 "31. Nebraska"
                       32 "32. Nevada" 33 "33. New Hampshire"
                       34 "34. New Jersey" 35 "35. New Mexico"
                       36 "36. New York" 37 "37. North Carolina"
                       38 "38. North Dakota" 39 "39. Ohio" 40 "40. Oklahoma"
                       41 "41. Oregon" 42 "42. Pennsylvania"
                       44 "44. Rhode Island" 45 "45. South Carolina"
                       46 "46. South Dakota" 47 "47. Tennessee"
                       48 "48. Texas" 49 "49. Utah" 50 "50. Vermont"
                       51 "51. Virginia"
                       52 "52. Jurisdiction shared between States"
                       53 "53. Washington" 54 "54. West Virginia"
                       55 "55. Wisconsin" 56 "56. Wyoming"
                       60 "State prison total"
                       70 "US prison total (state+federal)" 99 "Federal BOP" ;
label define REGION    1 "Northeast" 2 "Midwest" 3 "South" 4 "West"
                       5 "U.S. total" 6 "Federal Bureau of Prisons"
                       7 "State total" ;
label define CUSGT1M
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSGT1F
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSLT1M
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSLT1F
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSUNSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSUNSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSTOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSTOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSGT1T
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSLT1T
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSUNST
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSTOTT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CNOPRIVM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CNOPRIVF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CWPRIVM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CWPRIVF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURGT1M
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURGT1F
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURLT1M
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURLT1F
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURUNSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURUNSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURTOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define JURTOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PVINM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PVINF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PVOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PVOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PVINCLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define PVINCLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define LFM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFINCLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define LFINCLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define LFCROWDM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFCROWDF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFCRSTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFCRSTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFCRINCM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define LFCRINCF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FEDM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FEDF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define OTHSTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define OTHSTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FACINCLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define FACINCLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" 1 "Yes"
                       2 "No" ;
label define FACROWDM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FACROWDF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define WHITEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define WHITEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define BLACKM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define BLACKF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HISPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HISPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define AIANM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define AIANF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ASIANM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ASIANF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define NHPIM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define NHPIF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define APIM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define APIF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TWORACEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TWORACEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADDRACEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADDRACEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define UNKRACEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define UNKRACEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TOTRACEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TOTRACEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define NOTHISPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define NOTHISPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define UNKHISPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define UNKHISPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TOTHCATM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define TOTHCATF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define COMMITM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define COMMITF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PARNEWM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PARNEWF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PARNOM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define PARNOF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADCRNEWM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADCRNEWF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADCRNOM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADCRNOF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADTRANSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADTRANSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADAWOLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADAWOLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADESCAPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADESCAPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADAWESM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADAWESF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADRETM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADRETF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADTOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define ADTOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNEXPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNEXPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNCOMM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNCOMF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLUNOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOPROM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOPROF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOSUPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOSUPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCODPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCODPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLCOOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLDEATHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLDEATHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLAWOLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLAWOLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLESCAPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLESCAPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLAWESM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLAWESF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLTRANM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLTRANF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLBONDM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLBONDF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLTOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define RLTOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLOJANM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLOJANF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLOADMM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLOADMF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLORLM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLORLF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLODECM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define FLODECF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPRATEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPRATEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPOPM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPOPF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPDESM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPDESF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPRATET
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPOPT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CAPDEST
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVTEST
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVINC
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVCUR
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVREL
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVRAN
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVCERT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVHIGH
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVREQ
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVORD
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVCLIN
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVINCID
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVOTH
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVASYMM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVASYMF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVASYMT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVLESSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVLESSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVLESST
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define AIDSCONM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define AIDSCONF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define AIDSCONT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVATOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVATOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HIVATOTT
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -7 "Item was asked for both males and females, but only aggregate was reported"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSLT18M
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSLT18F
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSCTZNM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define CUSCTZNF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHEXECM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHEXECF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHILLNM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHILLNF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHAIDSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHAIDSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHSUICM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHSUICF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHACCM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHACCF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHHOMIM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHHOMIF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHHOMOM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHHOMOF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHPERSM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHPERSF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHOTHM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHOTHF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHTOTM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define DTHTOTF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HANDLEM
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;
label define HANDLEF
                       -9 "Data are missing because the state did not respond to the item"
                       -8 "Data are missing because the item was not applicable to the state"
                       -2 "Item was asked, but only in the aggregate prison population, not by male or female"
                       -1 "Item not asked in survey for this year" ;


#delimit cr


/***************************************************************************

 Section 4: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
replace YEAR = . if (YEAR >= -9 & YEAR <= -1)
replace STATEID = . if (STATEID >= -9 & STATEID <= -1)
replace REGION = . if (REGION >= -9 & REGION <= -1)
replace CUSGT1M = . if (CUSGT1M >= -9 & CUSGT1M <= -1)
replace CUSGT1F = . if (CUSGT1F >= -9 & CUSGT1F <= -1)
replace CUSLT1M = . if (CUSLT1M >= -9 & CUSLT1M <= -1)
replace CUSLT1F = . if (CUSLT1F >= -9 & CUSLT1F <= -1)
replace CUSUNSM = . if (CUSUNSM >= -9 & CUSUNSM <= -1)
replace CUSUNSF = . if (CUSUNSF >= -9 & CUSUNSF <= -1)
replace CUSTOTM = . if (CUSTOTM >= -9 & CUSTOTM <= -1)
replace CUSTOTF = . if (CUSTOTF >= -9 & CUSTOTF <= -1)
replace CUSGT1T = . if (CUSGT1T >= -9 & CUSGT1T <= -1)
replace CUSLT1T = . if (CUSLT1T >= -9 & CUSLT1T <= -1)
replace CUSUNST = . if (CUSUNST >= -9 & CUSUNST <= -1)
replace CUSTOTT = . if (CUSTOTT >= -9 & CUSTOTT <= -1)
replace CNOPRIVM = . if (CNOPRIVM >= -9 & CNOPRIVM <= -1)
replace CNOPRIVF = . if (CNOPRIVF >= -9 & CNOPRIVF <= -1)
replace CWPRIVM = . if (CWPRIVM >= -9 & CWPRIVM <= -1)
replace CWPRIVF = . if (CWPRIVF >= -9 & CWPRIVF <= -1)
replace JURGT1M = . if (JURGT1M >= -9 & JURGT1M <= -1)
replace JURGT1F = . if (JURGT1F >= -9 & JURGT1F <= -1)
replace JURLT1M = . if (JURLT1M >= -9 & JURLT1M <= -1)
replace JURLT1F = . if (JURLT1F >= -9 & JURLT1F <= -1)
replace JURUNSM = . if (JURUNSM >= -9 & JURUNSM <= -1)
replace JURUNSF = . if (JURUNSF >= -9 & JURUNSF <= -1)
replace JURTOTM = . if (JURTOTM >= -9 & JURTOTM <= -1)
replace JURTOTF = . if (JURTOTF >= -9 & JURTOTF <= -1)
replace PVINM = . if (PVINM >= -9 & PVINM <= -1)
replace PVINF = . if (PVINF >= -9 & PVINF <= -1)
replace PVOTHM = . if (PVOTHM >= -9 & PVOTHM <= -1)
replace PVOTHF = . if (PVOTHF >= -9 & PVOTHF <= -1)
replace PVINCLM = . if (PVINCLM >= -9 & PVINCLM <= -1)
replace PVINCLF = . if (PVINCLF >= -9 & PVINCLF <= -1)
replace LFM = . if (LFM >= -9 & LFM <= -1)
replace LFF = . if (LFF >= -9 & LFF <= -1)
replace LFINCLM = . if (LFINCLM >= -9 & LFINCLM <= -1)
replace LFINCLF = . if (LFINCLF >= -9 & LFINCLF <= -1)
replace LFCROWDM = . if (LFCROWDM >= -9 & LFCROWDM <= -1)
replace LFCROWDF = . if (LFCROWDF >= -9 & LFCROWDF <= -1)
replace LFCRSTM = . if (LFCRSTM >= -9 & LFCRSTM <= -1)
replace LFCRSTF = . if (LFCRSTF >= -9 & LFCRSTF <= -1)
replace LFCRINCM = . if (LFCRINCM >= -9 & LFCRINCM <= -1)
replace LFCRINCF = . if (LFCRINCF >= -9 & LFCRINCF <= -1)
replace FEDM = . if (FEDM >= -9 & FEDM <= -1)
replace FEDF = . if (FEDF >= -9 & FEDF <= -1)
replace OTHSTM = . if (OTHSTM >= -9 & OTHSTM <= -1)
replace OTHSTF = . if (OTHSTF >= -9 & OTHSTF <= -1)
replace FACINCLM = . if (FACINCLM >= -9 & FACINCLM <= -1)
replace FACINCLF = . if (FACINCLF >= -9 & FACINCLF <= -1)
replace FACROWDM = . if (FACROWDM >= -9 & FACROWDM <= -1)
replace FACROWDF = . if (FACROWDF >= -9 & FACROWDF <= -1)
replace WHITEM = . if (WHITEM >= -9 & WHITEM <= -1)
replace WHITEF = . if (WHITEF >= -9 & WHITEF <= -1)
replace BLACKM = . if (BLACKM >= -9 & BLACKM <= -1)
replace BLACKF = . if (BLACKF >= -9 & BLACKF <= -1)
replace HISPM = . if (HISPM >= -9 & HISPM <= -1)
replace HISPF = . if (HISPF >= -9 & HISPF <= -1)
replace AIANM = . if (AIANM >= -9 & AIANM <= -1)
replace AIANF = . if (AIANF >= -9 & AIANF <= -1)
replace ASIANM = . if (ASIANM >= -9 & ASIANM <= -1)
replace ASIANF = . if (ASIANF >= -9 & ASIANF <= -1)
replace NHPIM = . if (NHPIM >= -9 & NHPIM <= -1)
replace NHPIF = . if (NHPIF >= -9 & NHPIF <= -1)
replace APIM = . if (APIM >= -9 & APIM <= -1)
replace APIF = . if (APIF >= -9 & APIF <= -1)
replace TWORACEM = . if (TWORACEM >= -9 & TWORACEM <= -1)
replace TWORACEF = . if (TWORACEF >= -9 & TWORACEF <= -1)
replace ADDRACEM = . if (ADDRACEM >= -9 & ADDRACEM <= -1)
replace ADDRACEF = . if (ADDRACEF >= -9 & ADDRACEF <= -1)
replace UNKRACEM = . if (UNKRACEM >= -9 & UNKRACEM <= -1)
replace UNKRACEF = . if (UNKRACEF >= -9 & UNKRACEF <= -1)
replace TOTRACEM = . if (TOTRACEM >= -9 & TOTRACEM <= -1)
replace TOTRACEF = . if (TOTRACEF >= -9 & TOTRACEF <= -1)
replace NOTHISPM = . if (NOTHISPM >= -9 & NOTHISPM <= -1)
replace NOTHISPF = . if (NOTHISPF >= -9 & NOTHISPF <= -1)
replace UNKHISPM = . if (UNKHISPM >= -9 & UNKHISPM <= -1)
replace UNKHISPF = . if (UNKHISPF >= -9 & UNKHISPF <= -1)
replace TOTHCATM = . if (TOTHCATM >= -9 & TOTHCATM <= -1)
replace TOTHCATF = . if (TOTHCATF >= -9 & TOTHCATF <= -1)
replace COMMITM = . if (COMMITM >= -9 & COMMITM <= -1)
replace COMMITF = . if (COMMITF >= -9 & COMMITF <= -1)
replace PARNEWM = . if (PARNEWM >= -9 & PARNEWM <= -1)
replace PARNEWF = . if (PARNEWF >= -9 & PARNEWF <= -1)
replace PARNOM = . if (PARNOM >= -9 & PARNOM <= -1)
replace PARNOF = . if (PARNOF >= -9 & PARNOF <= -1)
replace ADCRNEWM = . if (ADCRNEWM >= -9 & ADCRNEWM <= -1)
replace ADCRNEWF = . if (ADCRNEWF >= -9 & ADCRNEWF <= -1)
replace ADCRNOM = . if (ADCRNOM >= -9 & ADCRNOM <= -1)
replace ADCRNOF = . if (ADCRNOF >= -9 & ADCRNOF <= -1)
replace ADTRANSM = . if (ADTRANSM >= -9 & ADTRANSM <= -1)
replace ADTRANSF = . if (ADTRANSF >= -9 & ADTRANSF <= -1)
replace ADAWOLM = . if (ADAWOLM >= -9 & ADAWOLM <= -1)
replace ADAWOLF = . if (ADAWOLF >= -9 & ADAWOLF <= -1)
replace ADESCAPM = . if (ADESCAPM >= -9 & ADESCAPM <= -1)
replace ADESCAPF = . if (ADESCAPF >= -9 & ADESCAPF <= -1)
replace ADAWESM = . if (ADAWESM >= -9 & ADAWESM <= -1)
replace ADAWESF = . if (ADAWESF >= -9 & ADAWESF <= -1)
replace ADRETM = . if (ADRETM >= -9 & ADRETM <= -1)
replace ADRETF = . if (ADRETF >= -9 & ADRETF <= -1)
replace ADOTHM = . if (ADOTHM >= -9 & ADOTHM <= -1)
replace ADOTHF = . if (ADOTHF >= -9 & ADOTHF <= -1)
replace ADTOTM = . if (ADTOTM >= -9 & ADTOTM <= -1)
replace ADTOTF = . if (ADTOTF >= -9 & ADTOTF <= -1)
replace RLUNEXPM = . if (RLUNEXPM >= -9 & RLUNEXPM <= -1)
replace RLUNEXPF = . if (RLUNEXPF >= -9 & RLUNEXPF <= -1)
replace RLUNCOMM = . if (RLUNCOMM >= -9 & RLUNCOMM <= -1)
replace RLUNCOMF = . if (RLUNCOMF >= -9 & RLUNCOMF <= -1)
replace RLUNOTHM = . if (RLUNOTHM >= -9 & RLUNOTHM <= -1)
replace RLUNOTHF = . if (RLUNOTHF >= -9 & RLUNOTHF <= -1)
replace RLCOPROM = . if (RLCOPROM >= -9 & RLCOPROM <= -1)
replace RLCOPROF = . if (RLCOPROF >= -9 & RLCOPROF <= -1)
replace RLCOSUPM = . if (RLCOSUPM >= -9 & RLCOSUPM <= -1)
replace RLCOSUPF = . if (RLCOSUPF >= -9 & RLCOSUPF <= -1)
replace RLCODPM = . if (RLCODPM >= -9 & RLCODPM <= -1)
replace RLCODPF = . if (RLCODPF >= -9 & RLCODPF <= -1)
replace RLCOOTHM = . if (RLCOOTHM >= -9 & RLCOOTHM <= -1)
replace RLCOOTHF = . if (RLCOOTHF >= -9 & RLCOOTHF <= -1)
replace RLDEATHM = . if (RLDEATHM >= -9 & RLDEATHM <= -1)
replace RLDEATHF = . if (RLDEATHF >= -9 & RLDEATHF <= -1)
replace RLAWOLM = . if (RLAWOLM >= -9 & RLAWOLM <= -1)
replace RLAWOLF = . if (RLAWOLF >= -9 & RLAWOLF <= -1)
replace RLESCAPM = . if (RLESCAPM >= -9 & RLESCAPM <= -1)
replace RLESCAPF = . if (RLESCAPF >= -9 & RLESCAPF <= -1)
replace RLAWESM = . if (RLAWESM >= -9 & RLAWESM <= -1)
replace RLAWESF = . if (RLAWESF >= -9 & RLAWESF <= -1)
replace RLTRANM = . if (RLTRANM >= -9 & RLTRANM <= -1)
replace RLTRANF = . if (RLTRANF >= -9 & RLTRANF <= -1)
replace RLBONDM = . if (RLBONDM >= -9 & RLBONDM <= -1)
replace RLBONDF = . if (RLBONDF >= -9 & RLBONDF <= -1)
replace RLOTHM = . if (RLOTHM >= -9 & RLOTHM <= -1)
replace RLOTHF = . if (RLOTHF >= -9 & RLOTHF <= -1)
replace RLTOTM = . if (RLTOTM >= -9 & RLTOTM <= -1)
replace RLTOTF = . if (RLTOTF >= -9 & RLTOTF <= -1)
replace FLOJANM = . if (FLOJANM >= -9 & FLOJANM <= -1)
replace FLOJANF = . if (FLOJANF >= -9 & FLOJANF <= -1)
replace FLOADMM = . if (FLOADMM >= -9 & FLOADMM <= -1)
replace FLOADMF = . if (FLOADMF >= -9 & FLOADMF <= -1)
replace FLORLM = . if (FLORLM >= -9 & FLORLM <= -1)
replace FLORLF = . if (FLORLF >= -9 & FLORLF <= -1)
replace FLODECM = . if (FLODECM >= -9 & FLODECM <= -1)
replace FLODECF = . if (FLODECF >= -9 & FLODECF <= -1)
replace CAPRATEM = . if (CAPRATEM >= -9 & CAPRATEM <= -1)
replace CAPRATEF = . if (CAPRATEF >= -9 & CAPRATEF <= -1)
replace CAPOPM = . if (CAPOPM >= -9 & CAPOPM <= -1)
replace CAPOPF = . if (CAPOPF >= -9 & CAPOPF <= -1)
replace CAPDESM = . if (CAPDESM >= -9 & CAPDESM <= -1)
replace CAPDESF = . if (CAPDESF >= -9 & CAPDESF <= -1)
replace CAPRATET = . if (CAPRATET >= -9 & CAPRATET <= -1)
replace CAPOPT = . if (CAPOPT >= -9 & CAPOPT <= -1)
replace CAPDEST = . if (CAPDEST >= -9 & CAPDEST <= -1)
replace HIVTEST = . if (HIVTEST >= -9 & HIVTEST <= -1)
replace HIVINC = . if (HIVINC >= -9 & HIVINC <= -1)
replace HIVCUR = . if (HIVCUR >= -9 & HIVCUR <= -1)
replace HIVREL = . if (HIVREL >= -9 & HIVREL <= -1)
replace HIVRAN = . if (HIVRAN >= -9 & HIVRAN <= -1)
replace HIVCERT = . if (HIVCERT >= -9 & HIVCERT <= -1)
replace HIVHIGH = . if (HIVHIGH >= -9 & HIVHIGH <= -1)
replace HIVREQ = . if (HIVREQ >= -9 & HIVREQ <= -1)
replace HIVORD = . if (HIVORD >= -9 & HIVORD <= -1)
replace HIVCLIN = . if (HIVCLIN >= -9 & HIVCLIN <= -1)
replace HIVINCID = . if (HIVINCID >= -9 & HIVINCID <= -1)
replace HIVOTH = . if (HIVOTH >= -9 & HIVOTH <= -1)
replace HIVASYMM = . if (HIVASYMM >= -9 & HIVASYMM <= -1)
replace HIVASYMF = . if (HIVASYMF >= -9 & HIVASYMF <= -1)
replace HIVASYMT = . if (HIVASYMT >= -9 & HIVASYMT <= -1)
replace HIVLESSM = . if (HIVLESSM >= -9 & HIVLESSM <= -1)
replace HIVLESSF = . if (HIVLESSF >= -9 & HIVLESSF <= -1)
replace HIVLESST = . if (HIVLESST >= -9 & HIVLESST <= -1)
replace AIDSCONM = . if (AIDSCONM >= -9 & AIDSCONM <= -1)
replace AIDSCONF = . if (AIDSCONF >= -9 & AIDSCONF <= -1)
replace AIDSCONT = . if (AIDSCONT >= -9 & AIDSCONT <= -1)
replace HIVATOTM = . if (HIVATOTM >= -9 & HIVATOTM <= -1)
replace HIVATOTF = . if (HIVATOTF >= -9 & HIVATOTF <= -1)
replace HIVATOTT = . if (HIVATOTT >= -9 & HIVATOTT <= -1)
replace CUSLT18M = . if (CUSLT18M >= -9 & CUSLT18M <= -1)
replace CUSLT18F = . if (CUSLT18F >= -9 & CUSLT18F <= -1)
replace CUSCTZNM = . if (CUSCTZNM >= -9 & CUSCTZNM <= -1)
replace CUSCTZNF = . if (CUSCTZNF >= -9 & CUSCTZNF <= -1)
replace DTHEXECM = . if (DTHEXECM >= -9 & DTHEXECM <= -1)
replace DTHEXECF = . if (DTHEXECF >= -9 & DTHEXECF <= -1)
replace DTHILLNM = . if (DTHILLNM >= -9 & DTHILLNM <= -1)
replace DTHILLNF = . if (DTHILLNF >= -9 & DTHILLNF <= -1)
replace DTHAIDSM = . if (DTHAIDSM >= -9 & DTHAIDSM <= -1)
replace DTHAIDSF = . if (DTHAIDSF >= -9 & DTHAIDSF <= -1)
replace DTHSUICM = . if (DTHSUICM >= -9 & DTHSUICM <= -1)
replace DTHSUICF = . if (DTHSUICF >= -9 & DTHSUICF <= -1)
replace DTHACCM = . if (DTHACCM >= -9 & DTHACCM <= -1)
replace DTHACCF = . if (DTHACCF >= -9 & DTHACCF <= -1)
replace DTHHOMIM = . if (DTHHOMIM >= -9 & DTHHOMIM <= -1)
replace DTHHOMIF = . if (DTHHOMIF >= -9 & DTHHOMIF <= -1)
replace DTHHOMOM = . if (DTHHOMOM >= -9 & DTHHOMOM <= -1)
replace DTHHOMOF = . if (DTHHOMOF >= -9 & DTHHOMOF <= -1)
replace DTHPERSM = . if (DTHPERSM >= -9 & DTHPERSM <= -1)
replace DTHPERSF = . if (DTHPERSF >= -9 & DTHPERSF <= -1)
replace DTHOTHM = . if (DTHOTHM >= -9 & DTHOTHM <= -1)
replace DTHOTHF = . if (DTHOTHF >= -9 & DTHOTHF <= -1)
replace DTHTOTM = . if (DTHTOTM >= -9 & DTHTOTM <= -1)
replace DTHTOTF = . if (DTHTOTF >= -9 & DTHTOTF <= -1)
replace HANDLEM = . if (HANDLEM >= -9 & HANDLEM <= -1)
replace HANDLEF = . if (HANDLEF >= -9 & HANDLEF <= -1)


*/
/********************************************************************

 Section 5: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

