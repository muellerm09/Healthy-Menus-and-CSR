 ****Analysis file for AHA paper 2 sensitivity analyses per Sara's email 5.8.24
 
 /*import delimited "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/nutrition_data (1).csv", stringcols(1) 
 encode restaurantid, generate (restaurantid2)
drop restaurantid
rename restaurantid2 restaurantid

encode csr_page_yn, generate (csr_page_yn2)
drop csr_page_yn
rename csr_page_yn2 csr_page_yn

encode resttype_cat, generate (resttype_cat2)
drop resttype_cat
rename resttype_cat2 resttype_cat

encode labeling, generate (labeling2)
drop labeling
rename labeling2 labeling


encode mealcomponent, generate (mealcomponent2)
drop mealcomponent
rename mealcomponent2 mealcomponent

save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/nutrition_data_AHA_CSR.dta"
*/


use "/Users/meganmueller/Dropbox/Potential Post Doc Ideas/AHA GRANT/menustat_final.dta"
keep restaurantid Calories Dietary_Fiber foodcat Item_Name Kids_Meal Limited_Time_Offer Menu_Item_ID Regional Saturated_Fat Shareable Sugar Sodium Total_Fat year Item_Description



/*generate new variable that's just for not in 2012
generate notin2012=.
replace notin2012=1 if year==2012 & Item_Description==""
bysort Menu_Item_ID: carryforward notin2012, gen(notin2012_1)

drop if notin2012==1
sort new_restaurantid
drop restaurantid
encode new_restaurantid, generat (restaurantid)
*/

****creating a database for identifying items as new, dropped, etc.

keep Item_Description Menu_Item_ID year 

reshape wide Item_Description, i(Menu_Item_ID)  j(year) 

**Assign commmon, new, only, kept and dropped flags to Menustat data in wide form.
*Common = item on menu in all years
*New = item introduced in that year
*Only = item introduced in that year and then dropped before the next year
*Kept = item introducted in that year and then stays on menu until 2018
*Dropped = item introducted in that year and then is dropped at some point between that year and 2018.


*updating common item variable across 12-18*
gen common_allyears=0
replace common_allyears=1 if Item_Description2012!="" & Item_Description2013!="" & Item_Description2014!="" & Item_Description2015!="" & Item_Description2016!="" & Item_Description2017!="" & Item_Description2018!=""


**creating variables to compare old and new menu items
*indicators for item on menu ONLY in each year
gen only_2012=0
replace only_2012=1 if Item_Description2012!="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018==""
label variable only_2012 "2012 menu only"

*gen new_2012=only_2012

gen only_2013=0
replace only_2013=1 if Item_Description2012=="" & Item_Description2013!="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018==""
label variable only_2013 "2013 menu only"

gen only_2014=0
replace only_2014=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014!="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018==""
label variable only_2014 "2014 menu only"

gen only_2015=0
replace only_2015=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015!="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018==""
label variable only_2015 "2015 menu only"

gen only_2016=0
replace only_2016=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016!="" & Item_Description2017=="" & Item_Description2018==""
label variable only_2016 "2016 menu only"

gen only_2017=0
replace only_2017=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017!="" & Item_Description2018==""
label variable only_2017 "2017 menu only"

gen only_2018=0
replace only_2018=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018!=""
label variable only_2018 "2018 menu only"


*indicators for new item on menu in each year and flag dropped and kept menu items
gen drop_2012= only_2012

gen new_2013=0
replace new_2013=1 if Item_Description2012=="" & Item_Description2013!="" 
label variable new_2013 "new in 2013"

gen kept_2013=0
replace kept_2013=1 if Item_Description2012=="" & Item_Description2013!="" & Item_Description2014!="" & Item_Description2015!="" & Item_Description2016!="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2013=0
replace drop_2013=1 if Item_Description2012!="" & drop_2012!=1 & Item_Description2013=="" & (Item_Description2014=="" | Item_Description2015=="" | Item_Description2016=="" | Item_Description2017=="" | Item_Description2018=="")

gen new_2014=0
replace new_2014=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014!="" 
label variable new_2014 "new in 2014"

gen kept_2014=0
replace kept_2014=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014!="" & Item_Description2015!="" & Item_Description2016!="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2014=0
replace drop_2014=1 if (Item_Description2012!="" | Item_Description2013!="") & Item_Description2014=="" & drop_2012!=1 & drop_2013!=1 & (Item_Description2015=="" | Item_Description2016=="" | Item_Description2017=="" | Item_Description2018=="")


gen new_2015=0
replace new_2015=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015!="" 
label variable new_2015 "new in 2015"

gen kept_2015=0
replace kept_2015=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015!="" & Item_Description2016!="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2015=0
replace drop_2015=1 if (Item_Description2012!="" | Item_Description2013!="" | Item_Description2014!="") & Item_Description2015=="" & drop_2012!=1 & drop_2013!=1 & drop_2014!=1 & (Item_Description2016=="" | Item_Description2017=="" | Item_Description2018=="")


gen new_2016=0
replace new_2016=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016!="" 
label variable new_2016 "new in 2016"

gen kept_2016=0
replace kept_2016=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016!="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2016=0
replace drop_2016=1 if (Item_Description2012!="" | Item_Description2013!="" | Item_Description2014!="" | Item_Description2015!="") & Item_Description2016=="" & drop_2012!=1 & drop_2013!=1 & drop_2014!=1 & drop_2015!=1 & (Item_Description2017=="" | Item_Description2018=="")

gen new_2017=0
replace new_2017=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017!="" 
label variable new_2017 "new in 2017"

gen kept_2017=0
replace kept_2017=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2017=0
replace drop_2017=1 if (Item_Description2012!="" | Item_Description2013!="" | Item_Description2014!="" | Item_Description2015!="" ! | Item_Description2016!="") &  Item_Description2017=="" & drop_2012!=1 & drop_2013!=1 & drop_2014!=1 & drop_2015!=1 & drop_2016!=1 & Item_Description2018==""

gen new_2018=0
replace new_2018=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017=="" & Item_Description2018!=""

gen kept_2018=0
replace kept_2018=1 if Item_Description2012=="" & Item_Description2013=="" & Item_Description2014=="" & Item_Description2015=="" & Item_Description2016=="" & Item_Description2017!="" & Item_Description2018!=""

gen drop_2018=0
replace drop_2018=1 if (Item_Description2012!="" | Item_Description2013!="" | Item_Description2014!="" | Item_Description2015!="" | Item_Description2016!=""& Item_Description2017!="") & Item_Description2018=="" & drop_2012!=1 & drop_2013!=1 & drop_2014!=1 & drop_2015!=1 & drop_2016!=1 & drop_2017!=1 

label variable new_2018 "new in 2018"

generate onlynew=0
replace onlynew=1 if common_allyears!=1 & (new_2018==1 & only_2018==1) | (new_2017==1 & only_2017==1) | (new_2016==1 & only_2016==1)| (new_2015==1 & only_2015==1) | (new_2014==1 & only_2014==1) | (new_2013==1 & only_2013==1)

*gen tag for items that appear in 2012, drop at some point between 2013 and 2016 then reappears between 2014-2018
gen reappear=0
replace reappear=1 if (drop_2013==1|(Item_Description2013==""  & new_2014!=1 & new_2015!=1 & new_2016!=1 & new_2017!=1 & new_2018!=1)) & (Item_Description2014!="" | Item_Description2015!="" | Item_Description2016!="" | Item_Description2017!="" | Item_Description2018!="") & (common!=1 & onlynew!=1)
replace reappear=1 if (drop_2014==1|(Item_Description2014=="" & new_2015!=1 & new_2016!=1 & new_2017!=1 & new_2018!=1)) & (Item_Description2015!="" | Item_Description2016!="" | Item_Description2017!="" | Item_Description2018!="") & (common!=1 & onlynew!=1)
replace reappear=1 if (drop_2015==1|(Item_Description2015=="" & new_2016!=1 & new_2017!=1 & new_2018!=1)) & ( Item_Description2016!="" | Item_Description2017!="" | Item_Description2018!="") & (common!=1 & onlynew!=1)
replace reappear=1 if (drop_2016==1|(Item_Description2016=="" & new_2017!=1 & new_2018!=1)) & ( Item_Description2017!="" | Item_Description2018!="") & (common!=1 & onlynew!=1)
replace reappear=1 if (drop_2017==1|(Item_Description2017=="" & new_2018!=1)) & Item_Description2018!="" & (common!=1 & onlynew!=1)

*generate miss2012=.
*replace miss2012=1 if Item_Description2012==""
***
/*replace Item_Description2013=Item_Description2012 if drop_2013==1
replace Item_Description2014=Item_Description2013 if drop_2014==1
replace Item_Description2015=Item_Description2014 if drop_2015==1
replace Item_Description2016=Item_Description2015 if drop_2016==1
replace Item_Description2017=Item_Description2016 if drop_2017==1
replace Item_Description2018=Item_Description2017 if drop_2018==1
*/
reshape long new_ drop_ kept_ only_  Item_Description, i(Menu_Item_ID)  j(year)  

sort Menu_Item_ID year


*drop if miss2012==1

replace new_=0 if new_==.
replace kept_=0 if kept_==.

drop if Item_Description==""

****merging new, dropped items using code from Mark Soto "from MenuSTAT Analysis.do"
merge m:m Menu_Item_ID year using "/Users/meganmueller/Dropbox/Potential Post Doc Ideas/AHA GRANT/menustat_final.dta"
/*
 merge m:m Menu_Item_ID year using "/Users/meganmueller/Dropbox/Potential Post Doc Ideas/AHA GRANT/menustat_final.dta"

    Result                           # of obs.
    -----------------------------------------
    not matched                             0
    matched                           193,102  (_merge==3)
    -----------------------------------------


*/


/*
. drop if Item_Description==""
(359,387 observations deleted)
*/
/*tsset Menu_Item_ID year
tsfill, full

generate miss2012=.
replace miss2012=1 if Item_Description=="" & year==2012
sort year Menu_Item_ID
if year==2012 bysort Menu_Item_ID: carryforward miss2012, gen(miss2012_all) 
*/

keep restaurantid Calories Dietary_Fiber foodcat Item_Name Kids_Meal Limited_Time_Offer Menu_Item_ID Regional Saturated_Fat Shareable Sugar Sodium Total_Fat year Item_Description _merge reappear common_allyears new_ onlynew 

rename Calories calories
rename Dietary_Fiber dietary_fiber
rename Kids_Meal kids_meal
rename Total_Fat total_fat
rename Sodium sodium
rename Saturated_Fat saturated_fat
rename Regional regional
rename Shareable shareable
rename Sugar sugar
rename Limited_Time_Offer limited_time_offer

drop _merge

/*
tab restaurantid, nolabel

sort Menu_Item_ID year

tsset Menu_Item_ID year
tsfill, full

 
generate missing2012=.
replace missing2012=1 if year==2012 &  Item_Description==""


bysort Menu_Item_ID: carryforward missing2012, gen(only_2012_all)

bysort restaurantid: egen missing2012_sum = sum(missing2012)
*/
/*
generate only_2012=1 if only_==1 & year==2012
bysort Menu_Item_ID: carryforward only_2012, gen(only_2012_all)
drop if only_2012_all==1 
drop only_2012_all only_2012
*/ 

*drop if drop_==1

tab year
/*  tab year


       Year |      Freq.     Percent        Cum.
------------+-----------------------------------
       2012 |     16,163        8.37        8.37
       2013 |     23,860       12.36       20.73
       2014 |     25,278       13.09       33.82
       2015 |     28,666       14.85       48.66
       2016 |     33,916       17.56       66.23
       2017 |     35,099       18.18       84.40
       2018 |     30,120       15.60      100.00
------------+-----------------------------------
      Total |    193,102      100.00


*/


/*
drop if Calories==.
drop if Dietary_Fiber==.
drop if Saturated_Fat==.
drop if Sodium==.
drop if Sugar==.
drop if Total_Fat==.
/*
. drop if Calories==.
(24,387 observations deleted)

. drop if Dietary_Fiber==.
(7,184 observations deleted)

. drop if Saturated_Fat==.
(3,109 observations deleted)

. drop if Sodium==.
(151 observations deleted)

. drop if Sugar==.
(9,827 observations deleted)

. drop if Total_Fat==.
(38 observations deleted)
*/
*/


/*this isn't working....
tsset Menu_Item_ID year
tsfill, full


generate miss2012=.
replace miss2012=1 if year==2012 & restaurantid==.
bysort Menu_Item_ID: carryforward miss2012, gen(miss2012_all)
drop if miss2012_all==1 
drop miss2012_all miss2012
*/

