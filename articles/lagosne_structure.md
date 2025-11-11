# The Structure of LAGOSNE

## LAGOSNE Overview

The Lake Multi-Scaled Geospatial and Temporal Database (LAGOSNE) is a
combination of three data modules (LAGOSlocus, LAGOSlimno, LAGOSgeo)
designed to be of use for researchers and managers to facilitate further
development of our basic understanding of lake water quality at broad
scales using water quality data on thousands of lakes collected over the
last several decades. The database includes information about lakes in a
lake-rich region of 17 states in the United States, including Minnesota,
Iowa, Wisconsin, Illinois, Missouri, Michigan, Indiana, Ohio,
Pennsylvania, New York, New Jersey, Connecticut, New Hampshire, Rhode
Island, Massachusetts, Vermont, and Maine. LAGOSNE contains a complete
census of all lakes greater than 4 hectares in the region with
supporting ecological context information. Additionally, for a subset of
lakes, LAGOSNE contains water quality data. The LAGOSNE package was
built so that future data users could easily retrieve and manipulate the
data, as well as easily access metadata.

LAGOSNE is the product of many thousands of human hours over the course
of data collection and integration. The nitty gritty details of such
efforts (which we highly recommend!) can be found in two locations. The
details describing how LAGOSNE was built, including sources and metric
derivations, can be found in (Soranno et al. 2015). The details of the
data themselves, along with the data, can be found in Soranno et
al. 2017.

## Accessing LAGOSNE

