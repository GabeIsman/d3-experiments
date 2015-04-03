/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 34981
 |                NATIONAL PRISONER STATISTICS, 1978-2012
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\34981-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE stateid   1='(01) 01. Alabama' 2='(02) 02. Alaska'
                  4='(04) 04. Arizona' 5='(05) 05. Arkansas'
                  6='(06) 06. California' 8='(08) 08. Colorado'
                  9='(09) 09. Connecticut' 10='(10) 10. Delaware'
                  11='(11) 11. District of Columbia' 12='(12) 12. Florida'
                  13='(13) 13. Georgia' 15='(15) 15. Hawaii'
                  16='(16) 16. Idaho' 17='(17) 17. Illinois'
                  18='(18) 18. Indiana' 19='(19) 19. Iowa'
                  20='(20) 20. Kansas' 21='(21) 21. Kentucky'
                  22='(22) 22. Louisiana' 23='(23) 23. Maine'
                  24='(24) 24. Maryland' 25='(25) 25. Massachusetts'
                  26='(26) 26. Michigan' 27='(27) 27. Minnesota'
                  28='(28) 28. Mississippi' 29='(29) 29. Missouri'
                  30='(30) 30. Montana' 31='(31) 31. Nebraska'
                  32='(32) 32. Nevada' 33='(33) 33. New Hampshire'
                  34='(34) 34. New Jersey' 35='(35) 35. New Mexico'
                  36='(36) 36. New York' 37='(37) 37. North Carolina'
                  38='(38) 38. North Dakota' 39='(39) 39. Ohio'
                  40='(40) 40. Oklahoma' 41='(41) 41. Oregon'
                  42='(42) 42. Pennsylvania' 44='(44) 44. Rhode Island'
                  45='(45) 45. South Carolina' 46='(46) 46. South Dakota'
                  47='(47) 47. Tennessee' 48='(48) 48. Texas'
                  49='(49) 49. Utah' 50='(50) 50. Vermont'
                  51='(51) 51. Virginia'
                  52='(52) 52. Jurisdiction shared between States'
                  53='(53) 53. Washington' 54='(54) 54. West Virginia'
                  55='(55) 55. Wisconsin' 56='(56) 56. Wyoming'
                  60='(60) State prison total'
                  70='(70) US prison total (state+federal)'
                  99='(99) Federal BOP' ;
  VALUE region    1='(1) Northeast' 2='(2) Midwest' 3='(3) South'
                  4='(4) West' 5='(5) U.S. total'
                  6='(6) Federal Bureau of Prisons' 7='(7) State total' ;
  VALUE cusgt1m
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusgt1f
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cuslt1m
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cuslt1f
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusunsm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusunsf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE custotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE custotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusgt1t
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cuslt1t
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusunst
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE custott
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cnoprivm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cnoprivf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cwprivm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cwprivf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurgt1m
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurgt1f
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurlt1m
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurlt1f
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurunsm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurunsf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurtotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE jurtotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE pvinm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE pvinf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE pvothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE pvothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE pvinclm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE pvinclf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE lfm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lff
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfinclm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE lfinclf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE lfcrowdm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfcrowdf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfcrstm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfcrstf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfcrincm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE lfcrincf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE fedm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE fedf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE othstm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE othstf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE facinclm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE facinclf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year'
                  1='(1) Yes' 2='(2) No' ;
  VALUE facrowdm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE facrowdf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE whitem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE whitef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE blackm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE blackf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hispm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hispf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE aianm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE aianf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE asianm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE asianf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE nhpim
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE nhpif
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE apim
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE apif
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE tworacem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE tworacef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE addracem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE addracef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE unkracem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE unkracef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE totracem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE totracef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE nothispm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE nothispf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE unkhispm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE unkhispf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE tothcatm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE tothcatf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE commitm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE commitf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE parnewm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE parnewf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE parnom
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE parnof
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adcrnewm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adcrnewf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adcrnom
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adcrnof
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adtransm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adtransf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adawolm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adawolf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adescapm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adescapf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adawesm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adawesf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adretm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adretf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adtotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE adtotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlunexpm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlunexpf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rluncomm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rluncomf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlunothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlunothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcoprom
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcoprof
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcosupm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcosupf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcodpm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcodpf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcoothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlcoothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rldeathm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rldeathf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlawolm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlawolf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlescapm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlescapf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlawesm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlawesf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rltranm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rltranf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlbondm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlbondf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rlothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rltotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE rltotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE flojanm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE flojanf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE floadmm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE floadmf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE florlm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE florlf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE flodecm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE flodecf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capratem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capratef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capopm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capopf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capdesm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capdesf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capratet
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capopt
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE capdest
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivtest
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivinc
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivcur
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivrel
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivran
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivcert
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivhigh
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivreq
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivord
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivclin
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivincid
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivoth
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivasymm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivasymf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivasymt
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivlessm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivlessf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivlesst
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE aidsconm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE aidsconf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE aidscont
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivatotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivatotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE hivatott
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -7='(-7) Item was asked for both males and females, but only aggregate was reported'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cuslt18m
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cuslt18f
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusctznm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE cusctznf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthexecm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthexecf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthillnm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthillnf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthaidsm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthaidsf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthsuicm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthsuicf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthaccm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthaccf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthhomim
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthhomif
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthhomom
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthhomof
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthpersm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthpersf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthothm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthothf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthtotm
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE dthtotf
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE handlem
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
  VALUE handlef
                  -9='(-9) Data are missing because the state did not respond to the item'
                  -8='(-8) Data are missing because the item was not applicable to the state'
                  -2='(-2) Item was asked, but only in the aggregate prison population, not by male or female'
                  -1='(-1) Item not asked in survey for this year' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=825;