tab restaurantid year
/*

 tab restaurantid year

                      |                                     Year
         restaurantid |      2012       2013       2014       2015       2016       2017       2018 |     Total
----------------------+-----------------------------------------------------------------------------+----------
             7 eleven |         0         82        103        101        105         85        143 |       619 
           applebee's |       292        317        318        303        347        261        310 |     2,148 
               arby's |       136        134        174        157        131        152        126 |     1,010 
        auntie anne's |         0          0        143        187        188        190        198 |       906 
       baskin robbins |       303        376        379        385        468        472        311 |     2,694 
bj's restaurant & bre |         0          0          0        455        395        403        527 |     1,780 
            bob evans |       356        359        424        341        405        403        438 |     2,726 
            bojangles |       109        129        125        124        162        171        182 |     1,002 
       bonefish grill |         0          0        198        243        310        292        186 |     1,229 
        boston market |        81         69        104         95         98        101        101 |       649 
          burger king |       308        361        402        338        262        196        199 |     2,066 
california pizza kitc |       368        364        352        352        360        361        341 |     2,498 
          captain d's |       155         94         86        115        124        127        111 |       812 
           carl's jr. |       229        230        171        168        202        223        191 |     1,414 
carrabba's italian gr |         0        242        228        299        193        234        280 |     1,476 
casey's general store |         0         75        112        131        129        134        229 |       810 
checker's drive-in/ra |       147        154        158        164        160        161         83 |     1,027 
          chick-fil-a |       126        139        155        139        128        119        120 |       926 
              chili's |       239        236        242        242        297        402        355 |     2,013 
             chipotle |        48         66         67         64         74         77         69 |       465 
      chuck e. cheese |         0         62         62         66        106        128        259 |       683 
    church's chicken  |        83         83         80         78         80        107        141 |       652 
        ci ci's pizza |        71         70         67         75         93         73         57 |       506 
             culver's |       376        488        585        606        632        463        432 |     3,582 
          dairy queen |       592        678        648        585        419        455        438 |     3,815 
             del taco |       141        110        130        147        125        131        252 |     1,036 
              denny's |       227        278        339        290        541        333        286 |     2,294 
dickey's barbeque pit |         0          0          0          0          0          0        157 |       157 
              dominos |       446        446        495        430        383        557        445 |     3,202 
       dunkin' donuts |       665      1,534      1,009      2,636      2,043      2,850        857 |    11,594 
        einstein bros |       199        205        221        225        251        244        330 |     1,675 
        el pollo loco |       147        193        211        208        146        164        180 |     1,249 
        famous dave's |         0          0          0        379        361        364        298 |     1,402 
       firehouse subs |         0          0        524        250        300        283        873 |     2,230 
            five guys |        35         36         52         52         54         56         59 |       344 
           friendly's |       423        491        505        536        413        303        317 |     2,988 
     frisch's big boy |         0          0          0          0        462        356        408 |     1,226 
        golden corral |       439        441        443        505        598        654        741 |     3,821 
             hardee's |       138        200        193        201        196        242        177 |     1,347 
              hooters |         0          0          0          0         90        121        130 |       341 
                 ihop |       495        487        517        554        412        404        407 |     3,276 
      in-n-out burger |        28         28         28         33         33         35         58 |       243 
      jack in the box |       320        226        244        242        299        311        313 |     1,955 
          jamba juice |       220        213        216        228        258        191        199 |     1,525 
         jason's deli |       377        346        312        447        467        522        457 |     2,928 
   jersey mike's subs |         0          0          0        629        716        616        978 |     2,939 
         jimmy john's |        53         53         47         45         51         77         82 |       408 
     joe's crab shack |         0          0          0        178        211        173        277 |       839 
                  kfc |       198        203        230        220        209        222        241 |     1,523 
         krispy kreme |         0        336        360        223        213        233        226 |     1,591 
              krystal |       182        176        185        187        174        175        129 |     1,208 
       little caesars |        31         36         31         37         38         34         74 |       281 
   long john silver's |        99        101        128        140        134        115        115 |       832 
  longhorn steakhouse |       253        254        299        246        290        309        360 |     2,011 
        marco's pizza |         0          0          0          0          0        449        291 |       740 
     mcalister's deli |         0          0        298        334        316        337        214 |     1,499 
           mcdonald's |       349        414        604        567        617        310        224 |     3,085 
moe's southwest grill |         0          0        144        173        300        298        144 |     1,059 
    noodles & company |         0          0          0         89        106         90         94 |       379 
          o'charley's |       207        249        173        294        305        334        224 |     1,786 
         olive garden |       278        285        244        274        345        379        286 |     2,091 
        on the border |         0        221        236        304        288        274        263 |     1,586 
   outback steakhouse |       208        280        336        263        348        356        180 |     1,971 
        panda express |        39         96        137        128        143        166        179 |       888 
         panera bread |       565        598        585        318        315        292        324 |     2,997 
          papa john's |       135        108        143        150        217        261        946 |     1,960 
        papa murphy's |       135        180        210        217        244        500        155 |     1,641 
              perkins |         0        407        389        349        508        553        497 |     2,703 
           pf chang's |       312        349        329        297        351        308        193 |     2,139 
            pizza hut |       208        205        143        263        307        972        245 |     2,343 
              popeyes |        82         87        101         96         99         95        106 |       666 
potbelly sandwich sho |         0          0          0          0          0          0        292 |       292 
                qdoba |        48        133        122        132         81         96         97 |       709 
              quiznos |       684        532        491        516        620        429        407 |     3,679 
          red lobster |       342        352        377        354        407        361        307 |     2,500 
            red robin |         0        220        249        333        323        334        421 |     1,880 
romano's macaroni gri |       159        172        177        196        216        220        164 |     1,304 
    round table pizza |         0          0          0          0        413        464        406 |     1,283 
         ruby tuesday |       349        209        299        272        280        289        229 |     1,927 
               sbarro |         0          0        210         89        181         57        207 |       744 
               sheetz |         0      1,655        808        348      4,806      1,054      1,375 |    10,046 
                sonic |       498        590        979      1,041        924        982        623 |     5,637 
            starbucks |       187      1,378      1,391      1,810      1,028      3,849        655 |    10,298 
       steak 'n shake |       272        305        349        386        294        330        513 |     2,449 
               subway |       296        289        242        252        248        249        237 |     1,813 
            taco bell |       152        163        172        209        237        445        325 |     1,703 
         tgi friday's |       212        212        232        218        276        307        513 |     1,970 
   the capital grille |         0          0          0          0        148        187        151 |       486 
          tim hortons |       380        393        396        502        408        454        340 |     2,873 
                 wawa |         0      1,564      1,476      1,130      1,119      1,248      1,437 |     7,974 
              wendy's |       214        262        253        124        213        279        138 |     1,483 
          whataburger |       160        151        297        323        338        360        278 |     1,907 
         white castle |       353        407        364        411        418        422        344 |     2,719 
             wingstop |         0          0          0         66         70         71        104 |       311 
           yard house |         0          0          0        538        532        520        405 |     1,995 
              zaxby's |       204        193        220        219        191        253        334 |     1,614 
----------------------+-----------------------------------------------------------------------------+----------
                Total |    16,163     23,860     25,278     28,666     33,916     35,099     30,120 |   193,102 


*/

/*
 tab restaurantid

               restaurantid |      Freq.     Percent        Cum.
----------------------------+-----------------------------------
                   7 eleven |        619        0.32        0.32
                 applebee's |      2,148        1.11        1.43
                     arby's |      1,010        0.52        1.96
              auntie anne's |        906        0.47        2.43
             baskin robbins |      2,694        1.40        3.82
bj's restaurant & brewhouse |      1,780        0.92        4.74
                  bob evans |      2,726        1.41        6.15
                  bojangles |      1,002        0.52        6.67
             bonefish grill |      1,229        0.64        7.31
              boston market |        649        0.34        7.65
                burger king |      2,066        1.07        8.72
   california pizza kitchen |      2,498        1.29       10.01
                captain d's |        812        0.42       10.43
                 carl's jr. |      1,414        0.73       11.16
   carrabba's italian grill |      1,476        0.76       11.93
      casey's general store |        810        0.42       12.35
  checker's drive-in/rallys |      1,027        0.53       12.88
                chick-fil-a |        926        0.48       13.36
                    chili's |      2,013        1.04       14.40
                   chipotle |        465        0.24       14.64
            chuck e. cheese |        683        0.35       14.99
          church's chicken  |        652        0.34       15.33
              ci ci's pizza |        506        0.26       15.59
                   culver's |      3,582        1.85       17.45
                dairy queen |      3,815        1.98       19.42
                   del taco |      1,036        0.54       19.96
                    denny's |      2,294        1.19       21.15
      dickey's barbeque pit |        157        0.08       21.23
                    dominos |      3,202        1.66       22.89
             dunkin' donuts |     11,594        6.00       28.89
              einstein bros |      1,675        0.87       29.76
              el pollo loco |      1,249        0.65       30.41
              famous dave's |      1,402        0.73       31.13
             firehouse subs |      2,230        1.15       32.29
                  five guys |        344        0.18       32.47
                 friendly's |      2,988        1.55       34.01
           frisch's big boy |      1,226        0.63       34.65
              golden corral |      3,821        1.98       36.63
                   hardee's |      1,347        0.70       37.32
                    hooters |        341        0.18       37.50
                       ihop |      3,276        1.70       39.20
            in-n-out burger |        243        0.13       39.32
            jack in the box |      1,955        1.01       40.34
                jamba juice |      1,525        0.79       41.12
               jason's deli |      2,928        1.52       42.64
         jersey mike's subs |      2,939        1.52       44.16
               jimmy john's |        408        0.21       44.37
           joe's crab shack |        839        0.43       44.81
                        kfc |      1,523        0.79       45.60
               krispy kreme |      1,591        0.82       46.42
                    krystal |      1,208        0.63       47.05
             little caesars |        281        0.15       47.19
         long john silver's |        832        0.43       47.62
        longhorn steakhouse |      2,011        1.04       48.66
              marco's pizza |        740        0.38       49.05
           mcalister's deli |      1,499        0.78       49.82
                 mcdonald's |      3,085        1.60       51.42
      moe's southwest grill |      1,059        0.55       51.97
          noodles & company |        379        0.20       52.17
                o'charley's |      1,786        0.92       53.09
               olive garden |      2,091        1.08       54.17
              on the border |      1,586        0.82       55.00
         outback steakhouse |      1,971        1.02       56.02
              panda express |        888        0.46       56.48
               panera bread |      2,997        1.55       58.03
                papa john's |      1,960        1.02       59.04
              papa murphy's |      1,641        0.85       59.89
                    perkins |      2,703        1.40       61.29
                 pf chang's |      2,139        1.11       62.40
                  pizza hut |      2,343        1.21       63.61
                    popeyes |        666        0.34       63.96
     potbelly sandwich shop |        292        0.15       64.11
                      qdoba |        709        0.37       64.48
                    quiznos |      3,679        1.91       66.38
                red lobster |      2,500        1.29       67.68
                  red robin |      1,880        0.97       68.65
    romano's macaroni grill |      1,304        0.68       69.33
          round table pizza |      1,283        0.66       69.99
               ruby tuesday |      1,927        1.00       70.99
                     sbarro |        744        0.39       71.37
                     sheetz |     10,046        5.20       76.58
                      sonic |      5,637        2.92       79.50
                  starbucks |     10,298        5.33       84.83
             steak 'n shake |      2,449        1.27       86.10
                     subway |      1,813        0.94       87.04
                  taco bell |      1,703        0.88       87.92
               tgi friday's |      1,970        1.02       88.94
         the capital grille |        486        0.25       89.19
                tim hortons |      2,873        1.49       90.68
                       wawa |      7,974        4.13       94.81
                    wendy's |      1,483        0.77       95.57
                whataburger |      1,907        0.99       96.56
               white castle |      2,719        1.41       97.97
                   wingstop |        311        0.16       98.13
                 yard house |      1,995        1.03       99.16
                    zaxby's |      1,614        0.84      100.00
----------------------------+-----------------------------------
                      Total |    193,102      100.00

. tab restaurantid, nolabel

restauranti |
          d |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |        619        0.32        0.32
          2 |      2,148        1.11        1.43
          3 |      1,010        0.52        1.96
          4 |        906        0.47        2.43
          5 |      2,694        1.40        3.82
          6 |      1,780        0.92        4.74
          7 |      2,726        1.41        6.15
          8 |      1,002        0.52        6.67
          9 |      1,229        0.64        7.31
         10 |        649        0.34        7.65
         11 |      2,066        1.07        8.72
         12 |      2,498        1.29       10.01
         13 |        812        0.42       10.43
         14 |      1,414        0.73       11.16
         15 |      1,476        0.76       11.93
         16 |        810        0.42       12.35
         17 |      1,027        0.53       12.88
         18 |        926        0.48       13.36
         19 |      2,013        1.04       14.40
         20 |        465        0.24       14.64
         21 |        683        0.35       14.99
         22 |        652        0.34       15.33
         23 |        506        0.26       15.59
         24 |      3,582        1.85       17.45
         25 |      3,815        1.98       19.42
         26 |      1,036        0.54       19.96
         27 |      2,294        1.19       21.15
         28 |        157        0.08       21.23
         29 |      3,202        1.66       22.89
         30 |     11,594        6.00       28.89
         31 |      1,675        0.87       29.76
         32 |      1,249        0.65       30.41
         33 |      1,402        0.73       31.13
         34 |      2,230        1.15       32.29
         35 |        344        0.18       32.47
         36 |      2,988        1.55       34.01
         37 |      1,226        0.63       34.65
         38 |      3,821        1.98       36.63
         39 |      1,347        0.70       37.32
         40 |        341        0.18       37.50
         41 |      3,276        1.70       39.20
         42 |        243        0.13       39.32
         43 |      1,955        1.01       40.34
         44 |      1,525        0.79       41.12
         45 |      2,928        1.52       42.64
         46 |      2,939        1.52       44.16
         47 |        408        0.21       44.37
         48 |        839        0.43       44.81
         49 |      1,523        0.79       45.60
         50 |      1,591        0.82       46.42
         51 |      1,208        0.63       47.05
         52 |        281        0.15       47.19
         53 |        832        0.43       47.62
         54 |      2,011        1.04       48.66
         55 |        740        0.38       49.05
         56 |      1,499        0.78       49.82
         57 |      3,085        1.60       51.42
         58 |      1,059        0.55       51.97
         59 |        379        0.20       52.17
         60 |      1,786        0.92       53.09
         61 |      2,091        1.08       54.17
         62 |      1,586        0.82       55.00
         63 |      1,971        1.02       56.02
         64 |        888        0.46       56.48
         65 |      2,997        1.55       58.03
         66 |      1,960        1.02       59.04
         67 |      1,641        0.85       59.89
         68 |      2,703        1.40       61.29
         69 |      2,139        1.11       62.40
         70 |      2,343        1.21       63.61
         71 |        666        0.34       63.96
         72 |        292        0.15       64.11
         73 |        709        0.37       64.48
         74 |      3,679        1.91       66.38
         75 |      2,500        1.29       67.68
         76 |      1,880        0.97       68.65
         77 |      1,304        0.68       69.33
         78 |      1,283        0.66       69.99
         79 |      1,927        1.00       70.99
         80 |        744        0.39       71.37
         81 |     10,046        5.20       76.58
         82 |      5,637        2.92       79.50
         83 |     10,298        5.33       84.83
         84 |      2,449        1.27       86.10
         85 |      1,813        0.94       87.04
         86 |      1,703        0.88       87.92
         87 |      1,970        1.02       88.94
         88 |        486        0.25       89.19
         89 |      2,873        1.49       90.68
         90 |      7,974        4.13       94.81
         91 |      1,483        0.77       95.57
         92 |      1,907        0.99       96.56
         93 |      2,719        1.41       97.97
         94 |        311        0.16       98.13
         95 |      1,995        1.03       99.16
         96 |      1,614        0.84      100.00
------------+-----------------------------------
      Total |    193,102      100.00


*/
****need to delete 7 eleven (1),  auntie anne's (4), bj's restaurant & bre (9), bonefish grill (), carrabba's italian gr ,casey's general store,  chuck e. cheese, dickey's barbeque pit, famous dave's, firehouse subs,  frisch's big boy,  hooters, jersey mike's subs, joe's crab shack, krispy kreme, marco's pizza,  mcalister's deli, mcalister's deli, moe's southwest grill, noodles & company, on the border, perkins, potbelly sandwich sho, potbelly sandwich sho, red robin, round table pizza, sbarro, sheetz, the capital grille, wawa, wingstop, yard house 

