# LAGOS Package Documentation

This document is the first draft of documentation for using LAGOS package
in R.

## Preparation

Using this code is quite easy. First, you need to set your working directory to be the main folder of package Version1.054.1 that contains the ”LA G 081054.112” file. Second, in order to use the data and methods in this code you need to call the ”LA G 081.054.].R” file using source command as follows:

```r
#Second loading Data and functions
source("R/LAGOS1.054.1.R")
```

If you running the above code in RStudio you might be able to see the added
data frames and functions in your Environment.


Figure 1: The network of data frames. There is a connection between two data
frame if and only if they have common identifiers.

## Data Structure and Preprocessing

All the csv files of LAGOS are imported to the LAGOS package and ready to use.
This package contains 38 data sets Where all saved in a single ”.RData” file. You can find the last version of the data file in the main folder of the package. By calling the ”LA G 0813” all the data sets loaded as 38 data frames Table 1. The package also contains an ifommtz'onTable data frame that contains the details of all the data sets, and two lists limno and geo, that separate yea and limno data frames.

You can get access to more detail information about each data frame by
using commands like summaryO , nameSO, headO, etc. For example to see
What are the columns of secchi data frame,

```R
names(secchi)

 [1] "eventidc10541"     "lagoslakeid"       "programname"      
 [4] "programtype"       "lagosversion"      "sampledate"       
 [7] "secchi"            "secchi_censorcode" "secchi_qual"      
[10] "secchi_methodinfo" "greatlakes"        "sampleyear"       
[13] "samplemonth"  
```

Or to see the statistical details of secchi data

```R
summary(secchi)

 eventidc10541      lagoslakeid                     programname    
 Min.   : 901626   Min.   :     1   MN_MPCA_SECCHI        :261856  
 1st Qu.:1127028   1st Qu.:  2318   MN_MPCA_CHEM_1999_2012:232995  
 Median :1352409   Median :  4387   WI_DNR_NUTRIENT       :125987  
 Mean   :1352438   Mean   : 20669   MI_CORPS_CHEM         : 85900  
 3rd Qu.:1577869   3rd Qu.:  8428   ME_DEP_CHEM           : 84332  
 Max.   :1803250   Max.   :141326   VT_DWQ_NUTRIENT       : 24295  
                                    (Other)               : 86160  
                                             programtype      lagosversion   
 State Agency/Citizen Monitoring Program           :652999   1.054.1:901525  
 State Agency/University/Citizen Monitoring Program:198270                   
 State Agency                                      : 37504                   
 Non-Profit Agency                                 :  4798                   
 LTER                                              :  4042                   
 University                                        :  2689                   
 (Other)                                           :  1223                   
      sampledate         secchi       secchi_censorcode  secchi_qual    
 2009-07-19:   838   Min.   : 0.000   GT:  8734         NO     :113755  
 2010-06-20:   753   1st Qu.: 1.680   LT:     5         2      : 43311  
 2007-07-15:   751   Median : 2.900   NC:892786         4      : 37249  
 2009-06-14:   727   Mean   : 3.224                     YES    :  3759  
 2008-07-20:   708   3rd Qu.: 4.400                     5      :  2277  
 2008-08-24:   627   Max.   :26.822                     (Other):  3336  
 (Other)   :897121                                      NA's   :697838  
           secchi_methodinfo    greatlakes   sampleyear    samplemonth    
 SECCHI_VIEW        :  3382   Min.   :0    Min.   :1937   Min.   : 1.000  
 SECCHI_VIEW_UNKNOWN: 11073   1st Qu.:0    1st Qu.:1995   1st Qu.: 6.000  
 NA's               :887070   Median :0    Median :2002   Median : 7.000  
                              Mean   :0    Mean   :2000   Mean   : 7.184  
                              3rd Qu.:0    3rd Qu.:2007   3rd Qu.: 8.000  
                              Max.   :0    Max.   :2013   Max.   :12.000
```
### Merging

In order to build your own data frame you have two options. The first option
is using the R function mergeO. For example, if you want to have a data frame
that contains the ”secchi” value and ”sampleyear” from secchz' data frame, and ”lakes4ha_buffer500m_streamdensity_streams_sum_lengthm” from lakes4ha. bu;§”er5 00m. 007m data frame. First, you have to find the column number of each value

```R
names(lakes4ha.buffer500m.conn)

 [1] "lakes4ha_buffer500m_nhdid"                                  
 [2] "lakes4ha_buffer500m_canalditchdensity_sum_lengthm"          
 [3] "lakes4ha_buffer500m_canalditchdensity_density_mperha"       
 [4] "lakes4ha_buffer500m_streamdensity_streams_sum_lengthm"      
 [5] "lakes4ha_buffer500m_streamdensity_streams_density_mperha"   
 [6] "lakes4ha_buffer500m_streamdensity_headwaters_sum_lengthm"   
 [7] "lakes4ha_buffer500m_streamdensity_headwaters_density_mperha"
 [8] "lakes4ha_buffer500m_streamdensity_midreaches_sum_lengthm"   
 [9] "lakes4ha_buffer500m_streamdensity_midreaches_density_mperha"
[10] "lakes4ha_buffer500m_streamdensity_rivers_sum_lengthm"       
[11] "lakes4ha_buffer500m_streamdensity_rivers_density_mperha"    
[12] "lagoslakeid"

names(secchi)

 [1] "eventidc10541"     "lagoslakeid"       "programname"      
 [4] "programtype"       "lagosversion"      "sampledate"       
 [7] "secchi"            "secchi_censorcode" "secchi_qual"      
[10] "secchi_methodinfo" "greatlakes"        "sampleyear"       
[13] "samplemonth" 
```
You can see ”secchi” column number is 7, ”sampleyer” is 12, and ”lakes4ha_buffer500m_streamdensity_streams_sum_lengthm” is 4. Now we can use the merge function as follows:

```R
newDataFrame <- merge(secchi[,c(7,12,2)], lakes4ha.buffer500m.conn[,c(4,12)],
by.x="lagoslakeid", by.y = "lagoslakeid")
```

In the above code, in addition to the original columns that we wanted, we also
added the column ”lagoslakeid”, column number 2 in secchi and column number 12 in lakes4ha.bu1§”er500m.conn. ”lagoslakeid” is the common column between these two data frames and merge function needs a common column to do the merging between two data frame.

```R
head(newDataFrame)
```

### Data Diagnostic, Quality Control
### Data Pro-processing

### Descriptive Stats and Visualization

## Data Analysis