INPUT
       YEAR 1-4                STATEID 5-6
        STATE $7-8              REGION 9                CUSGT1M 10-16
        CUSGT1F 17-21           CUSLT1M 22-26           CUSLT1F 27-30
        CUSUNSM 31-35           CUSUNSF 36-39           CUSTOTM 40-46
        CUSTOTF 47-51           CUSGT1T 52-57           CUSLT1T 58-61
        CUSUNST 62-65           CUSTOTT 66-71           CNOPRIVM 72-78
        CNOPRIVF 79-83          CWPRIVM 84-90           CWPRIVF 91-96
        JURGT1M 97-103          JURGT1F 104-109         JURLT1M 110-114
        JURLT1F 115-118         JURUNSM 119-123         JURUNSF 124-127
        JURTOTM 128-134         JURTOTF 135-140         PVINM 141-145
        PVINF 146-149           PVOTHM 150-154          PVOTHF 155-157
        PVINCLM 158-159         PVINCLF 160-161         LFM 162-166
        LFF 167-170             LFINCLM 171-172         LFINCLF 173-174
        LFCROWDM 175-179        LFCROWDF 180-183        LFCRSTM 184-185
        LFCRSTF 186-187         LFCRINCM 188-189        LFCRINCF 190-191
        FEDM 192-195            FEDF 196-198            OTHSTM 199-202
        OTHSTF 203-205          FACINCLM 206-207        FACINCLF 208-209
        FACROWDM 210-213        FACROWDF 214-216        WHITEM 217-222
        WHITEF 223-227          BLACKM 228-233          BLACKF 234-238
        HISPM 239-244           HISPF 245-249           AIANM 250-254
        AIANF 255-258           ASIANM 259-262          ASIANF 263-266
        NHPIM 267-270           NHPIF 271-273           APIM 274-277
        APIF 278-280            TWORACEM 281-283        TWORACEF 284-286
        ADDRACEM 287-292        ADDRACEF 293-296        UNKRACEM 297-302
        UNKRACEF 303-306        TOTRACEM 307-313        TOTRACEF 314-319
        NOTHISPM 320-325        NOTHISPF 326-330        UNKHISPM 331-336
        UNKHISPF 337-341        TOTHCATM 342-348        TOTHCATF 349-353
        COMMITM 354-359         COMMITF 360-364         PARNEWM 365-369
        PARNEWF 370-373         PARNOM 374-379          PARNOF 380-384
        ADCRNEWM 385-389        ADCRNEWF 390-393        ADCRNOM 394-398
        ADCRNOF 399-403         ADTRANSM 404-407        ADTRANSF 408-410
        ADAWOLM 411-414         ADAWOLF 415-417         ADESCAPM 418-421
        ADESCAPF 422-424        ADAWESM 425-429         ADAWESF 430-433
        ADRETM 434-437          ADRETF 438-440          ADOTHM 441-445
        ADOTHF 446-449          ADTOTM 450-455          ADTOTF 456-460
        RLUNEXPM 461-466        RLUNEXPF 467-471        RLUNCOMM 472-475
        RLUNCOMF 476-478        RLUNOTHM 479-483        RLUNOTHF 484-487
        RLCOPROM 488-492        RLCOPROF 493-497        RLCOSUPM 498-503
        RLCOSUPF 504-508        RLCODPM 509-514         RLCODPF 515-519
        RLCOOTHM 520-524        RLCOOTHF 525-528        RLDEATHM 529-532
        RLDEATHF 533-535        RLAWOLM 536-539         RLAWOLF 540-542
        RLESCAPM 543-546        RLESCAPF 547-549        RLAWESM 550-554
        RLAWESF 555-558         RLTRANM 559-562         RLTRANF 563-565
        RLBONDM 566-569         RLBONDF 570-572         RLOTHM 573-577
        RLOTHF 578-581          RLTOTM 582-587          RLTOTF 588-592
        FLOJANM 593-599         FLOJANF 600-605         FLOADMM 606-611
        FLOADMF 612-616         FLORLM 617-622          FLORLF 623-628
        FLODECM 629-635         FLODECF 636-641         CAPRATEM 642-647
        CAPRATEF 648-652        CAPOPM 653-659          CAPOPF 660-664
        CAPDESM 665-670         CAPDESF 671-675         CAPRATET 676-681
        CAPOPT 682-687          CAPDEST 688-693         HIVTEST 694-695
        HIVINC 696-697          HIVCUR 698-700          HIVREL 701-703
        HIVRAN 704-706          HIVCERT 707-709         HIVHIGH 710-711
        HIVREQ 712-713          HIVORD 714-715          HIVCLIN 716-717
        HIVINCID 718-719        HIVOTH 720-721          HIVASYMM 722-723
        HIVASYMF 724-725        HIVASYMT 726-727        HIVLESSM 728-729
        HIVLESSF 730-731        HIVLESST 732-733        AIDSCONM 734-735
        AIDSCONF 736-737        AIDSCONT 738-741        HIVATOTM 742-746
        HIVATOTF 747-750        HIVATOTT 751-755        CUSLT18M 756-759
        CUSLT18F 760-762        CUSCTZNM 763-767        CUSCTZNF 768-771
        DTHEXECM 772-773        DTHEXECF 774-775        DTHILLNM 776-779
        DTHILLNF 780-782        DTHAIDSM 783-785        DTHAIDSF 786-787
        DTHSUICM 788-790        DTHSUICF 791-792        DTHACCM 793-794
        DTHACCF 795-796         DTHHOMIM 797-798        DTHHOMIF 799-800
        DTHHOMOM 801-802        DTHHOMOF 803-804        DTHPERSM 805-807
        DTHPERSF 808-809        DTHOTHM 810-812         DTHOTHF 813-814
        DTHTOTM 815-818         DTHTOTF 819-821         HANDLEM 822-823
        HANDLEF 824-825         ;


* SAS LABEL STATEMENT;

LABEL 
   YEAR    = 'SURVEY YEAR' 
   STATEID = 'STATE FIPS IDENTIFICATION CODE' 
   STATE   = 'STATE TWO-CHARACTER IDENTIFICATION ABBREVIATION' 
   REGION  = 'STATE REGIONAL CODE' 
   CUSGT1M = 'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, MALES' 
   CUSGT1F = 'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, FEMALES' 
   CUSLT1M = 'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, MALES' 
   CUSLT1F = 'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, FEMALES' 
   CUSUNSM = 'CUSTODY UNSENTENCED, MALES' 
   CUSUNSF = 'CUSTODY UNSENTENCED, FEMALES' 
   CUSTOTM = 'TOTAL UNDER CUSTODY, MALES' 
   CUSTOTF = 'TOTAL UNDER CUSTODY, FEMALES' 
   CUSGT1T = 'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, TOTAL (1978-1982 ONLY)' 
   CUSLT1T = 'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, TOTAL (1978-1982 ONLY)' 
   CUSUNST = 'CUSTODY UNSENTENCED, TOTAL (1978-1982 ONLY)' 
   CUSTOTT = 'TOTAL UNDER CUSTODY, TOTAL (1978-1982 ONLY)' 
   CNOPRIVM= 'CUSTODY, EXCLUDING PRIVATE FACILITIES, MALE' 
   CNOPRIVF= 'CUSTODY, EXCLUDING PRIVATE FACILITIES, FEMALE' 
   CWPRIVM = 'CUSTODY, INCLUDING PRIVATE FACILITIES, MALE' 
   CWPRIVF = 'CUSTODY, INCLUDING PRIVATE FACILITIES, FEMALE' 
   JURGT1M = 'JURISDICTION WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, MALES' 
   JURGT1F = 'JURISDICTION WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, FEMALES' 
   JURLT1M = 'JURISDICTION WITH MAXIMUM SENTENCE 1 YEAR OR LESS, MALES' 
   JURLT1F = 'JURISDICTION WITH MAXIMUM SENTENCE 1 YEAR OR LESS, FEMALES' 
   JURUNSM = 'JURISDICTION UNSENTENCED, MALES' 
   JURUNSF = 'JURISDICTION UNSENTENCED, FEMALES' 
   JURTOTM = 'TOTAL UNDER JURISDICTION, MALES' 
   JURTOTF = 'TOTAL UNDER JURISDICTION, FEMALES' 
   PVINM   = 'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN STATE, MALE' 
   PVINF   = 'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN STATE, FEMALE' 
   PVOTHM  = 'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN OTHER STATE, MALE' 
   PVOTHF  = 'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN OTHER STATE, FEMALE' 
   PVINCLM = 'ARE PRIVATELY OPERATED CORRECTION FACILITY NUMBERS INCLUDED IN JURISDICTION TOTALS, MALE' 
   PVINCLF = 'ARE PRIVATELY OPERATED CORRECTION FACILITY NUMBERS INCLUDED IN JURISDICTION TOTALS, FEMALE' 
   LFM     = 'INMATES UNDER JURISDICTION HOUSED IN LOCAL FACILITIES OPERATED BY COUNTY OR OTHER LOCAL AUTHORITY, 