sort restaurantid
decode restaurantid, generate (new_restaurantid)

generate drop_2012=.
replace drop_2012=1 if new_restaurantid=="7 eleven"
replace drop_2012=1 if new_restaurantid=="auntie anne's"
replace drop_2012=1 if new_restaurantid=="bj's restaurant & brewhouse"
replace drop_2012=1 if new_restaurantid=="bonefish grill"
replace drop_2012=1 if new_restaurantid=="carrabba's italian grill"
replace drop_2012=1 if new_restaurantid=="casey's general store"
replace drop_2012=1 if new_restaurantid=="chuck e. cheese"
replace drop_2012=1 if new_restaurantid=="dickey's barbeque pit"
replace drop_2012=1 if new_restaurantid=="famous dave's"
replace drop_2012=1 if new_restaurantid=="firehouse subs"
replace drop_2012=1 if new_restaurantid=="frisch's big boy" 
replace drop_2012=1 if new_restaurantid=="hooters"
replace drop_2012=1 if new_restaurantid=="jersey mike's subs"
replace drop_2012=1 if new_restaurantid=="joe's crab shack"
replace drop_2012=1 if new_restaurantid=="krispy kreme"
replace drop_2012=1 if new_restaurantid=="marco's pizza"
replace drop_2012=1 if new_restaurantid=="mcalister's deli"
replace drop_2012=1 if new_restaurantid=="moe's southwest grill"
replace drop_2012=1 if new_restaurantid=="noodles & company"
replace drop_2012=1 if new_restaurantid=="on the border"
replace drop_2012=1 if new_restaurantid=="perkins"
replace drop_2012=1 if new_restaurantid=="potbelly sandwich shop"
replace drop_2012=1 if new_restaurantid=="red robin" 
replace drop_2012=1 if new_restaurantid=="round table pizza"
replace drop_2012=1 if new_restaurantid=="sbarro"
replace drop_2012=1 if new_restaurantid=="sheetz"
replace drop_2012=1 if new_restaurantid=="the capital grille"
replace drop_2012=1 if new_restaurantid=="wawa"
replace drop_2012=1 if new_restaurantid=="wingstop"
replace drop_2012=1 if new_restaurantid=="yard house"

drop if drop_2012==1

tab restaurantid year

/* tab restaurantid year

                      |                               Year
         restaurantid |      2012       2013       2014       2015       2016       2017 |     Total
----------------------+------------------------------------------------------------------+----------
           applebee's |       292        317        318        303        347        261 |     2,148 
               arby's |       136        134        174        157        131        152 |     1,010 
       baskin robbins |       303        376        379        385        468        472 |     2,694 
            bob evans |       356        359        424        341        405        403 |     2,726 
            bojangles |       109        129        125        124        162        171 |     1,002 
        boston market |        81         69        104         95         98        101 |       649 
          burger king |       308        361        402        338        262        196 |     2,066 
california pizza kitc |       368        364        352        352        360        361 |     2,498 
          captain d's |       155         94         86        115        124        127 |       812 
           carl's jr. |       229        230        171        168        202        223 |     1,414 
checker's drive-in/ra |       147        154        158        164        160        161 |     1,027 
          chick-fil-a |       126        139        155        139        128        119 |       926 
              chili's |       239        236        242        242        297        402 |     2,013 
             chipotle |        48         66         67         64         74         77 |       465 
    church's chicken  |        83         83         80         78         80        107 |       652 
        ci ci's pizza |        71         70         67         75         93         73 |       506 
             culver's |       376        488        585        606        632        463 |     3,582 
          dairy queen |       592        678        648        585        419        455 |     3,815 
             del taco |       141        110        130        147        125        131 |     1,036 
              denny's |       227        278        339        290        541        333 |     2,294 
              dominos |       446        446        495        430        383        557 |     3,202 
       dunkin' donuts |       665      1,534      1,009      2,636      2,043      2,850 |    11,594 
        einstein bros |       199        205        221        225        251        244 |     1,675 
        el pollo loco |       147        193        211        208        146        164 |     1,249 
            five guys |        35         36         52         52         54         56 |       344 
           friendly's |       423        491        505        536        413        303 |     2,988 
        golden corral |       439        441        443        505        598        654 |     3,821 
             hardee's |       138        200        193        201        196        242 |     1,347 
                 ihop |       495        487        517        554        412        404 |     3,276 
      in-n-out burger |        28         28         28         33         33         35 |       243 
      jack in the box |       320        226        244        242        299        311 |     1,955 
          jamba juice |       220        213        216        228        258        191 |     1,525 
         jason's deli |       377        346        312        447        467        522 |     2,928 
         jimmy john's |        53         53         47         45         51         77 |       408 
                  kfc |       198        203        230        220        209        222 |     1,523 
              krystal |       182        176        185        187        174        175 |     1,208 
       little caesars |        31         36         31         37         38         34 |       281 
   long john silver's |        99        101        128        140        134        115 |       832 
  longhorn steakhouse |       253        254        299        246        290        309 |     2,011 
           mcdonald's |       349        414        604        567        617        310 |     3,085 
          o'charley's |       207        249        173        294        305        334 |     1,786 
         olive garden |       278        285        244        274        345        379 |     2,091 
   outback steakhouse |       208        280        336        263        348        356 |     1,971 
        panda express |        39         96        137        128        143        166 |       888 
         panera bread |       565        598        585        318        315        292 |     2,997 
          papa john's |       135        108        143        150        217        261 |     1,960 
        papa murphy's |       135        180        210        217        244        500 |     1,641 
           pf chang's |       312        349        329        297        351        308 |     2,139 
            pizza hut |       208        205        143        263        307        972 |     2,343 
              popeyes |        82         87        101         96         99         95 |       666 
                qdoba |        48        133        122        132         81         96 |       709 
              quiznos |       684        532        491        516        620        429 |     3,679 
          red lobster |       342        352        377        354        407        361 |     2,500 
romano's macaroni gri |       159        172        177        196        216        220 |     1,304 
         ruby tuesday |       349        209        299        272        280        289 |     1,927 
                sonic |       498        590        979      1,041        924        982 |     5,637 
            starbucks |       187      1,378      1,391      1,810      1,028      3,849 |    10,298 
       steak 'n shake |       272        305        349        386        294        330 |     2,449 
               subway |       296        289        242        252        248        249 |     1,813 
            taco bell |       152        163        172        209        237        445 |     1,703 
         tgi friday's |       212        212        232        218        276        307 |     1,970 
          tim hortons |       380        393        396        502        408        454 |     2,873 
              wendy's |       214        262        253        124        213        279 |     1,483 
          whataburger |       160        151        297        323        338        360 |     1,907 
         white castle |       353        407        364        411        418        422 |     2,719 
              zaxby's |       204        193        220        219        191        253 |     1,614 
----------------------+------------------------------------------------------------------+----------
                Total |    16,163     18,996     19,738     21,772     21,027     25,551 |   141,897 


                      |    Year
         restaurantid |      2018 |     Total
----------------------+-----------+----------
           applebee's |       310 |     2,148 
               arby's |       126 |     1,010 
       baskin robbins |       311 |     2,694 
            bob evans |       438 |     2,726 
            bojangles |       182 |     1,002 
        boston market |       101 |       649 
          burger king |       199 |     2,066 
california pizza kitc |       341 |     2,498 
          captain d's |       111 |       812 
           carl's jr. |       191 |     1,414 
checker's drive-in/ra |        83 |     1,027 
          chick-fil-a |       120 |       926 
              chili's |       355 |     2,013 
             chipotle |        69 |       465 
    church's chicken  |       141 |       652 
        ci ci's pizza |        57 |       506 
             culver's |       432 |     3,582 
          dairy queen |       438 |     3,815 
             del taco |       252 |     1,036 
              denny's |       286 |     2,294 
              dominos |       445 |     3,202 
       dunkin' donuts |       857 |    11,594 
        einstein bros |       330 |     1,675 
        el pollo loco |       180 |     1,249 
            five guys |        59 |       344 
           friendly's |       317 |     2,988 
        golden corral |       741 |     3,821 
             hardee's |       177 |     1,347 
                 ihop |       407 |     3,276 
      in-n-out burger |        58 |       243 
      jack in the box |       313 |     1,955 
          jamba juice |       199 |     1,525 
         jason's deli |       457 |     2,928 
         jimmy john's |        82 |       408 
                  kfc |       241 |     1,523 
              krystal |       129 |     1,208 
       little caesars |        74 |       281 
   long john silver's |       115 |       832 
  longhorn steakhouse |       360 |     2,011 
           mcdonald's |       224 |     3,085 
          o'charley's |       224 |     1,786 
         olive garden |       286 |     2,091 
   outback steakhouse |       180 |     1,971 
        panda express |       179 |       888 
         panera bread |       324 |     2,997 
          papa john's |       946 |     1,960 
        papa murphy's |       155 |     1,641 
           pf chang's |       193 |     2,139 
            pizza hut |       245 |     2,343 
              popeyes |       106 |       666 
                qdoba |        97 |       709 
              quiznos |       407 |     3,679 
          red lobster |       307 |     2,500 
romano's macaroni gri |       164 |     1,304 
         ruby tuesday |       229 |     1,927 
                sonic |       623 |     5,637 
            starbucks |       655 |    10,298 
       steak 'n shake |       513 |     2,449 
               subway |       237 |     1,813 
            taco bell |       325 |     1,703 
         tgi friday's |       513 |     1,970 
          tim hortons |       340 |     2,873 
              wendy's |       138 |     1,483 
          whataburger |       278 |     1,907 
         white castle |       344 |     2,719 
              zaxby's |       334 |     1,614 
----------------------+-----------+----------
                Total |    18,650 |   141,897 
*/ 

*total 141,897

gen new_restaurantid_2 = trim(new_restaurantid)
sort new_restaurantid_2

drop if new_restaurantid_2==""

sort new_restaurantid_2
encode new_restaurantid_2, generate (encoded_restaurantid)
 
tab encoded_restaurantid, nolabel

/*
 tab encoded_restaurantid, nolabel

encoded_res |
  taurantid |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,148        1.51        1.51
          2 |      1,010        0.71        2.23
          3 |      2,694        1.90        4.12
          4 |      2,726        1.92        6.05
          5 |      1,002        0.71        6.75
          6 |        649        0.46        7.21
          7 |      2,066        1.46        8.66
          8 |      2,498        1.76       10.43
          9 |        812        0.57       11.00
         10 |      1,414        1.00       11.99
         11 |      1,027        0.72       12.72
         12 |        926        0.65       13.37
         13 |      2,013        1.42       14.79
         14 |        465        0.33       15.12
         15 |        652        0.46       15.58
         16 |        506        0.36       15.93
         17 |      3,582        2.52       18.46
         18 |      3,815        2.69       21.15
         19 |      1,036        0.73       21.88
         20 |      2,294        1.62       23.49
         21 |      3,202        2.26       25.75
         22 |     11,594        8.17       33.92
         23 |      1,675        1.18       35.10
         24 |      1,249        0.88       35.98
         25 |        344        0.24       36.22
         26 |      2,988        2.11       38.33
         27 |      3,821        2.69       41.02
         28 |      1,347        0.95       41.97
         29 |      3,276        2.31       44.28
         30 |        243        0.17       44.45
         31 |      1,955        1.38       45.83
         32 |      1,525        1.07       46.90
         33 |      2,928        2.06       48.97
         34 |        408        0.29       49.25
         35 |      1,523        1.07       50.33
         36 |      1,208        0.85       51.18
         37 |        281        0.20       51.38
         38 |        832        0.59       51.96
         39 |      2,011        1.42       53.38
         40 |      3,085        2.17       55.55
         41 |      1,786        1.26       56.81
         42 |      2,091        1.47       58.29
         43 |      1,971        1.39       59.68
         44 |        888        0.63       60.30
         45 |      2,997        2.11       62.41
         46 |      1,960        1.38       63.79
         47 |      1,641        1.16       64.95
         48 |      2,139        1.51       66.46
         49 |      2,343        1.65       68.11
         50 |        666        0.47       68.58
         51 |        709        0.50       69.08
         52 |      3,679        2.59       71.67
         53 |      2,500        1.76       73.43
         54 |      1,304        0.92       74.35
         55 |      1,927        1.36       75.71
         56 |      5,637        3.97       79.68
         57 |     10,298        7.26       86.94
         58 |      2,449        1.73       88.67
         59 |      1,813        1.28       89.94
         60 |      1,703        1.20       91.14
         61 |      1,970        1.39       92.53
         62 |      2,873        2.02       94.56
         63 |      1,483        1.05       95.60
         64 |      1,907        1.34       96.95
         65 |      2,719        1.92       98.86
         66 |      1,614        1.14      100.00
------------+-----------------------------------
      Total |    141,897      100.00


*/
 
