
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/cont-limno/LAGOSNE.svg?branch=master)](https://travis-ci.org/cont-limno/LAGOSNE)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOSNE)](https://cran.r-project.org/package=LAGOSNE)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/LAGOSNE)](https://cran.r-project.org/package=LAGOSNE)

# LAGOSNE <img src="man/figures/logo.png" align="right" height=140/>

The `LAGOSNE` package provides an R interface to download LAGOS-NE data,
store this data locally, and perform a variety of filtering and
subsetting operations.

LAGOS-NE contains data for 51,101 lakes and reservoirs larger than 4 ha
in 17 lake-rich US states. The database includes 3 data modules for:
lake location and physical characteristics for all lakes; ecological
context (i.e., the land use, geologic, climatic, and hydrologic setting
of lakes) for all lakes; and in situ measurements of lake water quality
for a subset of the lakes from the past 3 decades for approximately
2,600-12,000 lakes depending on the variable (see Soranno et al. 2017
[below](https://github.com/cont-limno/LAGOSNE#references)).

## Installation

``` r
# install stable version from CRAN
install.packages("LAGOSNE")

# install development version from Github
# install devtools if not found - install.packages("devtools")
# devtools::install_github("cont-limno/LAGOSNE", update_dependencies = TRUE)
```

### Data

The `lagosne_get` function downloads the LAGOSNE files corresponding to
the specified version from the [EDI data
repository](https://portal.edirepository.org/nis/home.jsp). Files are
stored in a temporary directory before being “compiled” to an `R` data
format in the location specified by the `dest_folder` argument.
Recommended setting is `lagos_path()`. Data only needs to be downloaded
one time per version per machine. Each `LAGOSNE`
[module](https://cont-limno.github.io/LAGOSNE/articles/lagosne_structure.html)
has a unique version number. However, only the limno module has been
dynamically updated. Therefore the `LAGOSNE` `R` package uses the limno
module version number to check-out specific datasets. **The latest
version of the `LAGOSNE` dataset is 1.087.3.**

``` r
library(LAGOSNE)
lagosne_get(dest_folder = lagos_path())
```

## Usage

### Load Package

``` r
library(LAGOSNE)
```

### Load data

The `lagosne_load` function returns a named list of `data.frame`
objects. Use the `names()` function to see a list of available data
frames `names(dt)`.

``` r
dt <- lagosne_load()
names(dt)
```

    #>  [1] "county"               "county.chag"          "county.conn"         
    #>  [4] "county.lulc"          "edu"                  "edu.chag"            
    #>  [7] "edu.conn"             "edu.lulc"             "hu4"                 
    #> [10] "hu4.chag"             "hu4.conn"             "hu4.lulc"            
    #> [13] "hu8"                  "hu8.chag"             "hu8.conn"            
    #> [16] "hu8.lulc"             "hu12"                 "hu12.chag"           
    #> [19] "hu12.conn"            "hu12.lulc"            "iws"                 
    #> [22] "iws.conn"             "iws.lulc"             "state"               
    #> [25] "state.chag"           "state.conn"           "state.lulc"          
    #> [28] "buffer100m"           "buffer100m.lulc"      "buffer500m"          
    #> [31] "buffer500m.conn"      "buffer500m.lulc"      "lakes.geo"           
    #> [34] "epi_nutr"             "lakes_limno"          "lagos_source_program"
    #> [37] "locus"

#### Locate tables containing a variable

``` r
query_lagos_names("secchi")
```

    #> [1] "epi_nutr"

#### Preview a table

``` r
head(dt$state)
#>   state    state_name state_zoneid state_lat state_long state_pct_in_nwi
#> 1    IA          Iowa     State_13  42.07456  -93.49983              100
#> 2    MA Massachusetts      State_2  42.25762  -71.81240              100
#>   state_ha_in_nwi state_ha
#> 1        14573561 14573561
#> 2         2101262  2101262
```

#### Preview a specific lake

``` r
lake_info(name = "Pine Lake", state = "Iowa")
# or using a lagoslakeid
# lake_info(lagoslakeid = 4389)
```

    #>   lagoslakeid     nhdid  nhd_lat  nhd_long      lagosname1 meandepth
    #> 1        4510 155845265 42.37833 -93.05967 UPPER PINE LAKE      2.21
    #>   meandepthsource maxdepth maxdepthsource legacyid gnis_name lake_area_ha
    #> 1    IA_CHEMISTRY     4.88   IA_CHEMISTRY      122 Pine Lake     36.07355
    #>   lake_perim_meters nhd_fcode nhd_ftype iws_zoneid hu4_zoneid hu6_zoneid
    #> 1          5671.001     39004       390  IWS_51040     HU4_57     HU6_78
    #>   hu8_zoneid hu12_zoneid edu_zoneid county_zoneid state_zoneid elevation_m
    #> 1    HU8_400   HU12_3008     EDU_23    County_275     State_13      300.23
    #>   state state_name state_lat state_long state_pct_in_nwi state_ha_in_nwi
    #> 1    IA       Iowa  42.07456  -93.49983              100        14573561
    #>   state_ha lakeconnection   iws_ha
    #> 1 14573561      DR_Stream 3593.379

#### Read table metadata

``` r
help.search("datasets", package = "LAGOSNE")
```

| Package | Topic           | Title                                                         |
| :------ | :-------------- | :------------------------------------------------------------ |
| LAGOSNE | chag            | Climate, Hydrology, Atmospheric, and Geologic (CHAG) Datasets |
| LAGOSNE | classifications | LAGOSNE Spatial Classifications Metadata                      |
| LAGOSNE | conn            | Connectivity Datasets                                         |
| LAGOSNE | epi\_nutr       | Epilimnion Water Quality Data                                 |
| LAGOSNE | lagoslakes      | Lake Geospatial Metadata                                      |
| LAGOSNE | lakes\_limno    | Metadata for Lakes with Water Quality                         |
| LAGOSNE | lg\_extent      | LAGOSNE extent                                                |
| LAGOSNE | lg\_subset      | LAGOSNE subset                                                |
| LAGOSNE | locus           | Metadata for all lakes \> 1ha                                 |
| LAGOSNE | lulc            | Land Use Land Cover (LULC) Data Frames                        |
| LAGOSNE | source          | LAGOSNE sources                                               |

### Select data

`lagosne_select` is a convenience function whose primary purpose is to
provide users with the ability to select subsets of LAGOS tables that
correspond to specific keywords (see `LAGOSNE:::keyword_partial_key()`
and `LAGOSNE:::keyword_full_key()`). See
[here](http://adv-r.had.co.nz/Subsetting.html) for a comprehensive
tutorial on generic `data.frame` subsetting.

``` r
# specific variables
head(lagosne_select(table = "epi_nutr", vars = c("tp", "tn"), dt = dt))
#>       tp     tn
#> 1  29.00     NA
#> 2 136.56 3521.7
head(lagosne_select(table = "iws.lulc", vars = c("iws_nlcd2011_pct_95"), dt = dt))
#>   iws_nlcd2011_pct_95
#> 1                0.04

# categories
head(lagosne_select(table = "locus", categories = "id", dt = dt))
#>   lagoslakeid iws_zoneid hu4_zoneid hu6_zoneid hu8_zoneid hu12_zoneid
#> 1        3201       <NA>     HU4_11     HU6_12     HU8_47  HU12_16312
#> 2        4510  IWS_51040     HU4_57     HU6_78    HU8_400   HU12_3008
#>   edu_zoneid county_zoneid state_zoneid
#> 1     EDU_27    County_331      State_2
#> 2     EDU_23    County_275     State_13
head(lagosne_select(table = "epi_nutr", categories = "waterquality", dt = dt))
#>    chla colora colort dkn doc nh4 no2 no2no3 srp tdn tdp tkn     tn toc
#> 1 16.60     60     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA     NA  NA
#> 2 30.64     NA     NA  NA  NA  NA  NA 1619.6  NA  NA  NA  NA 3521.7  NA
#>   ton     tp secchi
#> 1  NA  29.00   1.70
#> 2  NA 136.56   0.65
head(lagosne_select(table = "hu4.chag", categories = "deposition", dt = dt)[,1:4])
#>   hu4_dep_no3_1985_min hu4_dep_no3_1985_max hu4_dep_no3_1985_mean
#> 1               7.2171              10.0448                7.9366
#> 2               9.5538              21.1791               15.5290
#>   hu4_dep_no3_1985_std
#> 1               0.3868
#> 2               2.2330

# mix of specific variables and categories
head(lagosne_select(table = "epi_nutr", vars = "programname", 
                    categories = c("id", "waterquality"), dt = dt))
#>   programname lagoslakeid  chla colora colort dkn doc nh4 no2 no2no3 srp
#> 1      MA_DEP        3201 16.60     60     NA  NA  NA  NA  NA     NA  NA
#> 2     IA_CHEM        4510 30.64     NA     NA  NA  NA  NA  NA 1619.6  NA
#>   tdn tdp tkn     tn toc ton     tp secchi eventida10873
#> 1  NA  NA  NA     NA  NA  NA  29.00   1.70         45773
#> 2  NA  NA  NA 3521.7  NA  NA 136.56   0.65         64904
```

## Published LAGOSNE subsets

``` r
# Oliver et al. 2015
lagos_get_oliver_2015()
head(lagos_load_oliver_2015())
```

## Legacy Versions

### R Package

To install versions of `LAGOSNE` compatible with older versions of
LAGOS-NE run the following command where `ref` is set to the desired
version (in the example, it is version 1.054.1):

``` r
# install devtools if not found
# install.packages("devtools")
devtools::install_github("cont-limno/LAGOSNE", ref = "v1.054.1")
```

### Data

Until older datasets have been made available in a public repository,
LAGOSNE users will need to use the `lagosne_compile` function (not
`lagosne_get`) and supply the path to their local `locus`, `limno` and
`geo` data folders. Replace the paths in the example below with the path
to each respective folder on your system. Most people will have access
to these folders through Dropbox. For example, the `limno_folder` would
be assigned to something like:
`C:/Users/FWL/Dropbox/CSI_LAGOS-exports/LAGOS-NE-LIMNO-EXPORT`

``` r
library(LAGOSNE)
lagosne_compile("1.054.1",
  limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
  geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
  locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT")
```

## References

Oliver, SK, PA Soranno, CE Fergus, T Wagner, K Webster, CE Scott, LA
Winslow, J Downing, and EH Stanley. 2015. “LAGOS - Predicted and
Observed Maximum Depth Values for Lakes in a 17-State Region of the
U.S.”
<https://dx.doi.org/10.6073/pasta/edc06bbae6db80e801b6e52253f2ea09>.

Soranno, P.A., Bacon, L.C., Beauchene, M., Bednar, K.E., Bissell, E.G.,
Boudreau, C.K., Boyer, M.G., Bremigan, M.T., Carpenter, S.R., Carr, J.W.
Cheruvelil, K.S., and … , 2017. LAGOS-NE: A multi-scaled geospatial and
temporal database of lake ecological context and water quality for
thousands of US lakes. GigaScience,
<https://doi.org/10.1093/gigascience/gix101>

Soranno, PA, EG Bissell, KS Cheruvelil, ST Christel, SM Collins, CE
Fergus, CT Filstrup, et al. 2015. “Building a Multi-Scaled Geospatial
Temporal Ecology Database from Disparate Data Sources: Fostering Open
Science and Data Reuse.” Gigascience 4 (1).
<https://dx.doi.org/10.1186/s13742-015-0067-4>.

Stachelek, J, and SK Oliver. 2017. LAGOSNE: Interface to the Lake
Multi-Scaled Geospatial and Temporal Database.
<https://github.com/cont-limno/LAGOSNE>.

Soranno P, Cheruvelil K. 2017. LAGOS-NE-LOCUS v1.01: a module for
LAGOS-NE, a multi-scaled geospatial and temporal database of lake
ecological context and water quality for thousands of U.S. Lakes:
1925–2013. Environmental Data Initiative. <http://doi.org/ckpj>

Soranno P, Cheruvelil K. 2017. LAGOS-NE-LIMNO v1.087.1: a module for
LAGOS-NE, a multi-scaled geospatial and temporal database of lake
ecological context and water quality for thousands of U.S. Lakes:
1925–2013. Environmental Data Initiative. <http://doi.org/ckpk>.

Soranno P, Cheruvelil K. 2017. LAGOS-NE-GEO v1.05: a module for
LAGOS-NE, a multi-scaled geospatial and temporal database of lake
ecological context and water quality for thousands of U.S. Lakes:
1925–2013. Environmental Data Initiative. <http://doi.org/ckpm>