MALE' 
   LFF     = 'INMATES UNDER JURISDICTION HOUSED IN LOCAL FACILITIES OPERATED BY COUNTY OR OTHER LOCAL AUTHORITY, 
FEMALE' 
   LFINCLM = 'ARE LOCAL FACILITIES INCLUDED IN JURISDICTION TOTALS, MALE' 
   LFINCLF = 'ARE LOCAL FACILITIES INCLUDED IN JURISDICTION TOTALS, FEMALE' 
   LFCROWDM= 'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, MALE' 
   LFCROWDF= 'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, FEMALE' 
   LFCRSTM = 'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, MALE' 
   LFCRSTF = 'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, FEMALE' 
   LFCRINCM= 'LOCAL FACILITIES SOLELY TO EASE CROWDING, INCLUDED IN JURISDICTION TOTALS, MALE' 
   LFCRINCF= 'LOCAL FACILITIES SOLELY TO EASE CROWDING, INCLUDED IN JURISDICTION TOTALS, FEMALE' 
   FEDM    = 'INMATES UNDER JURISDICTION HOUSED IN FEDERAL FACILITIES, MALE' 
   FEDF    = 'INMATES UNDER JURISDICTION HOUSED IN FEDERAL FACILITIES, FEMALE' 
   OTHSTM  = 'INMATES UNDER JURISDICTION HOUSED IN OTHER STATES'' FACILITIES, MALE' 
   OTHSTF  = 'INMATES UNDER JURISDICTION HOUSED IN OTHER STATES'' FACILITIES, FEMALE' 
   FACINCLM= 'ARE FEDERAL OR OTHER STATES'' FACILITIES INCLUDED IN JURISDICTION TOTALS, MALE' 
   FACINCLF= 'ARE FEDERAL OR OTHER STATES'' FACILITIES INCLUDED IN JURISDICTION TOTALS, FEMALE' 
   FACROWDM= 'FEDERAL OR OTHER STATES'' FACILITIES SOLELY TO EASE CROWDING, MALE' 
   FACROWDF= 'FEDERAL OR OTHER STATES'' FACILITIES SOLELY TO EASE CROWDING, FEMALE' 
   WHITEM  = 'WHITE MALE' 
   WHITEF  = 'WHITE FEMALE' 
   BLACKM  = 'BLACK MALE' 
   BLACKF  = 'BLACK FEMALE' 
   HISPM   = 'HISPANIC OR LATINO MALE' 
   HISPF   = 'HISPANIC OR LATINO FEMALE' 
   AIANM   = 'AMERICAN INDIAN OR ALASKA NATIVE MALE' 
   AIANF   = 'AMERICAN INDIAN OR ALASKA NATIVE FEMALE' 
   ASIANM  = 'ASIAN MALE' 
   ASIANF  = 'ASIAN FEMALE' 
   NHPIM   = 'NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER MALE' 
   NHPIF   = 'NATIVE HAWAIIAN OR OTHER PACIFIC ISLAND FEMALE' 
   APIM    = 'ASIAN OR PACIFIC ISLANDER MALE' 
   APIF    = 'ASIAN OR PACIFIC ISLANDER FEMALE' 
   TWORACEM= 'TWO OR MORE RACES MALE' 
   TWORACEF= 'TWO OR MORE RACES FEMALE' 
   ADDRACEM= 'ADDITIONAL/OTHER CATEGORIES FOR RACE, MALE' 
   ADDRACEF= 'ADDITIONAL/OTHER CATEGORIES FOR RACE, FEMALE' 
   UNKRACEM= 'UNKNOWN RACE, MALE' 
   UNKRACEF= 'UNKNOWN RACE, FEMALE' 
   TOTRACEM= 'TOTAL RACE, MALE' 
   TOTRACEF= 'TOTAL RACE, FEMALE' 
   NOTHISPM= 'NOT OF HISPANIC ORIGIN, MALE' 
   NOTHISPF= 'NOT OF HISPANIC ORIGIN, FEMALE' 
   UNKHISPM= 'UNKNOWN HISPANIC OR LATINO ORIGIN, MALE' 
   UNKHISPF= 'UNKNOWN HISPANIC OR LATINO ORIGIN, FEMALE' 
   TOTHCATM= 'TOTAL HISPANIC, NON-HISPANIC, AND UNKNOWN, MALE' 
   TOTHCATF= 'TOTAL HISPANIC, NON-HISPANIC, AND UNKNOWN, FEMALE' 
   COMMITM = 'NEW COURT COMMITMENTS, MALE' 
   COMMITF = 'NEW  COURT COMMITMENTS, FEMALE' 
   PARNEWM = 'PAROLE VIOLATORS WITH NEW SENTENCE, MALE' 
   PARNEWF = 'PAROLE VIOLATORS WITH NEW SENTENCE, FEMALE' 
   PARNOM  = 'PAROLE VIOLATORS WITHOUT NEW SENTENCE, MALE' 
   PARNOF  = 'PAROLE VIOLATORS WITHOUT NEW SENTENCE, FEMALE' 
   ADCRNEWM= 'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITH NEW SENTENCE, MALE' 
   ADCRNEWF= 'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITH NEW SENTENCE, FEMALE' 
   ADCRNOM = 'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITHOUT NEW SENTENCE, MALE' 
   ADCRNOF = 'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITHOUT NEW SENTENCE, FEMALE' 
   ADTRANSM= 'TRANSFERS ADMITTED FROM OTHER JURISDICTIONS, MALE' 
   ADTRANSF= 'TRANSFERS ADMITTED FROM OTHER JURISDICTIONS, FEMALE' 
   ADAWOLM = 'AWOL RETURNS, WITH OR WITHOUT NEW SENTENCES, MALE' 
   ADAWOLF = 'AWOL RETURNS, WITH OR WITHOUT NEW SENTENCES, FEMALE' 
   ADESCAPM= 'ESCAPEE RETURNS, WITH OR WITHOUT NEW SENTENCES, MALE' 
   ADESCAPF= 'ESCAPEE RETURNS, WITH OR WITHOUT NEW SENTENCES, FEMALE' 
   ADAWESM = 'AWOL OR ESCAPEE RETURNS, COMBINED, MALE' 
   ADAWESF = 'AWOL OR ESCAPEE RETURNS, COMBINED, FEMALE' 
   ADRETM  = 'RETURNS FROM APPEAL OR BOND, MALE' 
   ADRETF  = 'RETURNS FROM APPEAL OR BOND, FEMALE' 
   ADOTHM  = 'OTHER ADMISSIONS, MALE' 
   ADOTHF  = 'OTHER ADMISSIONS, FEMALE' 
   ADTOTM  = 'TOTAL ADMISSIONS, MALE' 
   ADTOTF  = 'TOTAL ADMISSIONS, FEMALE' 
   RLUNEXPM= 'UNCONDITIONAL RELEASE EXPIRATIONS OF SENTENCE, MALE' 
   RLUNEXPF= 'UNCONDITIONAL RELEASE EXPIRATIONS OF SENTENCE, FEMALE' 
   RLUNCOMM= 'UNCONDITIONAL RELEASE COMMUTATIONS, MALE' 
   RLUNCOMF= 'UNCONDITIONAL RELEASE COMMUTATIONS, FEMALE' 
   RLUNOTHM= 'OTHER UNCONDITIONAL RELEASE, MALE' 
   RLUNOTHF= 'OTHER UNCONDITIONAL RELEASE, FEMALE' 
   RLCOPROM= 'CONDITIONAL RELEASE PROBATIONS, MALE' 
   RLCOPROF= 'CONDITIONAL RELEASE PROBATIONS, FEMALE' 
   RLCOSUPM= 'SUPERVISED MANDATORY RELEASE, MALE' 
   RLCOSUPF= 'SUPERVISED MANDATORY RELEASE, FEMALE' 
   RLCODPM = 'DISCRETIONARY PAROLE, MALE' 
   RLCODPF = 'DISCRETIONARY PAROLE, FEMALE' 
   RLCOOTHM= 'OTHER CONDITIONAL RELEASE, MALE' 
   RLCOOTHF= 'OTHER CONDITIONAL RELEASE, FEMALE' 
   RLDEATHM= 'DEATHS, MALE' 
   RLDEATHF= 'DEATHS, FEMALE' 
   RLAWOLM = 'AWOL RELEASE, MALE' 
   RLAWOLF = 'AWOL RELEASE, FEMALE' 
   RLESCAPM= 'ESCAPE FROM CONFINEMENT, MALE' 
   RLESCAPF= 'ESCAPE FROM CONFINEMENT, FEMALE' 
   RLAWESM = 'AWOL RELEASE OR ESCAPE, COMBINED, MALE' 
   RLAWESF = 'AWOL RELEASE OR ESCAPE, COMBINED, FEMALE' 
   RLTRANM = 'TRANSFERS TO OTHER JURISDICTIONS, MALE' 
   RLTRANF = 'TRANSFERS TO OTHER JURISDICTIONS, FEMALE' 
   RLBONDM = 'RELEASE TO APPEAL OR BOND, MALE' 
   RLBONDF = 'RELEASE TO APPEAL OR BOND, FEMALE' 
   RLOTHM  = 'OTHER RELEASE, MALE' 
   RLOTHF  = 'OTHER RELEASE, FEMALE' 
   RLTOTM  = 'TOTAL RELEASES, MALE' 
   RLTOTF  = 'TOTAL RELEASES, FEMALE' 
   FLOJANM = 'UNDER JURISDICTION ON JANUARY 1, [CURRENT YEAR], SENTENCE GT 1 YEAR, MALE [OR DECEMBER 31 OF PRIOR 