tab encoded_restaurantid
/*

 tab encoded_restaurantid

     encoded_restaurantid |      Freq.     Percent        Cum.
--------------------------+-----------------------------------
               applebee's |      2,148        1.51        1.51
                   arby's |      1,010        0.71        2.23
           baskin robbins |      2,694        1.90        4.12
                bob evans |      2,726        1.92        6.05
                bojangles |      1,002        0.71        6.75
            boston market |        649        0.46        7.21
              burger king |      2,066        1.46        8.66
 california pizza kitchen |      2,498        1.76       10.43
              captain d's |        812        0.57       11.00
               carl's jr. |      1,414        1.00       11.99
checker's drive-in/rallys |      1,027        0.72       12.72
              chick-fil-a |        926        0.65       13.37
                  chili's |      2,013        1.42       14.79
                 chipotle |        465        0.33       15.12
         church's chicken |        652        0.46       15.58
            ci ci's pizza |        506        0.36       15.93
                 culver's |      3,582        2.52       18.46
              dairy queen |      3,815        2.69       21.15
                 del taco |      1,036        0.73       21.88
                  denny's |      2,294        1.62       23.49
                  dominos |      3,202        2.26       25.75
           dunkin' donuts |     11,594        8.17       33.92
            einstein bros |      1,675        1.18       35.10
            el pollo loco |      1,249        0.88       35.98
                five guys |        344        0.24       36.22
               friendly's |      2,988        2.11       38.33
            golden corral |      3,821        2.69       41.02
                 hardee's |      1,347        0.95       41.97
                     ihop |      3,276        2.31       44.28
          in-n-out burger |        243        0.17       44.45
          jack in the box |      1,955        1.38       45.83
              jamba juice |      1,525        1.07       46.90
             jason's deli |      2,928        2.06       48.97
             jimmy john's |        408        0.29       49.25
                      kfc |      1,523        1.07       50.33
                  krystal |      1,208        0.85       51.18
           little caesars |        281        0.20       51.38
       long john silver's |        832        0.59       51.96
      longhorn steakhouse |      2,011        1.42       53.38
               mcdonald's |      3,085        2.17       55.55
              o'charley's |      1,786        1.26       56.81
             olive garden |      2,091        1.47       58.29
       outback steakhouse |      1,971        1.39       59.68
            panda express |        888        0.63       60.30
             panera bread |      2,997        2.11       62.41
              papa john's |      1,960        1.38       63.79
            papa murphy's |      1,641        1.16       64.95
               pf chang's |      2,139        1.51       66.46
                pizza hut |      2,343        1.65       68.11
                  popeyes |        666        0.47       68.58
                    qdoba |        709        0.50       69.08
                  quiznos |      3,679        2.59       71.67
              red lobster |      2,500        1.76       73.43
  romano's macaroni grill |      1,304        0.92       74.35
             ruby tuesday |      1,927        1.36       75.71
                    sonic |      5,637        3.97       79.68
                starbucks |     10,298        7.26       86.94
           steak 'n shake |      2,449        1.73       88.67
                   subway |      1,813        1.28       89.94
                taco bell |      1,703        1.20       91.14
             tgi friday's |      1,970        1.39       92.53
              tim hortons |      2,873        2.02       94.56
                  wendy's |      1,483        1.05       95.60
              whataburger |      1,907        1.34       96.95
             white castle |      2,719        1.92       98.86
                  zaxby's |      1,614        1.14      100.00
--------------------------+-----------------------------------
                    Total |    141,897      100.00


*/
	  
drop restaurantid

rename encoded_restaurantid restaurantid

drop new_restaurantid_2 new_restaurantid

*save AHA_CSR_data_5.29.24,replace


save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.29.24.dta", replace

clear

***getting CSR data 
import excel "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/Health_CSR_by_restaurant_v4_for analyses.xlsx", sheet("Sheet1") firstrow


encode Restaurant, generate (restaurantid)
drop Restaurant

rename Year year

 tab restaurantid, nolabel
 /*
  
 Restaurant |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |          7        1.54        1.54
          2 |          7        1.54        3.08
          3 |          7        1.54        4.62
          4 |          7        1.54        6.15
          5 |          7        1.54        7.69
          6 |          7        1.54        9.23
          7 |          7        1.54       10.77
          8 |          7        1.54       12.31
          9 |          7        1.54       13.85
         10 |          7        1.54       15.38
         11 |          7        1.54       16.92
         12 |          7        1.54       18.46
         13 |          7        1.54       20.00
         14 |          7        1.54       21.54
         15 |          7        1.54       23.08
         16 |          7        1.54       24.62
         17 |          7        1.54       26.15
         18 |          7        1.54       27.69
         19 |          7        1.54       29.23
         20 |          7        1.54       30.77
         21 |          7        1.54       32.31
         22 |          7        1.54       33.85
         23 |          7        1.54       35.38
         24 |          7        1.54       36.92
         25 |          7        1.54       38.46
         26 |          7        1.54       40.00
         27 |          7        1.54       41.54
         28 |          7        1.54       43.08
         29 |          7        1.54       44.62
         30 |          7        1.54       46.15
         31 |          7        1.54       47.69
         32 |          7        1.54       49.23
         33 |          7        1.54       50.77
         34 |          7        1.54       52.31
         35 |          7        1.54       53.85
         36 |          7        1.54       55.38
         37 |          7        1.54       56.92
         38 |          7        1.54       58.46
         39 |          7        1.54       60.00
         40 |          7        1.54       61.54
         41 |          7        1.54       63.08
         42 |          7        1.54       64.62
         43 |          7        1.54       66.15
         44 |          7        1.54       67.69
         45 |          7        1.54       69.23
         46 |          7        1.54       70.77
         47 |          7        1.54       72.31
         48 |          7        1.54       73.85
         49 |          7        1.54       75.38
         50 |          7        1.54       76.92
         51 |          7        1.54       78.46
         52 |          7        1.54       80.00
         53 |          7        1.54       81.54
         54 |          7        1.54       83.08
         55 |          7        1.54       84.62
         56 |          7        1.54       86.15
         57 |          7        1.54       87.69
         58 |          7        1.54       89.23
         59 |          7        1.54       90.77
         60 |          7        1.54       92.31
         61 |          7        1.54       93.85
         62 |          1        0.22       94.07
         63 |          6        1.32       95.38
         64 |          7        1.54       96.92
         65 |          7        1.54       98.46
         66 |          7        1.54      100.00
------------+-----------------------------------
      Total |        455      100.00

*/

tab restaurantid
/*
tab restaurantid

                Restaurant |      Freq.     Percent        Cum.
---------------------------+-----------------------------------
               applebee's  |          7        1.52        1.52
                   arby's  |          7        1.52        3.04
            baskin robbins |          6        1.30        4.34
                 bob evans |          7        1.52        5.86
                 bojangles |          7        1.52        7.38
             boston market |          7        1.52        8.89
              burger king  |          7        1.52       10.41
  california pizza kitchen |          7        1.52       11.93
               captain d's |          7        1.52       13.45
                carl's jr. |          7        1.52       14.97
checker's drive-in/rallys  |          7        1.52       16.49
              chick-fil-a  |          7        1.52       18.00
                   chili's |          7        1.52       19.52
                  chipotle |          7        1.52       21.04
        church's chicken   |          7        1.52       22.56
             ci ci's pizza |          7        1.52       24.08
                  culver's |          7        1.52       25.60
               dairy queen |          7        1.52       27.11
                  del taco |          7        1.52       28.63
                  denny's  |          7        1.52       30.15
                   dominos |          7        1.52       31.67
            dunkin' donuts |          7        1.52       33.19
             einstein bros |          7        1.52       34.71
             el pollo loco |          7        1.52       36.23
                 five guys |          7        1.52       37.74
                friendly's |          7        1.52       39.26
             golden corral |          7        1.52       40.78
                  hardee's |          7        1.52       42.30
                      ihop |          7        1.52       43.82
           in-n-out burger |          7        1.52       45.34
           jack in the box |          7        1.52       46.85
               jamba juice |          7        1.52       48.37
              jason's deli |          7        1.52       49.89
              jimmy john's |          7        1.52       51.41
                       kfc |          7        1.52       52.93
                   krystal |          7        1.52       54.45
           little caesars  |          7        1.52       55.97
        long john silver's |          7        1.52       57.48
       longhorn steakhouse |          7        1.52       59.00
                mcdonald's |          7        1.52       60.52
               o'charley's |          7        1.52       62.04
              olive garden |          7        1.52       63.56
        outback steakhouse |          7        1.52       65.08
             panda express |          7        1.52       66.59
              panera bread |          7        1.52       68.11
               papa john's |          7        1.52       69.63
             papa murphy's |          7        1.52       71.15
                pf chang's |          7        1.52       72.67
                pizza hut  |          7        1.52       74.19
                   popeyes |          7        1.52       75.70
                    qdoba  |          7        1.52       77.22
                   quiznos |          7        1.52       78.74
               red lobster |          7        1.52       80.26
  romano's macaroni grill  |          7        1.52       81.78
              ruby tuesday |          7        1.52       83.30
                     sonic |          7        1.52       84.82
                 starbucks |          7        1.52       86.33
            steak 'n shake |          7        1.52       87.85
                    subway |          7        1.52       89.37
                 taco bell |          7        1.52       90.89
              tgi friday's |          7        1.52       92.41
               tim hortons |          7        1.52       93.93
                   wendy's |          7        1.52       95.44
              whataburger  |          7        1.52       96.96
              white castle |          7        1.52       98.48
                   zaxby's |          7        1.52      100.00
---------------------------+-----------------------------------
                     Total |        461      100.00


*/

merge 1:m restaurantid  year using "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.29.24.dta"
drop _merge
save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta", replace

clear

*getting other variables from the data set from Jason
use "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/nutrition_data_AHA_CSR.dta"
 keep labeling csr_page_yn menu_item_id restaurantid year resttype_cat mealcomponent
 rename menu_item_id Menu_Item_ID
save"/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/codedCSRpredictor.dta", replace


merge m:m Menu_Item_ID year using "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta"
drop if _merge==1
drop _merge

save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta", replace
*includes the coded csr data'
*obs 142,482 
*clear

use "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta"

****Coding Health related CSR id'd by qualitative coding 
generate healthcsr_cod=.

replace healthcsr_cod=1 if comm_activity_health==1|health_initiatives==1|health_philanthro==1|explicit==1

replace healthcsr_cod=0 if healthcsr_cod==.


*****Coding Health related CSR id'd by keywords....?
tab csr_page_yn

tab csr_page_yn, nolabel

generate csr_keyword=.

replace csr_keyword=1 if csr_page_yn==2
replace csr_keyword=0 if csr_page_yn==1

*drop Calories Kids_Meal Limited_Time_Offer Regional Saturated_Fat Shareable Total_Fat Sugar Dietary_Fiber
*drop if calories==. & dietary_fiber==. & saturated_fat==. & sodium==. & sugar==. & total_fat==.
* 17,832 observations deleted

generate year_scale=.
replace year_scale=0 if year==2012
replace year_scale=1 if year==2013
replace year_scale=2 if year==2014
replace year_scale=3 if year==2015
replace year_scale=4 if year==2016
replace year_scale=5 if year==2017
replace year_scale=6 if year==2018

generate csrxyear=healthcsr_cod*year_scale
generate kidsxyear=kids_meal*year_scale



****running models to test original results for sensitivity analyses

***Using CSR variable defined by coding--need to re-ran 6.6.24 because I didn't include the limited time offer previously.....
xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:

/*
. xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcompo
> nent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =    124,110
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,880.5
                                                              max =      9,368

                                                Wald chi2(15)     =   47685.33
Log likelihood = -880574.47                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
             calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -9.455528   4.265479    -2.22   0.027    -17.81571   -1.095343
           year_scale |   1.961874   .7648383     2.57   0.010     .4628184    3.460929
         _Ilabeling_2 |   1.017825    2.93503     0.35   0.729    -4.734727    6.770378
        _Iresttype__2 |   35.14941   2.668848    13.17   0.000     29.91857    40.38026
        _Iresttype__3 |   119.1163   2.895268    41.14   0.000     113.4416    124.7909
                      |
        mealcomponent |
appetizers and sides  |  -196.7283    4.55479   -43.19   0.000    -205.6556   -187.8011
           beverages  |   -281.242   2.557564  -109.96   0.000    -286.2548   -276.2293
            desserts  |  -139.3894   3.787384   -36.80   0.000    -146.8125   -131.9662
            toppings  |  -430.0593    2.30006  -186.98   0.000    -434.5673   -425.5512
                      |
         _Iregional_1 |   5.104462   4.689708     1.09   0.276    -4.087197    14.29612
        _Ishareable_1 |   882.2762   25.61649    34.44   0.000     832.0688    932.4836
        _Ikids_meal_1 |  -183.5703   3.924443   -46.78   0.000    -191.2621   -175.8785
        _Ilimited_t_1 |   63.31946   7.093779     8.93   0.000      49.4159    77.22301
             csrxyear |  -2.010467    1.05923    -1.90   0.058    -4.086519    .0655858
            kidsxyear |  -1.373361    1.09425    -1.26   0.209    -3.518051    .7713283
                _cons |   498.3224   3.401275   146.51   0.000      491.656    504.9888
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   10310.56   213.4739      9900.536    10737.57
-----------------------------+------------------------------------------------
               var(Residual) |    84931.2   1967.232      81161.71    88875.76
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 13498.96      Prob >= chibar2 = 0.0000


*/