Following [these instructions](https://github.com/cont-limno/LAGOSNE),
install the LAGOSNE package and download the data from the online
repository. The data are open-access and stored online as flat files
\[location\]. The data only need to be downloaded once, and will be
stored locally at the location returned by
[`rappdirs::user_data_dir`](https://rappdirs.r-lib.org/reference/user_data_dir.html)

``` r
library(LAGOSNE)
```

Now that the data are stored locally, you can import them as a list.

``` r
# Import LAGOSNE data into R
dt <- lagosne_load()
```

## LAGOSNE Structure

As previously noted, LAGOSNE is comprised of three modules with multiple
tables within each module. When LAGOSNE is imported using the above
method, the tables are stored in a list, and you can get information
about each table in a few ways:

``` r
names(dt)
```

    ##  [1] "county"               "county.chag"          "county.conn"         
    ##  [4] "county.lulc"          "edu"                  "edu.chag"            
    ##  [7] "edu.conn"             "edu.lulc"             "hu4"                 
    ## [10] "hu4.chag"             "hu4.conn"             "hu4.lulc"            
    ## [13] "hu8"                  "hu8.chag"             "hu8.conn"            
    ## [16] "hu8.lulc"             "hu12"                 "hu12.chag"           
    ## [19] "hu12.conn"            "hu12.lulc"            "iws"                 
    ## [22] "iws.conn"             "iws.lulc"             "state"               
    ## [25] "state.chag"           "state.conn"           "state.lulc"          
    ## [28] "buffer100m"           "buffer100m.lulc"      "buffer500m"          
    ## [31] "buffer500m.conn"      "buffer500m.lulc"      "lakes.geo"           
    ## [34] "epi_nutr"             "lakes_limno"          "lagos_source_program"
    ## [37] "locus"

``` r
help.search("datasets", package = "LAGOSNE")
```

| Package | Topic                | Title                                                         |
|:--------|:---------------------|:--------------------------------------------------------------|
| LAGOSNE | chag                 | Climate, Hydrology, Atmospheric, and Geologic (CHAG) Datasets |
| LAGOSNE | classifications      | LAGOSNE Spatial Classifications Metadata                      |
| LAGOSNE | conn                 | Connectivity Datasets                                         |
| LAGOSNE | epi_nutr             | Epilimnion Water Quality Data                                 |
| LAGOSNE | lagos_source_program | LAGOSNE sources                                               |
| LAGOSNE | lagoslakes           | Lake Geospatial Metadata                                      |
| LAGOSNE | lakes_limno          | Metadata for Lakes with Water Quality                         |
| LAGOSNE | locus                | Metadata for all lakes \> 1ha                                 |
| LAGOSNE | lulc                 | Land Use Land Cover (LULC) Data Frames                        |

Below, we describe how each table fits within each module.

### LAGOSlimno [¹](#fn1)

> includes the following tables:
>
> - epi_nutr
>
> - lakes_limno
>
> - lagos_source_program

LAGOSlimno is an integration of preexisting water quality data from
disparate sources, including state, federal, tribal, and university
organizations. Water chemistry (various species of nitrogen, phosphorus,
and carbon) and transparency (Secchi disk measurement) are the main
features of the `epi_nutr` table, but also include metadata about those
measurements.
[`?epi_nutr`](https://cont-limno.github.io/LAGOSNE/reference/epi_nutr.md)
gives the names of all variables and metadata (including units).

Each observation of LAGOSlimno is a discrete sampling event, where one
or more water quality parameters were measured. Sampling events are tied
to lakes that have a unique LAGOSNE and National Hydrography Dataset
(NHD) identifier, and lakes can have single or multiple obervations of
each parameter. There are 14,657 unique lakes in `epi_nutr` distributed
across the 17-state region.

### LAGOSgeo [²](#fn2)

> includes tables whose names contain the following text strings:
>
> - chag
>
> - conn
>
> - lulc
>
> - buffer
>
> - lakes.geo

LAGOSgeo is an integration of information describing the air, water, and
land (hereafter, ecological context) surrounding all lakes greater than
or equal to 4 hectares in surface area in the LAGOSNE 17-state region.
LAGOSgeo contains three themes of data that describe the ecological
context of each lake: CHAG (climate, hydrology, atmospheric deposition,
and surficial geology), CONN (stream, wetland, and lake surficial
hydrologic connectivity), and LULC (land use/land cover). Some of these
metrics have temporal coverage (e.g., atmospheric deposition) whereas
others represent average conditions over a period of time (e.g., 30-year
climate normals). The source data and metric derivation for

Each theme of LAGOSgeo was calculated at one or more of the nine spatial
classifications (see
[`?classifications`](https://cont-limno.github.io/LAGOSNE/reference/classifications.md)).
The table names of each classification-theme combination are formatted
as \[classification\].\[theme\] (e.g., state.chag, hu4.conn, iws.lulc).
Each theme and table within LAGOSgeo is connected to a help file and can
be viewed by calling either the theme or table name (e.g.,
[`?state.chag`](https://cont-limno.github.io/LAGOSNE/reference/chag.md)
or [`?chag`](https://cont-limno.github.io/LAGOSNE/reference/chag.md)).

#### Spatial Classifications Layers

In additional to the multiple tables describing ecological context at
each spatial classification, we have provided the polygons for each
spatial classification. \[change to future location of shape files - for
now link to HU4 files that were put on Github as part of the time series
manuscript\]

``` r
library(rgdal)

# get huc4 polygons from github
load(url("https://github.com/limnoliver/CSI-Nutrient-Time-Series/blob/72c8269902e53c7ec6a2cfbe13a0239d13062dc8/Data/huc4.RData?raw=true"))
plot(huc4, lty = 1, lwd = 1, border = TRUE, col = "lightgray")
```

### LAGOSlocus [³](#fn3)

> includes the following tables:
>
> - locus

LAGOSlocus provides a connection between all tables, as it contains
metadata for the census population of lakes (all lakes greater than or
equal to one hectare; n = 2) in the LAGOSNE region, with corresponding
unique identifiers for the zone of each spatial classification in which
the lake is located. Lakes were identified through the National
Hydrography Dataset, and the table also includes data about the lake
polygons themselves, including surface area and perimeter. For a subset
of lakes where data were available, lake depth (mean and/or maximum) is
also included.

## References

Soranno, PA, EG Bissell, KS Cheruvelil, ST Christel, SM Collins, CE
Fergus, CT Filstrup, et al. 2015. “Building a Multi-Scaled Geospatial
Temporal Ecology Database from Disparate Data Sources: Fostering Open
Science and Data Reuse.” *Gigascience* 4 (1).
<https://dx.doi.org/10.1186/s13742-015-0067-4>.

Soranno, PA, and KS Cheruvelil. 2017a. “LAGOS-NE-GEO v1.05: A Module for
LAGOS-NE, a Multi-Scaled Geospatial and Temporal Database of Lake
Ecological Context and Water Quality for Thousands of U.S. Lakes:
1925–2013.”
<https://doi.org/10.6073/PASTA/16F4BDAA9607C845C0B261A580730A7A>.

———. 2017b. “LAGOS-NE-LOCUS V1.01: A Module for LAGOS-NE, a Multi-Scaled
Geospatial and Temporal Database of Lake Ecological Context and Water
Quality for Thousands of U.S. Lakes: 1925–2013.”
<https://doi.org/10.6073/PASTA/0C23A789232AB4F92107E26F70A7D8EF>.

———. 2019. “LAGOS-NE-LIMNO v1.087.3: A Module for LAGOS-NE, a
Multi-Scaled Geospatial and Temporal Database of Lake Ecological Context
and Water Quality for Thousands of U.S. Lakes: 1925–2013.”
<https://doi.org/10.6073/PASTA/08C6F9311929F4874B01BCC64EB3B2D7>.

------------------------------------------------------------------------

1.  Soranno and Cheruvelil (2019)

2.  Soranno and Cheruvelil (2017a)

3.  Soranno and Cheruvelil (2017b)