YEAR]' 
   FLOJANF = 'UNDER JURISDICTION ON JANUARY 1, [CURRENT YEAR], SENTENCE GT 1 YEAR, FEMALE [OR DECEMBER 31 OF 
PRIOR YEAR]' 
   FLOADMM = 'ADMITTED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, MALE' 
   FLOADMF = 'ADMITTED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, FEMALE' 
   FLORLM  = 'RELEASED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, MALE' 
   FLORLF  = 'RELEASED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, FEMALE' 
   FLODECM = 'UNDER JURISDICTION ON DECEMBER 31, [CURRENT YEAR], SENTENCE GT 1 YEAR, MALE' 
   FLODECF = 'UNDER JURISDICTION ON DECEMBER 31, [CURRENT YEAR], SENTENCE GT 1 YEAR, FEMALE' 
   CAPRATEM= 'RATED CAPACITY, MALE' 
   CAPRATEF= 'RATED CAPACITY, FEMALE' 
   CAPOPM  = 'OPERATIONAL CAPACITY, MALE' 
   CAPOPF  = 'OPERATIONAL CAPACITY, FEMALE' 
   CAPDESM = 'DESIGN CAPACITY, MALE' 
   CAPDESF = 'DESIGN CAPACITY, FEMALE' 
   CAPRATET= 'RATED CAPACITY, TOTAL' 
   CAPOPT  = 'OPERATIONAL CAPACITY, TOTAL' 
   CAPDEST = 'DESIGN CAPACITY, TOTAL' 
   HIVTEST = 'TESTED INMATES IN CUSTODY FOR HIV ANTIBODY' 
   HIVINC  = 'TESTED ALL INCOMING INMATES' 
   HIVCUR  = 'TESTED ALL INMATES CURRENTLY IN CUSTODY' 
   HIVREL  = 'TESTED ALL INMATES AT TIME OF RELEASE' 
   HIVRAN  = 'TESTED RANDOM SAMPLES WHILE IN CUSTODY' 
   HIVCERT = 'TESTED CERTAIN INMATES' 
   HIVHIGH = 'TESTED HIGH RISK GROUPS IN CUSTODY' 
   HIVREQ  = 'TESTED UPON INMATE REQUEST WHILE IN CUSTODY' 
   HIVORD  = 'TESTED UPON COURT ORDER OF INMATE IN CUSTODY' 
   HIVCLIN = 'TESTED UPON CLINICAL INDICATION OF NEED OF INMATE IN CUSTODY' 
   HIVINCID= 'TESTED UPON INVOLVEMENT IN INCIDENT OF INMATE IN CUSTODY' 
   HIVOTH  = 'TESTED INMATES IN CUSTODY UNDER OTHER CIRCUMSTANCES' 
   HIVASYMM= 'ASYMPTOMATIC HIV POSITIVE, MALE' 
   HIVASYMF= 'ASYMPTOMATIC HIV POSITIVE, FEMALE' 
   HIVASYMT= 'ASYMPTOMATIC HIV POSITIVE, TOTAL' 
   HIVLESSM= 'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE, MALE' 
   HIVLESSF= 'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE,' 
   HIVLESST= 'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE, TOTAL' 
   AIDSCONM= 'CONFIRMED TO HAVE AIDS, MALE' 
   AIDSCONF= 'CONFIRMED TO HAVE AIDS, FEMALE' 
   AIDSCONT= 'CONFIRMED TO HAVE AIDS, TOTAL' 
   HIVATOTM= 'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, MALE' 
   HIVATOTF= 'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, FEMALE' 
   HIVATOTT= 'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, TOTAL' 
   CUSLT18M= 'IN CUSTODY UNDER 18 YEARS OF AGE, MALE' 
   CUSLT18F= 'IN CUSTODY UNDER 18 YEARS OF AGE, FEMALE' 
   CUSCTZNM= 'IN CUSTODY NOT U.S. CITIZENS, MALE' 
   CUSCTZNF= 'IN CUSTODY NOT U.S. CITIZENS, FEMALE' 
   DTHEXECM= 'DEATHS FROM EXECUTION, MALE' 
   DTHEXECF= 'DEATHS FROM EXECUTION, FEMALE' 
   DTHILLNM= 'DEATHS FROM ILLNESS OR NATURAL CAUSE, MALE' 
   DTHILLNF= 'DEATHS FROM ILLNESS OR NATURAL CAUSE, FEMALE' 
   DTHAIDSM= 'DEATHS FROM AIDS, MALE' 
   DTHAIDSF= 'DEATHS FROM AIDS, FEMALE' 
   DTHSUICM= 'DEATHS FROM SUICIDE, MALE' 
   DTHSUICF= 'DEATHS FROM SUICIDE, FEMALE' 
   DTHACCM = 'DEATHS FROM ACCIDENTAL INJURY TO SELF, MALE' 
   DTHACCF = 'DEATHS FROM ACCIDENTAL INJURY TO SELF, FEMALE' 
   DTHHOMIM= 'DEATHS FROM HOMICIDE BY OTHER INMATES, MALE' 
   DTHHOMIF= 'DEATHS FROM HOMICIDE  BY OTHER INMATES, FEMALE' 
   DTHHOMOM= 'DEATHS FROM OTHER HOMICIDE, MALE' 
   DTHHOMOF= 'DEATHS FROM OTHER HOMICIDE, FEMALE' 
   DTHPERSM= 'DEATHS CAUSED BY ANOTHER PERSON, MALE' 
   DTHPERSF= 'DEATHS CAUSED BY ANOTHER PERSON, FEMALE' 
   DTHOTHM = 'OTHER DEATHS, MALE' 
   DTHOTHF = 'OTHER DEATHS, FEMALE' 
   DTHTOTM = 'TOTAL DEATHS, MALE' 
   DTHTOTF = 'TOTAL DEATHS, FEMALE' 
   HANDLEM = 'TOTAL INMATES HANDLED, JURISDICTION POPULATION PLUS ADMISSIONS, MALE' 
   HANDLEF = 'TOTAL INMATES HANDLED, JURISDICTION POPULATION PLUS ADMISSIONS, FEMALE' 
        ; 


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (YEAR >= -9 AND YEAR <= -1) THEN YEAR = .;
   IF (STATEID >= -9 AND STATEID <= -1) THEN STATEID = .;
   IF (REGION >= -9 AND REGION <= -1) THEN REGION = .;
   IF (CUSGT1M >= -9 AND CUSGT1M <= -1) THEN CUSGT1M = .;
   IF (CUSGT1F >= -9 AND CUSGT1F <= -1) THEN CUSGT1F = .;
   IF (CUSLT1M >= -9 AND CUSLT1M <= -1) THEN CUSLT1M = .;
   IF (CUSLT1F >= -9 AND CUSLT1F <= -1) THEN CUSLT1F = .;
   IF (CUSUNSM >= -9 AND CUSUNSM <= -1) THEN CUSUNSM = .;
   IF (CUSUNSF >= -9 AND CUSUNSF <= -1) THEN CUSUNSF = .;
   IF (CUSTOTM >= -9 AND CUSTOTM <= -1) THEN CUSTOTM = .;
   IF (CUSTOTF >= -9 AND CUSTOTF <= -1) THEN CUSTOTF = .;
   IF (CUSGT1T >= -9 AND CUSGT1T <= -1) THEN CUSGT1T = .;
   IF (CUSLT1T >= -9 AND CUSLT1T <= -1) THEN CUSLT1T = .;
   IF (CUSUNST >= -9 AND CUSUNST <= -1) THEN CUSUNST = .;
   IF (CUSTOTT >= -9 AND CUSTOTT <= -1) THEN CUSTOTT = .;
   IF (CNOPRIVM >= -9 AND CNOPRIVM <= -1) THEN CNOPRIVM = .;
   IF (CNOPRIVF >= -9 AND CNOPRIVF <= -1) THEN CNOPRIVF = .;
   IF (CWPRIVM >= -9 AND CWPRIVM <= -1) THEN CWPRIVM = .;
   IF (CWPRIVF >= -9 AND CWPRIVF <= -1) THEN CWPRIVF = .;
   IF (JURGT1M >= -9 AND JURGT1M <= -1) THEN JURGT1M = .;
   IF (JURGT1F >= -9 AND JURGT1F <= -1) THEN JURGT1F = .;
   IF (JURLT1M >= -9 AND JURLT1M <= -1) THEN JURLT1M = .;
   IF (JURLT1F >= -9 AND JURLT1F <= -1) THEN JURLT1F = .;
   IF (JURUNSM >= -9 AND JURUNSM <= -1) THEN JURUNSM = .;
   IF (JURUNSF >= -9 AND JURUNSF <= -1) THEN JURUNSF = .;
   IF (JURTOTM >= -9 AND JURTOTM <= -1) THEN JURTOTM = .;
   IF (JURTOTF >= -9 AND JURTOTF <= -1) THEN JURTOTF = .;
   IF (PVINM >= -9 AND PVINM <= -1) THEN PVINM = .;
   IF (PVINF >= -9 AND PVINF <= -1) THEN PVINF = .;
   IF (PVOTHM >= -9 AND PVOTHM <= -1) THEN PVOTHM = .;
   IF (PVOTHF >= -9 AND PVOTHF <= -1) THEN PVOTHF = .;
   IF (PVINCLM >= -9 AND PVINCLM <= -1) THEN PVINCLM = .;
   IF (PVINCLF >= -9 AND PVINCLF <= -1) THEN PVINCLF = .;
   IF (LFM >= -9 AND LFM <= -1) THEN LFM = .;
   IF (LFF >= -9 AND LFF <= -1) THEN LFF = .;
   IF (LFINCLM >= -9 AND LFINCLM <= -1) THEN LFINCLM = .;
   IF (LFINCLF >= -9 AND LFINCLF <= -1) THEN LFINCLF = .;
   IF (LFCROWDM >= -9 AND LFCROWDM <= -1) THEN LFCROWDM = .;
   IF (LFCROWDF >= -9 AND LFCROWDF <= -1) THEN LFCROWDF = .;
   IF (LFCRSTM >= -9 AND LFCRSTM <= -1) THEN LFCRSTM = .;
   IF (LFCRSTF >= -9 AND LFCRSTF <= -1) THEN LFCRSTF = .;
   IF (LFCRINCM >= -9 AND LFCRINCM <= -1) THEN LFCRINCM = .;
   IF (LFCRINCF >= -9 AND LFCRINCF <= -1) THEN LFCRINCF = .;
   IF (FEDM >= -9 AND FEDM <= -1) THEN FEDM = .;
   IF (FEDF >= -9 AND FEDF <= -1) THEN FEDF = .;
   IF (OTHSTM >= -9 AND OTHSTM <= -1) THEN OTHSTM = .;
   IF (OTHSTF >= -9 AND OTHSTF <= -1) THEN OTHSTF = .;
   IF (FACINCLM >= -9 AND FACINCLM <= -1) THEN FACINCLM = .;
   IF (FACINCLF >= -9 AND FACINCLF <= -1) THEN FACINCLF = .;
   IF (FACROWDM >= -9 AND FACROWDM <= -1) THEN FACROWDM = .;
   IF (FACROWDF >= -9 AND FACROWDF <= -1) THEN FACROWDF = .;
   IF (WHITEM >= -9 AND WHITEM <= -1) THEN WHITEM = .;
   IF (WHITEF >= -9 AND WHITEF <= -1) THEN WHITEF = .;
   IF (BLACKM >= -9 AND BLACKM <= -1) THEN BLACKM = .;
   IF (BLACKF >= -9 AND BLACKF <= -1) THEN BLACKF = .;
   IF (HISPM >= -9 AND HISPM <= -1) THEN HISPM = .;
   IF (HISPF >= -9 AND HISPF <= -1) THEN HISPF = .;
   IF (AIANM >= -9 AND AIANM <= -1) THEN AIANM = .;
   IF (AIANF >= -9 AND AIANF <= -1) THEN AIANF = .;
   IF (ASIANM >= -9 AND ASIANM <= -1) THEN ASIANM = .;
   IF (ASIANF >= -9 AND ASIANF <= -1) THEN ASIANF = .;
   IF (NHPIM >= -9 AND NHPIM <= -1) THEN NHPIM = .;
   IF (NHPIF >= -9 AND NHPIF <= -1) THEN NHPIF = .;
   IF (APIM >= -9 AND APIM <= -1) THEN APIM = .;
   IF (APIF >= -9 AND APIF <= -1) THEN APIF = .;
   IF (TWORACEM >= -9 AND TWORACEM <= -1) THEN TWORACEM = .;
   IF (TWORACEF >= -9 AND TWORACEF <= -1) THEN TWORACEF = .;
   IF (ADDRACEM >= -9 AND ADDRACEM <= -1) THEN ADDRACEM = .;
   IF (ADDRACEF >= -9 AND ADDRACEF <= -1) THEN ADDRACEF = .;
   IF (UNKRACEM >= -9 AND UNKRACEM <= -1) THEN UNKRACEM = .;
   IF (UNKRACEF >= -9 AND UNKRACEF <= -1) THEN UNKRACEF = .;
   IF (TOTRACEM >= -9 AND TOTRACEM <= -1) THEN TOTRACEM = .;
   IF (TOTRACEF >= -9 AND TOTRACEF <= -1) THEN TOTRACEF = .;
   IF (NOTHISPM >= -9 AND NOTHISPM <= -1) THEN NOTHISPM = .;
   IF (NOTHISPF >= -9 AND NOTHISPF <= -1) THEN NOTHISPF = .;
   IF (UNKHISPM >= -9 AND UNKHISPM <= -1) THEN UNKHISPM = .;
   IF (UNKHISPF >= -9 AND UNKHISPF <= -1) THEN UNKHISPF = .;
   IF (TOTHCATM >= -9 AND TOTHCATM <= -1) THEN TOTHCATM = .;
   IF (TOTHCATF >= -9 AND TOTHCATF <= -1) THEN TOTHCATF = .;
   IF (COMMITM >= -9 AND COMMITM <= -1) THEN COMMITM = .;
   IF (COMMITF >= -9 AND COMMITF <= -1) THEN COMMITF = .;
   IF (PARNEWM >= -9 AND PARNEWM <= -1) THEN PARNEWM = .;
   IF (PARNEWF >= -9 AND PARNEWF <= -1) THEN PARNEWF = .;
   IF (PARNOM >= -9 AND PARNOM <= -1) THEN PARNOM = .;
   IF (PARNOF >= -9 AND PARNOF <= -1) THEN PARNOF = .;
   IF (ADCRNEWM >= -9 AND ADCRNEWM <= -1) THEN ADCRNEWM = .;
   IF (ADCRNEWF >= -9 AND ADCRNEWF <= -1) THEN ADCRNEWF = .;
   IF (ADCRNOM >= -9 AND ADCRNOM <= -1) THEN ADCRNOM = .;
   IF (ADCRNOF >= -9 AND ADCRNOF <= -1) THEN ADCRNOF = .;
   IF (ADTRANSM >= -9 AND ADTRANSM <= -1) THEN ADTRANSM = .;
   IF (ADTRANSF >= -9 AND ADTRANSF <= -1) THEN ADTRANSF = .;
   IF (ADAWOLM >= -9 AND ADAWOLM <= -1) THEN ADAWOLM = .;
   IF (ADAWOLF >= -9 AND ADAWOLF <= -1) THEN ADAWOLF = .;
   IF (ADESCAPM >= -9 AND ADESCAPM <= -1) THEN ADESCAPM = .;
   IF (ADESCAPF >= -9 AND ADESCAPF <= -1) THEN ADESCAPF = .;
   IF (ADAWESM >= -9 AND ADAWESM <= -1) THEN ADAWESM = .;
   IF (ADAWESF >= -9 AND ADAWESF <= -1) THEN ADAWESF = .;
   IF (ADRETM >= -9 AND ADRETM <= -1) THEN ADRETM = .;
   IF (ADRETF >= -9 AND ADRETF <= -1) THEN ADRETF = .;
   IF (ADOTHM >= -9 AND ADOTHM <= -1) THEN ADOTHM = .;
   IF (ADOTHF >= -9 AND ADOTHF <= -1) THEN ADOTHF = .;
   IF (ADTOTM >= -9 AND ADTOTM <= -1) THEN ADTOTM = .;
   IF (ADTOTF >= -9 AND ADTOTF <= -1) THEN ADTOTF = .;
   IF (RLUNEXPM >= -9 AND RLUNEXPM <= -1) THEN RLUNEXPM = .;
   IF (RLUNEXPF >= -9 AND RLUNEXPF <= -1) THEN RLUNEXPF = .;
   IF (RLUNCOMM >= -9 AND RLUNCOMM <= -1) THEN RLUNCOMM = .;
   IF (RLUNCOMF >= -9 AND RLUNCOMF <= -1) THEN RLUNCOMF = .;
   IF (RLUNOTHM >= -9 AND RLUNOTHM <= -1) THEN RLUNOTHM = .;
   IF (RLUNOTHF >= -9 AND RLUNOTHF <= -1) THEN RLUNOTHF = .;
   IF (RLCOPROM >= -9 AND RLCOPROM <= -1) THEN RLCOPROM = .;
   IF (RLCOPROF >= -9 AND RLCOPROF <= -1) THEN RLCOPROF = .;
   IF (RLCOSUPM >= -9 AND RLCOSUPM <= -1) THEN RLCOSUPM = .;
   IF (RLCOSUPF >= -9 AND RLCOSUPF <= -1) THEN RLCOSUPF = .;
   IF (RLCODPM >= -9 AND RLCODPM <= -1) THEN RLCODPM = .;
   IF (RLCODPF >= -9 AND RLCODPF <= -1) THEN RLCODPF = .;
   IF (RLCOOTHM >= -9 AND RLCOOTHM <= -1) THEN RLCOOTHM = .;
   IF (RLCOOTHF >= -9 AND RLCOOTHF <= -1) THEN RLCOOTHF = .;
   IF (RLDEATHM >= -9 AND RLDEATHM <= -1) THEN RLDEATHM = .;
   IF (RLDEATHF >= -9 AND RLDEATHF <= -1) THEN RLDEATHF = .;
   IF (RLAWOLM >= -9 AND RLAWOLM <= -1) THEN RLAWOLM = .;
   IF (RLAWOLF >= -9 AND RLAWOLF <= -1) THEN RLAWOLF = .;
   IF (RLESCAPM >= -9 AND RLESCAPM <= -1) THEN RLESCAPM = .;
   IF (RLESCAPF >= -9 AND RLESCAPF <= -1) THEN RLESCAPF = .;
   IF (RLAWESM >= -9 AND RLAWESM <= -1) THEN RLAWESM = .;
   IF (RLAWESF >= -9 AND RLAWESF <= -1) THEN RLAWESF = .;
   IF (RLTRANM >= -9 AND RLTRANM <= -1) THEN RLTRANM = .;
   IF (RLTRANF >= -9 AND RLTRANF <= -1) THEN RLTRANF = .;
   IF (RLBONDM >= -9 AND RLBONDM <= -1) THEN RLBONDM = .;
   IF (RLBONDF >= -9 AND RLBONDF <= -1) THEN RLBONDF = .;
   IF (RLOTHM >= -9 AND RLOTHM <= -1) THEN RLOTHM = .;
   IF (RLOTHF >= -9 AND RLOTHF <= -1) THEN RLOTHF = .;
   IF (RLTOTM >= -9 AND RLTOTM <= -1) THEN RLTOTM = .;
   IF (RLTOTF >= -9 AND RLTOTF <= -1) THEN RLTOTF = .;
   IF (FLOJANM >= -9 AND FLOJANM <= -1) THEN FLOJANM = .;
   IF (FLOJANF >= -9 AND FLOJANF <= -1) THEN FLOJANF = .;
   IF (FLOADMM >= -9 AND FLOADMM <= -1) THEN FLOADMM = .;
   IF (FLOADMF >= -9 AND FLOADMF <= -1) THEN FLOADMF = .;
   IF (FLORLM >= -9 AND FLORLM <= -1) THEN FLORLM = .;
   IF (FLORLF >= -9 AND FLORLF <= -1) THEN FLORLF = .;
   IF (FLODECM >= -9 AND FLODECM <= -1) THEN FLODECM = .;
   IF (FLODECF >= -9 AND FLODECF <= -1) THEN FLODECF = .;
   IF (CAPRATEM >= -9 AND CAPRATEM <= -1) THEN CAPRATEM = .;
   IF (CAPRATEF >= -9 AND CAPRATEF <= -1) THEN CAPRATEF = .;
   IF (CAPOPM >= -9 AND CAPOPM <= -1) THEN CAPOPM = .;
   IF (CAPOPF >= -9 AND CAPOPF <= -1) THEN CAPOPF = .;
   IF (CAPDESM >= -9 AND CAPDESM <= -1) THEN CAPDESM = .;
   IF (CAPDESF >= -9 AND CAPDESF <= -1) THEN CAPDESF = .;
   IF (CAPRATET >= -9 AND CAPRATET <= -1) THEN CAPRATET = .;
   IF (CAPOPT >= -9 AND CAPOPT <= -1) THEN CAPOPT = .;
   IF (CAPDEST >= -9 AND CAPDEST <= -1) THEN CAPDEST = .;
   IF (HIVTEST >= -9 AND HIVTEST <= -1) THEN HIVTEST = .;
   IF (HIVINC >= -9 AND HIVINC <= -1) THEN HIVINC = .;
   IF (HIVCUR >= -9 AND HIVCUR <= -1) THEN HIVCUR = .;
   IF (HIVREL >= -9 AND HIVREL <= -1) THEN HIVREL = .;
   IF (HIVRAN >= -9 AND HIVRAN <= -1) THEN HIVRAN = .;
   IF (HIVCERT >= -9 AND HIVCERT <= -1) THEN HIVCERT = .;
   IF (HIVHIGH >= -9 AND HIVHIGH <= -1) THEN HIVHIGH = .;
   IF (HIVREQ >= -9 AND HIVREQ <= -1) THEN HIVREQ = .;
   IF (HIVORD >= -9 AND HIVORD <= -1) THEN HIVORD = .;
   IF (HIVCLIN >= -9 AND HIVCLIN <= -1) THEN HIVCLIN = .;
   IF (HIVINCID >= -9 AND HIVINCID <= -1) THEN HIVINCID = .;
   IF (HIVOTH >= -9 AND HIVOTH <= -1) THEN HIVOTH = .;
   IF (HIVASYMM >= -9 AND HIVASYMM <= -1) THEN HIVASYMM = .;
   IF (HIVASYMF >= -9 AND HIVASYMF <= -1) THEN HIVASYMF = .;
   IF (HIVASYMT >= -9 AND HIVASYMT <= -1) THEN HIVASYMT = .;
   IF (HIVLESSM >= -9 AND HIVLESSM <= -1) THEN HIVLESSM = .;
   IF (HIVLESSF >= -9 AND HIVLESSF <= -1) THEN HIVLESSF = .;
   IF (HIVLESST >= -9 AND HIVLESST <= -1) THEN HIVLESST = .;
   IF (AIDSCONM >= -9 AND AIDSCONM <= -1) THEN AIDSCONM = .;
   IF (AIDSCONF >= -9 AND AIDSCONF <= -1) THEN AIDSCONF = .;
   IF (AIDSCONT >= -9 AND AIDSCONT <= -1) THEN AIDSCONT = .;
   IF (HIVATOTM >= -9 AND HIVATOTM <= -1) THEN HIVATOTM = .;
   IF (HIVATOTF >= -9 AND HIVATOTF <= -1) THEN HIVATOTF = .;
   IF (HIVATOTT >= -9 AND HIVATOTT <= -1) THEN HIVATOTT = .;
   IF (CUSLT18M >= -9 AND CUSLT18M <= -1) THEN CUSLT18M = .;
   IF (CUSLT18F >= -9 AND CUSLT18F <= -1) THEN CUSLT18F = .;
   IF (CUSCTZNM >= -9 AND CUSCTZNM <= -1) THEN CUSCTZNM = .;
   IF (CUSCTZNF >= -9 AND CUSCTZNF <= -1) THEN CUSCTZNF = .;
   IF (DTHEXECM >= -9 AND DTHEXECM <= -1) THEN DTHEXECM = .;
   IF (DTHEXECF >= -9 AND DTHEXECF <= -1) THEN DTHEXECF = .;
   IF (DTHILLNM >= -9 AND DTHILLNM <= -1) THEN DTHILLNM = .;
   IF (DTHILLNF >= -9 AND DTHILLNF <= -1) THEN DTHILLNF = .;
   IF (DTHAIDSM >= -9 AND DTHAIDSM <= -1) THEN DTHAIDSM = .;
   IF (DTHAIDSF >= -9 AND DTHAIDSF <= -1) THEN DTHAIDSF = .;
   IF (DTHSUICM >= -9 AND DTHSUICM <= -1) THEN DTHSUICM = .;
   IF (DTHSUICF >= -9 AND DTHSUICF <= -1) THEN DTHSUICF = .;
   IF (DTHACCM >= -9 AND DTHACCM <= -1) THEN DTHACCM = .;
   IF (DTHACCF >= -9 AND DTHACCF <= -1) THEN DTHACCF = .;
   IF (DTHHOMIM >= -9 AND DTHHOMIM <= -1) THEN DTHHOMIM = .;
   IF (DTHHOMIF >= -9 AND DTHHOMIF <= -1) THEN DTHHOMIF = .;
   IF (DTHHOMOM >= -9 AND DTHHOMOM <= -1) THEN DTHHOMOM = .;
   IF (DTHHOMOF >= -9 AND DTHHOMOF <= -1) THEN DTHHOMOF = .;
   IF (DTHPERSM >= -9 AND DTHPERSM <= -1) THEN DTHPERSM = .;
   IF (DTHPERSF >= -9 AND DTHPERSF <= -1) THEN DTHPERSF = .;
   IF (DTHOTHM >= -9 AND DTHOTHM <= -1) THEN DTHOTHM = .;
   IF (DTHOTHF >= -9 AND DTHOTHF <= -1) THEN DTHOTHF = .;
   IF (DTHTOTM >= -9 AND DTHTOTM <= -1) THEN DTHTOTM = .;
   IF (DTHTOTF >= -9 AND DTHTOTF <= -1) THEN DTHTOTF = .;
   IF (HANDLEM >= -9 AND HANDLEM <= -1) THEN HANDLEM = .;
   IF (HANDLEF >= -9 AND HANDLEF <= -1) THEN HANDLEF = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT STATEID stateid. REGION region. CUSGT1M cusgt1m.
         CUSGT1F cusgt1f. CUSLT1M cuslt1m. CUSLT1F cuslt1f.
         CUSUNSM cusunsm. CUSUNSF cusunsf. CUSTOTM custotm.
         CUSTOTF custotf. CUSGT1T cusgt1t. CUSLT1T cuslt1t.
         CUSUNST cusunst. CUSTOTT custott. CNOPRIVM cnoprivm.
         CNOPRIVF cnoprivf. CWPRIVM cwprivm. CWPRIVF cwprivf.
         JURGT1M jurgt1m. JURGT1F jurgt1f. JURLT1M jurlt1m.
         JURLT1F jurlt1f. JURUNSM jurunsm. JURUNSF jurunsf.
         JURTOTM jurtotm. JURTOTF jurtotf. PVINM pvinm.
         PVINF pvinf. PVOTHM pvothm. PVOTHF pvothf.
         PVINCLM pvinclm. PVINCLF pvinclf. LFM lfm.
         LFF lff. LFINCLM lfinclm. LFINCLF lfinclf.
         LFCROWDM lfcrowdm. LFCROWDF lfcrowdf. LFCRSTM lfcrstm.
         LFCRSTF lfcrstf. LFCRINCM lfcrincm. LFCRINCF lfcrincf.
         FEDM fedm. FEDF fedf. OTHSTM othstm.
         OTHSTF othstf. FACINCLM facinclm. FACINCLF facinclf.
         FACROWDM facrowdm. FACROWDF facrowdf. WHITEM whitem.
         WHITEF whitef. BLACKM blackm. BLACKF blackf.
         HISPM hispm. HISPF hispf. AIANM aianm.
         AIANF aianf. ASIANM asianm. ASIANF asianf.
         NHPIM nhpim. NHPIF nhpif. APIM apim.
         APIF apif. TWORACEM tworacem. TWORACEF tworacef.
         ADDRACEM addracem. ADDRACEF addracef. UNKRACEM unkracem.
         UNKRACEF unkracef. TOTRACEM totracem. TOTRACEF totracef.
         NOTHISPM nothispm. NOTHISPF nothispf. UNKHISPM unkhispm.
         UNKHISPF unkhispf. TOTHCATM tothcatm. TOTHCATF tothcatf.
         COMMITM commitm. COMMITF commitf. PARNEWM parnewm.
         PARNEWF parnewf. PARNOM parnom. PARNOF parnof.
         ADCRNEWM adcrnewm. ADCRNEWF adcrnewf. ADCRNOM adcrnom.
         ADCRNOF adcrnof. ADTRANSM adtransm. ADTRANSF adtransf.
         ADAWOLM adawolm. ADAWOLF adawolf. ADESCAPM adescapm.
         ADESCAPF adescapf. ADAWESM adawesm. ADAWESF adawesf.
         ADRETM adretm. ADRETF adretf. ADOTHM adothm.
         ADOTHF adothf. ADTOTM adtotm. ADTOTF adtotf.
         RLUNEXPM rlunexpm. RLUNEXPF rlunexpf. RLUNCOMM rluncomm.
         RLUNCOMF rluncomf. RLUNOTHM rlunothm. RLUNOTHF rlunothf.
         RLCOPROM rlcoprom. RLCOPROF rlcoprof. RLCOSUPM rlcosupm.
         RLCOSUPF rlcosupf. RLCODPM rlcodpm. RLCODPF rlcodpf.
         RLCOOTHM rlcoothm. RLCOOTHF rlcoothf. RLDEATHM rldeathm.
         RLDEATHF rldeathf. RLAWOLM rlawolm. RLAWOLF rlawolf.
         RLESCAPM rlescapm. RLESCAPF rlescapf. RLAWESM rlawesm.
         RLAWESF rlawesf. RLTRANM rltranm. RLTRANF rltranf.
         RLBONDM rlbondm. RLBONDF rlbondf. RLOTHM rlothm.
         RLOTHF rlothf. RLTOTM rltotm. RLTOTF rltotf.
         FLOJANM flojanm. FLOJANF flojanf. FLOADMM floadmm.
         FLOADMF floadmf. FLORLM florlm. FLORLF florlf.
         FLODECM flodecm. FLODECF flodecf. CAPRATEM capratem.
         CAPRATEF capratef. CAPOPM capopm. CAPOPF capopf.
         CAPDESM capdesm. CAPDESF capdesf. CAPRATET capratet.
         CAPOPT capopt. CAPDEST capdest. HIVTEST hivtest.
         HIVINC hivinc. HIVCUR hivcur. HIVREL hivrel.
         HIVRAN hivran. HIVCERT hivcert. HIVHIGH hivhigh.
         HIVREQ hivreq. HIVORD hivord. HIVCLIN hivclin.
         HIVINCID hivincid. HIVOTH hivoth. HIVASYMM hivasymm.
         HIVASYMF hivasymf. HIVASYMT hivasymt. HIVLESSM hivlessm.
         HIVLESSF hivlessf. HIVLESST hivlesst. AIDSCONM aidsconm.
         AIDSCONF aidsconf. AIDSCONT aidscont. HIVATOTM hivatotm.
         HIVATOTF hivatotf. HIVATOTT hivatott. CUSLT18M cuslt18m.
         CUSLT18F cuslt18f. CUSCTZNM cusctznm. CUSCTZNF cusctznf.
         DTHEXECM dthexecm. DTHEXECF dthexecf. DTHILLNM dthillnm.
         DTHILLNF dthillnf. DTHAIDSM dthaidsm. DTHAIDSF dthaidsf.
         DTHSUICM dthsuicm. DTHSUICF dthsuicf. DTHACCM dthaccm.
         DTHACCF dthaccf. DTHHOMIM dthhomim. DTHHOMIF dthhomif.
         DTHHOMOM dthhomom. DTHHOMOF dthhomof. DTHPERSM dthpersm.
         DTHPERSF dthpersf. DTHOTHM dthothm. DTHOTHF dthothf.
         DTHTOTM dthtotm. DTHTOTF dthtotf. HANDLEM handlem.
         HANDLEF handlef.  ;
*/

RUN ;