****Using the CSR variable defined by keywords run 5.29.24, need to rerun 6.4.24 because I didn't include the limited time offer previously...

generate csrxyear_kw=csr_keyword*year_scale

xi: bootstrap, reps(1000): mixed calories csr_keyword year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear_kw kidsxyear|| restaurantid:

/*
 xi: bootstrap, reps(1000): mixed calories csr_keyword year_scale i.labeling i.resttype_cat ib4.mealcomponent
>  i.regional i.shareable i.kids_meal csrxyear_kw kidsxyear|| restaurantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =    123,793
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,875.7
                                                              max =      9,355

                                                Wald chi2(14)     =   49353.84
Log likelihood = -878484.27                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
             calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
          csr_keyword |  -4.253734   4.329398    -0.98   0.326     -12.7392     4.23173
           year_scale |   4.678847    .921052     5.08   0.000     2.873618    6.484076
         _Ilabeling_2 |    3.45162   2.976034     1.16   0.246    -2.381299     9.28454
        _Iresttype__2 |   37.86936   2.725494    13.89   0.000     32.52749    43.21123
        _Iresttype__3 |    123.093   3.091152    39.82   0.000     117.0344    129.1515
                      |
        mealcomponent |
appetizers and sides  |  -196.9249   4.340426   -45.37   0.000     -205.432   -188.4178
           beverages  |  -281.7501   2.546891  -110.63   0.000    -286.7419   -276.7583
            desserts  |  -139.1932   3.800258   -36.63   0.000    -146.6416   -131.7448
            toppings  |  -431.1377   2.251449  -191.49   0.000    -435.5505    -426.725
                      |
         _Iregional_1 |   7.139469   4.768353     1.50   0.134    -2.206331    16.48527
        _Ishareable_1 |   881.4529   26.47424    33.29   0.000     829.5643    933.3414
        _Ikids_meal_1 |  -183.6673   4.047372   -45.38   0.000       -191.6   -175.7346
          csrxyear_kw |  -5.727102   1.005491    -5.70   0.000    -7.697828   -3.756376
            kidsxyear |  -1.468216   1.082301    -1.36   0.175    -3.589486    .6530541
                _cons |   495.6671   3.421377   144.87   0.000     488.9613    502.3729
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |    10489.6   219.4649      10068.16    10928.69
-----------------------------+------------------------------------------------
               var(Residual) |   85148.43   1982.004      81351.05    89123.06
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 13991.27      Prob >= chibar2 = 0.0000

*/

***trying sensitivity analyses per Sara's email....6.3.24
****New items analyses
keep if new_==1 
* n=36,252 total items

*Calories with new items only
xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
. xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_c
> at ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kids
> xyear|| restaurantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     28,387
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =          7
                                                              avg =      430.1
                                                              max =      4,715

                                                Wald chi2(15)     =   11315.25
Log likelihood = -202408.33                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
             calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -31.58925   10.70309    -2.95   0.003    -52.56693   -10.61158
           year_scale |  -1.093473   2.268048    -0.48   0.630    -5.538766     3.35182
         _Ilabeling_2 |  -26.41226    7.42234    -3.56   0.000    -40.95977   -11.86474
        _Iresttype__2 |   54.34009   8.420056     6.45   0.000     37.83709     70.8431
        _Iresttype__3 |   134.6411   8.166942    16.49   0.000     118.6342     150.648
                      |
        mealcomponent |
appetizers and sides  |  -189.7308   13.26851   -14.30   0.000    -215.7366    -163.725
           beverages  |  -307.3267   6.072534   -50.61   0.000    -319.2286   -295.4247
            desserts  |  -148.1896   10.91124   -13.58   0.000    -169.5753    -126.804
            toppings  |  -434.2301   5.038992   -86.17   0.000    -444.1063   -424.3538
                      |
         _Iregional_1 |  -19.40395   10.52235    -1.84   0.065    -40.02737    1.219462
        _Ishareable_1 |   808.2404    44.1987    18.29   0.000     721.6126    894.8683
        _Ikids_meal_1 |   -163.351   13.04492   -12.52   0.000    -188.9186   -137.7834
        _Ilimited_t_1 |   87.94117   9.620645     9.14   0.000     69.08505    106.7973
             csrxyear |   12.51226   2.585701     4.84   0.000      7.44438    17.58014
            kidsxyear |   -9.36732   3.543405    -2.64   0.008    -16.31227   -2.422374
                _cons |   519.9441   9.689741    53.66   0.000     500.9526    538.9357
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |    18148.1   2148.701      14389.66    22888.21
-----------------------------+------------------------------------------------
               var(Residual) |   90541.99   6219.609      79136.78    103590.9
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 3673.96       Prob >= chibar2 = 0.0000


*/

*Total fat with new items only
xi: bootstrap, reps(1000): mixed total_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
 xi: bootstrap, reps(1000): mixed total_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.m
> ealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restauran
> tid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     27,972
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =          2
                                                              avg =      423.8
                                                              max =      4,715

                                                Wald chi2(15)     =   10426.08
Log likelihood = -121058.08                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
            total_fat |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -.3217264   .6410122    -0.50   0.616    -1.578087    .9346345
           year_scale |   .2127463   .1530516     1.39   0.165    -.0872294     .512722
         _Ilabeling_2 |   -2.84607   .4812306    -5.91   0.000    -3.789265   -1.902876
        _Iresttype__2 |    3.84604    .492418     7.81   0.000     2.880918    4.811161
        _Iresttype__3 |   10.19734   .4827885    21.12   0.000     9.251094    11.14359
                      |
        mealcomponent |
appetizers and sides  |  -6.282231   .8775732    -7.16   0.000    -8.002243   -4.562219
           beverages  |  -25.14862   .3582792   -70.19   0.000    -25.85083    -24.4464
            desserts  |  -10.32637   .6426724   -16.07   0.000    -11.58598   -9.066751
            toppings  |   -21.3197   .3063209   -69.60   0.000    -21.92008   -20.71932
                      |
         _Iregional_1 |  -1.495044    .591282    -2.53   0.011    -2.653935   -.3361527
        _Ishareable_1 |   34.66796   2.556947    13.56   0.000     29.65644    39.67949
        _Ikids_meal_1 |  -9.250127   .7993321   -11.57   0.000    -10.81679   -7.683465
        _Ilimited_t_1 |   5.510418   .5657662     9.74   0.000     4.401536    6.619299
             csrxyear |   .5576696   .1622115     3.44   0.001     .2397408    .8755984
            kidsxyear |  -.6438842   .2131502    -3.02   0.003    -1.061651   -.2261175
                _cons |   24.86736   .5958624    41.73   0.000     23.69949    26.03523
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   67.43232   7.837298      53.69545    84.68348
-----------------------------+------------------------------------------------
               var(Residual) |   333.1408   17.73419      300.1342    369.7772
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 3552.65       Prob >= chibar2 = 0.0000


*/

*Saturated fat with new items only
xi: bootstrap, reps(1000): mixed saturated_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
. xi: bootstrap, reps(1000): mixed saturated_fat healthcsr_cod year_scale i.labeling i.resttype_cat i
> b4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| resta
> urantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     27,353
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =          2
                                                              avg =      414.4
                                                              max =      4,354

                                                Wald chi2(15)     =    6537.66
Log likelihood = -111933.32                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
        saturated_fat |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -2.066309   .7011603    -2.95   0.003    -3.440558   -.6920602
           year_scale |  -.0337551   .1338139    -0.25   0.801    -.2960255    .2285152
         _Ilabeling_2 |  -1.470961   .7501723    -1.96   0.050    -2.941272   -.0006503
        _Iresttype__2 |   1.921292   .2866375     6.70   0.000     1.359493    2.483091
        _Iresttype__3 |   3.290301   .2729908    12.05   0.000     2.755248    3.825353
                      |
        mealcomponent |
appetizers and sides  |  -3.501063   .4491415    -7.80   0.000    -4.381365   -2.620762
           beverages  |  -6.600007   .2454798   -26.89   0.000    -7.081139   -6.118876
            desserts  |   .0631869   .3514396     0.18   0.857    -.6256221    .7519959
            toppings  |  -7.417958   .2114701   -35.08   0.000    -7.832432   -7.003484
                      |
         _Iregional_1 |  -.5547141    .234041    -2.37   0.018    -1.013426   -.0960021
        _Ishareable_1 |   10.13734    .999593    10.14   0.000     8.178172     12.0965
        _Ikids_meal_1 |  -3.459904   .3986841    -8.68   0.000     -4.24131   -2.678497
        _Ilimited_t_1 |    2.74113   .2855902     9.60   0.000     2.181383    3.300877
             csrxyear |   .5696559   .2136318     2.67   0.008     .1509452    .9883666
            kidsxyear |  -.1080656   .1003201    -1.08   0.281    -.3046894    .0885582
                _cons |   8.743423   .2422557    36.09   0.000      8.26861    9.218235
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   11.96151   3.949428      6.262362    22.84726
-----------------------------+------------------------------------------------
               var(Residual) |   208.4915   169.3206      42.44321    1024.161
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 942.27        Prob >= chibar2 = 0.0000

*/

*Sugar with new items only
xi: bootstrap, reps(1000): mixed sugar healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
  xi: bootstrap, reps(1000): mixed sugar healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealc
> omponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     26,131
Group variable: restaurantid                    Number of groups  =         65

                                                Obs per group:
                                                              min =         19
                                                              avg =      402.0
                                                              max =      4,353

                                                Wald chi2(15)     =    4510.77
Log likelihood = -125379.93                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
                sugar |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -4.796016   .9613036    -4.99   0.000    -6.680136   -2.911896
           year_scale |   .1023495   .2241176     0.46   0.648    -.3369128    .5416118
         _Ilabeling_2 |  -1.040604   .6277584    -1.66   0.097    -2.270988    .1897796
        _Iresttype__2 |   4.069766   .7505309     5.42   0.000     2.598753     5.54078
        _Iresttype__3 |  -.8007502   .7259311    -1.10   0.270    -2.223549    .6220486
                      |
        mealcomponent |
appetizers and sides  |  -10.11604   .7862373   -12.87   0.000    -11.65704   -8.575041
           beverages  |   37.51528   .6619445    56.67   0.000     36.21789    38.81266
            desserts  |   22.91154   1.066269    21.49   0.000     20.82169    25.00139
            toppings  |  -4.164752   .3383205   -12.31   0.000    -4.827848   -3.501656
                      |
         _Iregional_1 |   1.432952   .9449491     1.52   0.129     -.419114    3.285018
        _Ishareable_1 |    46.0971   4.274751    10.78   0.000     37.71874    54.47546
        _Ikids_meal_1 |  -7.047458   1.259226    -5.60   0.000    -9.515494   -4.579421
        _Ilimited_t_1 |   5.461575   .9215219     5.93   0.000     3.655425    7.267724
             csrxyear |    .785256    .253522     3.10   0.002      .288362     1.28215
            kidsxyear |  -.0395301    .345297    -0.11   0.909    -.7162997    .6372396
                _cons |   8.861569    .884771    10.02   0.000      7.12745    10.59569
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   88.65151   5.627116      78.28102    100.3959
-----------------------------+------------------------------------------------
               var(Residual) |   854.3047   29.54081      798.3242    914.2107
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 2430.98       Prob >= chibar2 = 0.0000

*/

*Fiber with new items only
xi: bootstrap, reps(1000): mixed dietary_fiber healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
xi: bootstrap, reps(1000): mixed dietary_fiber healthcsr_cod year_scale i.labeling i.resttype_cat i
> b4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| resta
> urantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     27,038
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =          2
                                                              avg =      409.7
                                                              max =      4,705

                                                Wald chi2(15)     =    6075.07
Log likelihood = -69463.818                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
        dietary_fiber |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -.2030371   .0989671    -2.05   0.040     -.397009   -.0090651
           year_scale |    .007883   .0220925     0.36   0.721    -.0354175    .0511836
         _Ilabeling_2 |   .1451134   .0664004     2.19   0.029     .0149711    .2752557
        _Iresttype__2 |   .0240158   .0924965     0.26   0.795     -.157274    .2053057
        _Iresttype__3 |   .2977129   .0891072     3.34   0.001      .123066    .4723599
                      |
        mealcomponent |
appetizers and sides  |   -.574861   .1439926    -3.99   0.000    -.8570813   -.2926408
           beverages  |  -3.238752   .0862986   -37.53   0.000    -3.407894    -3.06961
            desserts  |  -1.839078   .0721775   -25.48   0.000    -1.980544   -1.697613
            toppings  |   -2.98043   .0499027   -59.72   0.000    -3.078238   -2.882623
                      |
         _Iregional_1 |  -.2370565   .0849467    -2.79   0.005     -.403549   -.0705641
        _Ishareable_1 |   3.745183   .5644008     6.64   0.000     2.638977    4.851388
        _Ikids_meal_1 |  -.9553487   .1224592    -7.80   0.000    -1.195364    -.715333
        _Ilimited_t_1 |   .4081324   .0801433     5.09   0.000     .2510544    .5652103
             csrxyear |    .016961   .0255215     0.66   0.506    -.0330602    .0669823
            kidsxyear |  -.0376414   .0373728    -1.01   0.314    -.1108908    .0356079
                _cons |   3.679714   .1047789    35.12   0.000     3.474351    3.885077
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   .8524072   .0936263      .6873109    1.057161
-----------------------------+------------------------------------------------
               var(Residual) |   9.903438   2.807128      5.682155    17.26072
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 1336.80       Prob >= chibar2 = 0.0000

*/

****Health CSR all years analyses
use "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta"
keep healthcsr_cod restaurantid year 

duplicates report restaurantid
duplicates drop

