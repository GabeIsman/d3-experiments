/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 34981
 |                NATIONAL PRISONER STATISTICS, 1978-2012
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. The metadata
 | provided below are not stored in the SAS transport version of this data
 | collection.  Users need to use SAS PROC CIMPORT to import the SAS
 | transport file to a SAS data set on their system. This program can
 | then be used in conjunction with the SAS system data file.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
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
 | NOTE:  Users should modify this file to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*').
 | To make this section active in the program, users should remove the SAS
 | comment indicators from this section.
 |
 |------------------------------------------------------------------------*/

RUN;

* SAS DATA STEP;
DATA;
SET SAS-dataset ;


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

RUN ;