reshape wide  healthcsr_cod, i(restaurantid)  j(year) 
generate csrallyears=.
replace csrallyears=1 if healthcsr_cod2012==1 & healthcsr_cod2013==1 & healthcsr_cod2014==1 & healthcsr_cod2015==1 & healthcsr_cod2016==1 & healthcsr_cod2017==1& healthcsr_cod2018==1
replace csrallyears=0 if csrallyears==.

generate csrnoyears=.
replace csrnoyears=1 if healthcsr_cod2012==0 & healthcsr_cod2013==0 & healthcsr_cod2014==0 & healthcsr_cod2015==0 & healthcsr_cod2016==0 & healthcsr_cod2017==0 & healthcsr_cod2018==0
replace csrnoyears=0 if csrnoyears==.

reshape long healthcsr_cod, i(restaurantid)  j(year)  

merge 1:m restaurantid  year using "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_5.31.24.dta"


save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_sensitivity_analyses.dta"

use  "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_sensitivity_analyses.dta"

keep if csrallyears==1 | csrnoyears==1
*n=77106

*getting number of restaurants
*keep restaurantid csrallyears csrnoyears
*duplicates drop

 *tab restaurantid csrallyears
/*
                      |      csrallyears
         restaurantid |         0          1 |     Total
----------------------+----------------------+----------
               arby's |         0          1 |         1 
       baskin robbins |         1          0 |         1 
          burger king |         1          0 |         1 
california pizza kitc |         1          0 |         1 
          captain d's |         1          0 |         1 
           carl's jr. |         1          0 |         1 
checker's drive-in/ra |         1          0 |         1 
    church's chicken  |         1          0 |         1 
        ci ci's pizza |         1          0 |         1 
          dairy queen |         0          1 |         1 
             del taco |         1          0 |         1 
       dunkin' donuts |         0          1 |         1 
        einstein bros |         1          0 |         1 
            five guys |         1          0 |         1 
           friendly's |         1          0 |         1 
                 ihop |         1          0 |         1 
      in-n-out burger |         1          0 |         1 
          jamba juice |         1          0 |         1 
         jason's deli |         0          1 |         1 
       little caesars |         1          0 |         1 
   long john silver's |         1          0 |         1 
  longhorn steakhouse |         0          1 |         1 
   outback steakhouse |         1          0 |         1 
        papa murphy's |         1          0 |         1 
           pf chang's |         1          0 |         1 
                qdoba |         1          0 |         1 
romano's macaroni gri |         1          0 |         1 
         ruby tuesday |         1          0 |         1 
                sonic |         1          0 |         1 
            starbucks |         0          1 |         1 
       steak 'n shake |         1          0 |         1 
          whataburger |         1          0 |         1 
              zaxby's |         1          0 |         1 
----------------------+----------------------+----------
                Total |        27          6 |        33 
*/

****Coding Health related CSR id'd by qualitative coding 
generate healthcsr_cod=.

replace healthcsr_cod=1 if comm_activity_health==1|health_initiatives==1|health_philanthro==1|explicit==1

replace healthcsr_cod=0 if healthcsr_cod==.


*****Coding Health related CSR id'd by keywords....?
tab csr_page_yn

tab csr_page_yn, nolabel

generate csr_keyword=.

replace csr_keyword=1 if csr_page_yn==2
replace csr_keyword=0 if csr_page_yn==1

*drop Calories Kids_Meal Limited_Time_Offer Regional Saturated_Fat Shareable Total_Fat Sugar Dietary_Fiber
*drop if calories==. & dietary_fiber==. & saturated_fat==. & sodium==. & sugar==. & total_fat==.
* 17,832 observations deleted

generate year_scale=.
replace year_scale=0 if year==2012
replace year_scale=1 if year==2013
replace year_scale=2 if year==2014
replace year_scale=3 if year==2015
replace year_scale=4 if year==2016
replace year_scale=5 if year==2017
replace year_scale=6 if year==2018

generate csrxyear=healthcsr_cod*year_scale
generate kidsxyear=kids_meal*year_scale


*Calories with CSR all years vs. no years only
xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
 *Calories with CSR all years vs. no years only
. xi: bootstrap, reps(1000): mixed calories healthcsr_cod year_scale i.labeling i.resttype_cat ib4.me
> alcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurant
> id:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     64,084
Group variable: restaurantid                    Number of groups  =         33

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,941.9
                                                              max =      9,368

                                                Wald chi2(15)     =   29141.68
Log likelihood = -453411.74                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
             calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |   27.42588   4.580532     5.99   0.000      18.4482    36.40355
           year_scale |   2.334065   .9871976     2.36   0.018     .3991932    4.268937
         _Ilabeling_2 |  -2.030624   4.090899    -0.50   0.620    -10.04864    5.987391
        _Iresttype__2 |   86.91444    3.78014    22.99   0.000     79.50551    94.32338
        _Iresttype__3 |    163.888   4.280582    38.29   0.000     155.4982    172.2778
                      |
        mealcomponent |
appetizers and sides  |  -239.7531   5.627281   -42.61   0.000    -250.7824   -228.7239
           beverages  |  -313.5555   3.536815   -88.65   0.000    -320.4876   -306.6235
            desserts  |  -206.8439   5.411145   -38.23   0.000    -217.4495   -196.2382
            toppings  |  -535.9971   3.456151  -155.08   0.000    -542.7711   -529.2232
                      |
         _Iregional_1 |  -43.24703   6.982944    -6.19   0.000    -56.93335   -29.56071
        _Ishareable_1 |    768.859   34.10014    22.55   0.000      702.024    835.6941
        _Ikids_meal_1 |  -185.5512   5.732494   -32.37   0.000    -196.7867   -174.3157
        _Ilimited_t_1 |   65.88474   8.400088     7.84   0.000     49.42087    82.34861
             csrxyear |  -1.434237   1.279582    -1.12   0.262    -3.942173    1.073698
            kidsxyear |  -1.852066    1.59181    -1.16   0.245    -4.971956    1.267824
                _cons |   508.9198   4.668159   109.02   0.000     499.7704    518.0692
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |     9626.7   332.4212      8996.725    10300.79
-----------------------------+------------------------------------------------
               var(Residual) |   81638.17   1634.784      78496.12       84906
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 4763.43       Prob >= chibar2 = 0.0000


*/
*Total fat with CSR all years vs. no years only
xi: bootstrap, reps(1000): mixed total_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
*Total fat with CSR all years vs. no years only
. xi: bootstrap, reps(1000): mixed total_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.m
> ealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restauran
> tid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     63,024
Group variable: restaurantid                    Number of groups  =         33

                                                Obs per group:
                                                              min =        155
                                                              avg =    1,909.8
                                                              max =      9,368

                                                Wald chi2(15)     =   25371.61
Log likelihood = -266195.37                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
            total_fat |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |    1.68572   .2644319     6.37   0.000     1.167443    2.203997
           year_scale |    .221858   .0618917     3.58   0.000     .1005525    .3431635
         _Ilabeling_2 |  -.5957431   .2402536    -2.48   0.013    -1.066631   -.1248547
        _Iresttype__2 |   4.133581    .233408    17.71   0.000     3.676109    4.591052
        _Iresttype__3 |   9.883888   .3018337    32.75   0.000     9.292305    10.47547
                      |
        mealcomponent |
appetizers and sides  |  -10.87628   .3711878   -29.30   0.000    -11.60379   -10.14876
           beverages  |  -25.10301   .2093067  -119.93   0.000    -25.51324   -24.69278
            desserts  |   -13.5917   .2959742   -45.92   0.000     -14.1718    -13.0116
            toppings  |  -27.26483    .227375  -119.91   0.000    -27.71047   -26.81918
                      |
         _Iregional_1 |  -1.689058   .3926066    -4.30   0.000    -2.458552   -.9195628
        _Ishareable_1 |   35.21275    1.99791    17.62   0.000     31.29692    39.12858
        _Ikids_meal_1 |  -9.772485   .3504219   -27.89   0.000     -10.4593    -9.08567
        _Ilimited_t_1 |   3.725535   .4954334     7.52   0.000     2.754504    4.696567
             csrxyear |  -.0999373    .071539    -1.40   0.162    -.2401511    .0402766
            kidsxyear |  -.2459596   .0980178    -2.51   0.012    -.4380709   -.0538483
                _cons |     26.283   .2866414    91.69   0.000      25.7212    26.84481
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   37.41059    1.30018      34.94714     40.0477
-----------------------------+------------------------------------------------
               var(Residual) |   272.2803    4.73121      263.1634     281.713
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 5068.39       Prob >= chibar2 = 0.0000

*/

*Saturated fat with CSR all years vs. no years only
xi: bootstrap, reps(1000): mixed saturated_fat healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
*Saturated fat with CSR all years vs. no years only
. xi: bootstrap, reps(1000): mixed saturated_fat healthcsr_cod year_scale i.labeling i.resttype_cat i
> b4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| resta
> urantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     62,146
Group variable: restaurantid                    Number of groups  =         33

                                                Obs per group:
                                                              min =        155
                                                              avg =    1,883.2
                                                              max =      8,991

                                                Wald chi2(15)     =   16853.65
Log likelihood = -219345.28                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
        saturated_fat |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |   .5725346   .1298944     4.41   0.000     .3179464    .8271229
           year_scale |   .0541725   .0286201     1.89   0.058    -.0019219    .1102669
         _Ilabeling_2 |   -.007329   .1231991    -0.06   0.953    -.2487949    .2341368
        _Iresttype__2 |    1.79246   .0907621    19.75   0.000     1.614569     1.97035
        _Iresttype__3 |   3.411688   .1232549    27.68   0.000     3.170113    3.653263
                      |
        mealcomponent |
appetizers and sides  |  -5.145384   .1348271   -38.16   0.000     -5.40964   -4.881127
           beverages  |  -6.311222   .0970195   -65.05   0.000    -6.501377   -6.121068
            desserts  |  -.9956662    .175514    -5.67   0.000    -1.339667   -.6516651
            toppings  |  -9.632046   .0895189  -107.60   0.000      -9.8075   -9.456592
                      |
         _Iregional_1 |  -1.698172   .1811031    -9.38   0.000    -2.053127   -1.343216
        _Ishareable_1 |   10.46337   1.016956    10.29   0.000     8.470171    12.45657
        _Ikids_meal_1 |  -4.024935   .1631911   -24.66   0.000    -4.344784   -3.705087
        _Ilimited_t_1 |   1.807944   .2532725     7.14   0.000     1.311539    2.304348
             csrxyear |   -.031494   .0404245    -0.78   0.436    -.1107245    .0477364
            kidsxyear |  -.0593109   .0456473    -1.30   0.194     -.148778    .0301561
                _cons |   8.743257   .1166075    74.98   0.000      8.51471    8.971804
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   7.221771   .2149858      6.812464    7.655671
-----------------------------+------------------------------------------------
               var(Residual) |   67.93443   3.042874      62.22479    74.16797
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 5083.83       Prob >= chibar2 = 0.0000

. 
*/
*Sugar with CSR all years vs. no years only
xi: bootstrap, reps(1000): mixed sugar healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
 *Sugar with CSR all years vs. no years only
. xi: bootstrap, reps(1000): mixed sugar healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealc
> omponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     59,073
Group variable: restaurantid                    Number of groups  =         33

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,790.1
                                                              max =      8,984

                                                Wald chi2(15)     =   22718.03
Log likelihood = -283205.37                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
                sugar |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -2.106352   .5558098    -3.79   0.000    -3.195719   -1.016985
           year_scale |    .106815    .105242     1.01   0.310    -.0994555    .3130854
         _Ilabeling_2 |    .311894   .4497525     0.69   0.488    -.5696046    1.193393
        _Iresttype__2 |    6.45429   .3430876    18.81   0.000     5.781851    7.126729
        _Iresttype__3 |   2.057111   .4008888     5.13   0.000     1.271383    2.842838
                      |
        mealcomponent |
appetizers and sides  |  -9.200832   .3710604   -24.80   0.000    -9.928097   -8.473567
           beverages  |   38.72852   .3429041   112.94   0.000     38.05644     39.4006
            desserts  |   21.60351   .5267815    41.01   0.000     20.57104    22.63598
            toppings  |  -9.628704   .2355169   -40.88   0.000    -10.09031   -9.167099
                      |
         _Iregional_1 |  -8.074935   .6030566   -13.39   0.000    -9.256904   -6.892965
        _Ishareable_1 |   22.25621   3.649089     6.10   0.000     15.10413    29.40829
        _Ikids_meal_1 |  -12.28916   .7243474   -16.97   0.000    -13.70885   -10.86946
        _Ilimited_t_1 |   4.772133   .8211663     5.81   0.000     3.162677     6.38159
             csrxyear |   .1826486   .1570922     1.16   0.245    -.1252465    .4905437
            kidsxyear |   .1256589   .1998538     0.63   0.530    -.2660473    .5173651
                _cons |   8.149748   .3967183    20.54   0.000     7.372194    8.927301
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   66.67943   2.555289      61.85462    71.88059
-----------------------------+------------------------------------------------
               var(Residual) |   852.2807   20.76178      812.5445    893.9601
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 5051.62       Prob >= chibar2 = 0.0000

*/
*Fiber with CSR all years vs. no years only
xi: bootstrap, reps(1000): mixed dietary_fiber healthcsr_cod year_scale i.labeling i.resttype_cat ib4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| restaurantid:
/*
 *Fiber with CSR all years vs. no years only
. xi: bootstrap, reps(1000): mixed dietary_fiber healthcsr_cod year_scale i.labeling i.resttype_cat i
> b4.mealcomponent i.regional i.shareable i.kids_meal i.limited_time_offer csrxyear kidsxyear|| resta
> urantid:
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.limited_tim~r   _Ilimited_t_0-1     (naturally coded; _Ilimited_t_0 omitted)
(running mixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     61,218
Group variable: restaurantid                    Number of groups  =         33

                                                Obs per group:
                                                              min =        155
                                                              avg =    1,855.1
                                                              max =      9,330

                                                Wald chi2(15)     =   16953.36
Log likelihood = -138917.81                     Prob > chi2       =     0.0000

---------------------------------------------------------------------------------------
                      |   Observed   Bootstrap                         Normal-based
        dietary_fiber |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
        healthcsr_cod |  -.0445005   .0413684    -1.08   0.282     -.125581    .0365801
           year_scale |  -.0020137   .0083815    -0.24   0.810     -.018441    .0144137
         _Ilabeling_2 |   .0596069   .0332339     1.79   0.073    -.0055305    .1247442
        _Iresttype__2 |   .2613777   .0401563     6.51   0.000     .1826727    .3400827
        _Iresttype__3 |   .7972149   .0459529    17.35   0.000     .7071488    .8872809
                      |
        mealcomponent |
appetizers and sides  |  -.3070905    .062836    -4.89   0.000    -.4302468   -.1839342
           beverages  |  -3.115396   .0312414   -99.72   0.000    -3.176628   -3.054164
            desserts  |  -2.039746   .0388396   -52.52   0.000     -2.11587   -1.963622
            toppings  |   -3.29417   .0337445   -97.62   0.000    -3.360308   -3.228032
                      |
         _Iregional_1 |  -.2475049   .0535802    -4.62   0.000    -.3525202   -.1424896
        _Ishareable_1 |   1.436212   .1915883     7.50   0.000     1.060705    1.811718
        _Ikids_meal_1 |  -.7319662   .0486551   -15.04   0.000    -.8273284    -.636604
        _Ilimited_t_1 |   .1359072   .0467412     2.91   0.004     .0442962    .2275182
             csrxyear |   .0043515   .0106761     0.41   0.684    -.0165733    .0252763
            kidsxyear |  -.0095816   .0155236    -0.62   0.537    -.0400073     .020844
                _cons |   3.384032   .0463573    73.00   0.000     3.293174    3.474891
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                  var(_cons) |   .8197567   .0310857       .761039    .8830048
-----------------------------+------------------------------------------------
               var(Residual) |   5.461711   .2037319      5.076651    5.875977
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 4776.44       Prob >= chibar2 = 0.0000

. 
*/


***running models on NEMS CSR score too
***getting the NEMSR scores in a datafile
use "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/NEMS_R_scoring.dta"
keep restaurantid year finalscore kidsmenu

sort restaurantid
decode restaurantid, generate (new_restaurantid)

generate drop_2012=.
replace drop_2012=1 if new_restaurantid=="7 eleven"
replace drop_2012=1 if new_restaurantid=="auntie anne's"
replace drop_2012=1 if new_restaurantid=="bj's restaurant & brewhouse"
replace drop_2012=1 if new_restaurantid=="bonefish grill"
replace drop_2012=1 if new_restaurantid=="carrabba's italian grill"
replace drop_2012=1 if new_restaurantid=="casey's general store"
replace drop_2012=1 if new_restaurantid=="chuck e. cheese"
replace drop_2012=1 if new_restaurantid=="dickey's barbeque pit"
replace drop_2012=1 if new_restaurantid=="famous dave's"
replace drop_2012=1 if new_restaurantid=="firehouse subs"
replace drop_2012=1 if new_restaurantid=="frisch's big boy" 
replace drop_2012=1 if new_restaurantid=="hooters"
replace drop_2012=1 if new_restaurantid=="jersey mike's subs"
replace drop_2012=1 if new_restaurantid=="joe's crab shack"
replace drop_2012=1 if new_restaurantid=="krispy kreme"
replace drop_2012=1 if new_restaurantid=="marco's pizza"
replace drop_2012=1 if new_restaurantid=="mcalister's deli"
replace drop_2012=1 if new_restaurantid=="moe's southwest grill"
replace drop_2012=1 if new_restaurantid=="noodles & company"
replace drop_2012=1 if new_restaurantid=="on the border"
replace drop_2012=1 if new_restaurantid=="perkins"
replace drop_2012=1 if new_restaurantid=="potbelly sandwich shop"
replace drop_2012=1 if new_restaurantid=="red robin" 
replace drop_2012=1 if new_restaurantid=="round table pizza"
replace drop_2012=1 if new_restaurantid=="sbarro"
replace drop_2012=1 if new_restaurantid=="sheetz"
replace drop_2012=1 if new_restaurantid=="the capital grille"
replace drop_2012=1 if new_restaurantid=="wawa"
replace drop_2012=1 if new_restaurantid=="wingstop"
replace drop_2012=1 if new_restaurantid=="yard house"

drop if drop_2012==1

gen new_restaurantid_2 = trim(new_restaurantid)
sort new_restaurantid_2

drop if new_restaurantid_2==""

sort new_restaurantid_2
encode new_restaurantid_2, generate (encoded_restaurantid)
 
tab encoded_restaurantid, nolabel

drop restaurantid

rename encoded_restaurantid restaurantid

drop new_restaurantid_2 new_restaurantid
drop drop_2012

save "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/NEMS_R_overall scores 6.5.24.dta", replace



****getting covariates in a datafile
use "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/AHA_CSR_data_sensitivity_analyses.dta"
generate kidsmenu=.
bysort restaurantid year: replace kidsmenu=1 if kids_meal==1

keep restaurantid year csrallyears csrnoyears resttype_cat labeling healthcsr_cod kidsmenu
duplicates drop

drop if resttype_cat==.
bysort restaurantid year: carryforward kidsmenu, gen(kidsmenu_yn)
replace kidsmenu_yn=0 if kidsmenu_yn==.

drop kidsmenu
duplicates drop

***combining data files 
merge m:m restaurantid  year using "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/NEMS_R_overall scores 6.5.24.dta"
/*
 merge m:m restaurantid  year using "/Users/meganmueller/Dropbox/Potential Assistant Prof Ideas/NEMS
> _R_overall scores 6.5.24.dta"
(note: variable year was int, now float to accommodate using data's values)

    Result                           # of obs.
    -----------------------------------------
    not matched                             0
    matched                               924  (_merge==3)
    -----------------------------------------

*/

drop if csrnoyears==0 & csrallyears==0

***noticed that some years didn't include the kidsmenu_yn=1 when they had a kids menu so addressing below
replace kidsmenu_yn=1 if kidsmenu==1

drop _merge

generate year_scale=.
replace year_scale=0 if year==2012
replace year_scale=1 if year==2013
replace year_scale=2 if year==2014
replace year_scale=3 if year==2015
replace year_scale=4 if year==2016
replace year_scale=5 if year==2017
replace year_scale=6 if year==2018

generate csrxyear=healthcsr_cod*year_scale
generate kidsxyear=kidsmenu*year_scale

generate csrxyear2=healthcsr_cod*year
generate kidsxyear2=kidsmenu*year

***doing the NEMS-R 
*mepoisson finalscore resttype_cat labeling year_scale kidsmenu_yn kidsxyear healthcsr_cod csrxyear|| restaurantid:, if kidsmenu==1
mepoisson finalscore i.resttype_cat i.labeling year_scale i.kidsmenu kidsxyear healthcsr_cod csrxyear|| restaurantid:
/*
. mepoisson finalscore i.resttype_cat i.labeling year_scale i.kidsmenu kidsxyear healthcsr_cod csrxyear|| restaurantid:

Fitting fixed-effects model:

Iteration 0:   log likelihood =  -1063.365  
Iteration 1:   log likelihood = -1017.7576  
Iteration 2:   log likelihood = -1017.7032  
Iteration 3:   log likelihood = -1017.7032  

Refining starting values:

Grid node 0:   log likelihood = -918.69705

Fitting full model:

Iteration 0:   log likelihood = -918.69705  (not concave)
Iteration 1:   log likelihood = -913.51627  (not concave)
Iteration 2:   log likelihood = -909.31934  
Iteration 3:   log likelihood = -908.80829  
Iteration 4:   log likelihood = -908.67576  
Iteration 5:   log likelihood = -908.67455  
Iteration 6:   log likelihood = -908.67455  

Mixed-effects Poisson regression                Number of obs     =        462
Group variable:    restaurantid                 Number of groups  =         33

                                                Obs per group:
                                                              min =         14
                                                              avg =       14.0
                                                              max =         14

Integration method: mvaghermite                 Integration pts.  =          7

                                                Wald chi2(8)      =     369.24
Log likelihood = -908.67455                     Prob > chi2       =     0.0000
-------------------------------------------------------------------------------
   finalscore |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
 resttype_cat |
   Fast food  |  -.3910865   .2279243    -1.72   0.086    -.8378099    .0556369
Full Service  |    .399643   .2624747     1.52   0.128    -.1147979    .9140839
              |
     labeling |
        True  |  -.0298229   .0788018    -0.38   0.705    -.1842717    .1246258
   year_scale |  -.0044195   .0184622    -0.24   0.811    -.0406048    .0317658
   1.kidsmenu |  -1.098899    .093834   -11.71   0.000     -1.28281   -.9149874
    kidsxyear |   .0489699   .0253825     1.93   0.054     -.000779    .0987188
healthcsr_cod |   .2533028   .2455313     1.03   0.302    -.2279298    .7345354
     csrxyear |   .0094453   .0278222     0.34   0.734    -.0450852    .0639757
        _cons |   1.740028   .2077898     8.37   0.000     1.332767    2.147288
--------------+----------------------------------------------------------------
restaurantid  |
    var(_cons)|   .2363804     .06862                      .1338172    .4175523
-------------------------------------------------------------------------------
LR test vs. Poisson model: chibar2(01) = 218.06       Prob >= chibar2 = 0.0000


*/

mepoisson finalscore i.resttype_cat i.labeling year i.kidsmenu kidsxyear2 healthcsr_cod csrxyear2|| restaurantid:
/*
mepoisson finalscore i.resttype_cat i.labeling year i.kidsmenu kidsxyear2 healthcsr_cod csrxyear2|| restaurantid:

Fitting fixed-effects model:

Iteration 0:   log likelihood =  -1063.365  
Iteration 1:   log likelihood = -1017.7576  
Iteration 2:   log likelihood = -1017.7032  
Iteration 3:   log likelihood = -1017.7032  

Refining starting values:

Grid node 0:   log likelihood = -918.69705

Fitting full model:

Iteration 0:   log likelihood = -918.69705  (not concave)
Iteration 1:   log likelihood = -913.51722  (not concave)
Iteration 2:   log likelihood = -909.28669  
Iteration 3:   log likelihood = -908.81603  
Iteration 4:   log likelihood =   -908.676  
Iteration 5:   log likelihood = -908.67455  
Iteration 6:   log likelihood = -908.67455  

Mixed-effects Poisson regression                Number of obs     =        462
Group variable:    restaurantid                 Number of groups  =         33

                                                Obs per group:
                                                              min =         14
                                                              avg =       14.0
                                                              max =         14

Integration method: mvaghermite                 Integration pts.  =          7

                                                Wald chi2(8)      =     369.24
Log likelihood = -908.67455                     Prob > chi2       =     0.0000
-------------------------------------------------------------------------------
   finalscore |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
 resttype_cat |
   Fast food  |  -.3910865   .2279243    -1.72   0.086    -.8378099    .0556369
Full Service  |    .399643   .2624747     1.52   0.128    -.1147979    .9140839
              |
     labeling |
        True  |  -.0298229   .0788018    -0.38   0.705    -.1842717    .1246258
         year |  -.0044195   .0184622    -0.24   0.811    -.0406048    .0317658
   1.kidsmenu |  -99.62631   51.14872    -1.95   0.051     -199.876    .6233435
   kidsxyear2 |   .0489699   .0253825     1.93   0.054     -.000779    .0987188
healthcsr_cod |  -18.75055   56.06334    -0.33   0.738    -128.6327    91.13158
    csrxyear2 |   .0094453   .0278222     0.34   0.734    -.0450852    .0639757
        _cons |   10.63204   37.18967     0.29   0.775    -62.25838    83.52246
--------------+----------------------------------------------------------------
restaurantid  |
    var(_cons)|   .2363804     .06862                      .1338172    .4175523
-------------------------------------------------------------------------------
LR test vs. Poisson model: chibar2(01) = 218.06       Prob >= chibar2 = 0.0000

. 

*/



/* FROM Models ran prior to May 28
xi: bootstrap, reps(1000): xtmixed calories_100g i.healthcsr_cod year i.labeling i.res
> ttype_cat i.mealcomponent i.regional i.shareable i.kids_meal i.csrxyear i.kidsxyear,||
>  restaurantid:
i.healthcsr_cod   _Ihealthcsr_0-1     (naturally coded; _Ihealthcsr_0 omitted)
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.mealcomponent   _Imealcompo_1-5     (naturally coded; _Imealcompo_1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.csrxyear        _Icsrxyear_0-2018   (naturally coded; _Icsrxyear_0 omitted)
i.kidsxyear       _Ikidsxyear_0-2018  (naturally coded; _Ikidsxyear_0 omitted)
(running xtmixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =     72,651
Group variable: restaurantid                    Number of groups  =         65

                                                Obs per group:
                                                              min =          6
                                                              avg =    1,117.7
                                                              max =      9,354

                                                Wald chi2(24)     =   40583.79
Log likelihood = -448375.37                     Prob > chi2       =     0.0000

----------------------------------------------------------------------------------
                 |   Observed   Bootstrap                         Normal-based
   calories_100g |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-----------------+----------------------------------------------------------------
   _Ihealthcsr_1 |  -9.310516   2.952233    -3.15   0.002    -15.09679   -3.524245
            year |   1.537901   .4498292     3.42   0.001     .6562525     2.41955
    _Ilabeling_2 |  -4.275289    2.14324    -1.99   0.046    -8.475961   -.0746167
   _Iresttype__2 |   14.71483   2.532851     5.81   0.000     9.750536    19.67913
   _Iresttype__3 |    37.0292   3.337443    11.10   0.000     30.48793    43.57047
   _Imealcompo_2 |  -185.0315   2.050506   -90.24   0.000    -189.0505   -181.0126
   _Imealcompo_3 |   47.58117   2.536014    18.76   0.000     42.61067    52.55167
   _Imealcompo_4 |  -24.04258   1.974903   -12.17   0.000    -27.91332   -20.17184
   _Imealcompo_5 |   10.99452   3.693092     2.98   0.003     3.756192    18.23285
    _Iregional_1 |  -2.688117   1.667064    -1.61   0.107    -5.955502    .5792684
   _Ishareable_1 |  -2.179051   2.650224    -0.82   0.411    -7.373394    3.015293
   _Ikids_meal_1 |  -13.57341   4.571212    -2.97   0.003    -22.53282   -4.613999
 _Icsrxyear_2012 |   5.270368   3.387133     1.56   0.120     -1.36829    11.90903
 _Icsrxyear_2013 |   1.726494   2.880876     0.60   0.549    -3.919918    7.372906
 _Icsrxyear_2014 |   .0445242   2.726914     0.02   0.987     -5.30013    5.389178
 _Icsrxyear_2015 |   2.764849   2.187043     1.26   0.206    -1.521675    7.051374
 _Icsrxyear_2016 |   .6181634   2.401639     0.26   0.797    -4.088962    5.325289
 _Icsrxyear_2017 |  -.6805094   1.794204    -0.38   0.704    -4.197084    2.836065
 _Icsrxyear_2018 |          0  (omitted)
_Ikidsxyear_2012 |   3.840749    5.58179     0.69   0.491    -7.099359    14.78086
_Ikidsxyear_2013 |  -.0377925   5.454444    -0.01   0.994    -10.72831    10.65272
_Ikidsxyear_2014 |   8.713659   5.829003     1.49   0.135    -2.710976     20.1383
_Ikidsxyear_2015 |  -7.201143    5.57346    -1.29   0.196    -18.12492    3.722637
_Ikidsxyear_2016 |  -6.950404   5.927646    -1.17   0.241    -18.56838     4.66757
_Ikidsxyear_2017 |   8.413342   5.637995     1.49   0.136    -2.636925    19.46361
_Ikidsxyear_2018 |          0  (omitted)
           _cons |   -2870.54   905.8593    -3.17   0.002    -4645.992   -1095.089
----------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                   sd(_cons) |   32.11213   1.492055      29.31696     35.1738
-----------------------------+------------------------------------------------
                sd(Residual) |   115.6974     13.042       92.7624     144.303
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 1679.34       Prob >= chibar2 = 0.0000

. 


 tab csr_page_yn

csr_page_yn |      Freq.     Percent        Cum.
------------+-----------------------------------
      False |     49,576       29.98       29.98
       True |    115,766       70.02      100.00
------------+-----------------------------------
      Total |    165,342      100.00

. 
. tab csr_page_yn, nolabel

csr_page_yn |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     49,576       29.98       29.98
          2 |    115,766       70.02      100.00
------------+-----------------------------------
      Total |    165,342      100.00

. 
. tab healthcsr_cod year

healthcsr_ |                          Year
       cod |      2012       2013       2014       2015       2016 |     Total
-----------+-------------------------------------------------------+----------
         0 |        55         50         51         46         36 |       312 
         1 |        11         16         15         20         30 |       150 
-----------+-------------------------------------------------------+----------
     Total |        66         66         66         66         66 |       462 


healthcsr_ |         Year
       cod |      2017       2018 |     Total
-----------+----------------------+----------
         0 |        38         36 |       312 
         1 |        28         30 |       150 
-----------+----------------------+----------
     Total |        66         66 |       462 
. xi: bootstrap, reps(1000): xtmixed calories i.healthcsr_cod year i.labeling i.resttype_cat 
> i.mealcomponent i.regional i.shareable i.kids_meal  i.healthcsr_cod*year i.kids_meal*year,|
> | restaurantid:
i.healthcsr_cod   _Ihealthcsr_0-1     (naturally coded; _Ihealthcsr_0 omitted)
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.mealcomponent   _Imealcompo_1-5     (naturally coded; _Imealcompo_1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
i.health~d*year   _IheaXyear_#        (coded as above)
i.kids_m~l*year   _IkidXyear_#        (coded as above)
(running xtmixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =    123,793
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,875.7
                                                              max =      9,355

                                                Wald chi2(14)     =   47165.68
Log likelihood = -878492.39                     Prob > chi2       =     0.0000

-------------------------------------------------------------------------------
              |   Observed   Bootstrap                         Normal-based
     calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
_Ihealthcsr_1 |  -1.278513   1983.219    -0.00   0.999    -3888.316    3885.759
         year |   1.241016   .7295303     1.70   0.089    -.1888368    2.670869
 _Ilabeling_2 |   1.111082   2.937087     0.38   0.705    -4.645502    6.867666
_Iresttype__2 |   34.91079   2.757313    12.66   0.000     29.50656    40.31502
_Iresttype__3 |   117.8063   3.020426    39.00   0.000     111.8863    123.7262
_Imealcompo_2 |  -84.37415   4.084983   -20.65   0.000    -92.38057   -76.36773
_Imealcompo_3 |   58.15056   5.434222    10.70   0.000     47.49968    68.80144
_Imealcompo_4 |   197.3714   4.535188    43.52   0.000     188.4826    206.2602
_Imealcompo_5 |  -233.8655   4.143546   -56.44   0.000    -241.9867   -225.7443
 _Iregional_1 |   6.810594   4.832135     1.41   0.159    -2.660217    16.28141
_Ishareable_1 |    882.335   25.82699    34.16   0.000      831.715     932.955
_Ikids_meal_1 |   2121.543   2210.491     0.96   0.337    -2210.939    6454.026
_Ihealthcsr_1 |          0  (omitted)
         year |          0  (omitted)
 _IheaXyear_1 |  -.0084725   .9842731    -0.01   0.993    -1.937612    1.920667
_Ikids_meal_1 |          0  (omitted)
 _IkidXyear_1 |  -1.146152   1.097035    -1.04   0.296    -3.296301    1.003998
        _cons |  -2192.032   1468.993    -1.49   0.136    -5071.205     687.142
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                   sd(_cons) |   101.8552   1.091586      99.73804    104.0173
-----------------------------+------------------------------------------------
                sd(Residual) |    291.822   3.410129      285.2143    298.5829
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 13853.11      Prob >= chibar2 = 0.0000


. xi: bootstrap, reps(1000): xtmixed calories i.healthcsr_cod i.year i.labeling i.resttype_cat i.mealcomponent i.
> regional i.shareable i.kids_meal,|| restaurantid:
i.healthcsr_cod   _Ihealthcsr_0-1     (naturally coded; _Ihealthcsr_0 omitted)
i.year            _Iyear_2012-2018    (naturally coded; _Iyear_2012 omitted)
i.labeling        _Ilabeling_1-2      (naturally coded; _Ilabeling_1 omitted)
i.resttype_cat    _Iresttype__1-3     (naturally coded; _Iresttype__1 omitted)
i.mealcomponent   _Imealcompo_1-5     (naturally coded; _Imealcompo_1 omitted)
i.regional        _Iregional_0-1      (naturally coded; _Iregional_0 omitted)
i.shareable       _Ishareable_0-1     (naturally coded; _Ishareable_0 omitted)
i.kids_meal       _Ikids_meal_0-1     (naturally coded; _Ikids_meal_0 omitted)
(running xtmixed on estimation sample)

Bootstrap replications (1000)
----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
..................................................    50
..................................................   100
..................................................   150
..................................................   200
..................................................   250
..................................................   300
..................................................   350
..................................................   400
..................................................   450
..................................................   500
..................................................   550
..................................................   600
..................................................   650
..................................................   700
..................................................   750
..................................................   800
..................................................   850
..................................................   900
..................................................   950
..................................................  1000

Mixed-effects ML regression                     Number of obs     =    123,793
Group variable: restaurantid                    Number of groups  =         66

                                                Obs per group:
                                                              min =        187
                                                              avg =    1,875.7
                                                              max =      9,355

                                                Wald chi2(17)     =   52444.31
Log likelihood = -878477.37                     Prob > chi2       =     0.0000

-------------------------------------------------------------------------------
              |   Observed   Bootstrap                         Normal-based
     calories |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
_Ihealthcsr_1 |  -20.38904   3.096022    -6.59   0.000    -26.45714   -14.32095
  _Iyear_2013 |   2.334171   3.206911     0.73   0.467    -3.951259    8.619602
  _Iyear_2014 |   6.275719   3.158104     1.99   0.047     .0859487    12.46549
  _Iyear_2015 |   6.696906   3.363833     1.99   0.046     .1039143     13.2899
  _Iyear_2016 |   11.63724   3.302637     3.52   0.000     5.164189    18.11029
  _Iyear_2017 |   4.699801   3.970466     1.18   0.237    -3.082169    12.48177
  _Iyear_2018 |  -8.364812   4.722642    -1.77   0.077    -17.62102    .8913958
 _Ilabeling_2 |   11.85761   3.379512     3.51   0.000     5.233886    18.48133
_Iresttype__2 |   35.28008   2.685172    13.14   0.000     30.01724    40.54292
_Iresttype__3 |   118.5388   2.954853    40.12   0.000     112.7474    124.3302
_Imealcompo_2 |  -84.36514   4.099292   -20.58   0.000    -92.39961   -76.33068
_Imealcompo_3 |   58.21899   5.226189    11.14   0.000     47.97585    68.46213
_Imealcompo_4 |   197.3037    4.40239    44.82   0.000     188.6752    205.9323
_Imealcompo_5 |  -233.9201   4.105061   -56.98   0.000    -241.9659   -225.8744
 _Iregional_1 |    7.22628   4.734833     1.53   0.127    -2.053822    16.50638
_Ishareable_1 |   881.8266   26.23125    33.62   0.000     830.4143    933.2389
_Ikids_meal_1 |  -188.2099   2.275616   -82.71   0.000      -192.67   -183.7498
        _cons |   302.6546   4.840172    62.53   0.000      293.168    312.1412
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
                             |   Observed   Bootstrap         Normal-based
  Random-effects Parameters  |   Estimate   Std. Err.     [95% Conf. Interval]
-----------------------------+------------------------------------------------
restaurantid: Identity       |
                   sd(_cons) |   101.7687   1.039804      99.75101    103.8272
-----------------------------+------------------------------------------------
                sd(Residual) |   291.7868   3.330442      285.3317    298.3879
------------------------------------------------------------------------------
LR test vs. linear model: chibar2(01) = 13832.25      Prob >= chibar2 = 0.0000

*/

/*
****getting data on CSR efforts to see if that's what is causing differences in our findings 
keep restaurantid year uses_csr csr_keyword csr_page_yn comm_activity_health explicit health_initiatives health_philanthro healthcsr_cod

duplicates report restaurantid year
duplicates drop
drop if csr_keyword==.

generate healthcsr_cod2=.
replace healthcsr_cod2=1 if comm_activity_health==1| explicit==1| health_initiatives==1 

replace healthcsr_cod2=0 if healthcsr_cod2==.

***using the previous definition ==1 if comm_activity_health==1|health_initiatives==1|health_philanthro==1|explicit==1|uses_csr==1 5.29.24
tab healthcsr_cod
/*
healthcsr_c |
         od |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        312       67.53       67.53
          1 |        150       32.47      100.00
------------+-----------------------------------
      Total |        462      100.00
*/

tab healthcsr_cod year
/*
healthcsr_ |                                     Year
       cod |      2012       2013       2014       2015       2016       2017       2018 |     Total
-----------+-----------------------------------------------------------------------------+----------
         0 |        55         50         51         46         36         38         36 |       312 
         1 |        11         16         15         20         30         28         30 |       150 
-----------+-----------------------------------------------------------------------------+----------
     Total |        66         66         66         66         66         66         66 |       462 

16.6% coded as CSR in 2012, 24.2% in 2013, 22.7% in 2014, 30.3% in 2015, 45.5% in 2016, 42.4% in 2017, 45.5% in 2018 
	 
	 */

tab csr_keyword
/*

. tab csr_keyword

csr_keyword |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        203       43.94       43.94
          1 |        259       56.06      100.00
------------+-----------------------------------
      Total |        462      100.00

*/

tab csr_keyword year
/*
csr_keywor |                                     Year
         d |      2012       2013       2014       2015       2016       2017       2018 |     Total
-----------+-----------------------------------------------------------------------------+----------
         0 |        37         35         32         29         25         22         23 |       203 
         1 |        29         31         34         37         41         44         43 |       259 
-----------+-----------------------------------------------------------------------------+----------
     Total |        66         66         66         66         66         66         66 |       462 

43.9% keyword CSR in 2012, 46.9% in 2013, 51.5% in 2014, 56.1% in 2015, 62.1% in 2017, and 65.2% in 2018
	 */

tab healthcsr_cod2
/*
. tab healthcsr_cod2

healthcsr_c |
        od2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        341       73.81       73.81
          1 |        121       26.19      100.00
------------+-----------------------------------
      Total |        462      100.00
*/
tab healthcsr_cod2 year
/*
tab healthcsr_cod2 year

healthcsr_ |                                     year
      cod2 |      2012       2013       2014       2015       2016       2017       2018 |     Total
-----------+-----------------------------------------------------------------------------+----------
         0 |        57         52         52         50         43         43         44 |       341 
         1 |         9         14         14         16         23         23         22 |       121 
-----------+-----------------------------------------------------------------------------+----------
     Total |        66         66         66         66         66         66         66 |       462 
13.6% coded as CSR in 2012, 21.2% in 2013, 21.2% in 2014, 24.2% in 2015, 34.8% in 2016, 34.8% in 2017, 33.3% in 2018 
*/
*/
