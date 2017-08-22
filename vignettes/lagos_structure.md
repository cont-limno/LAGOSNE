<%@meta language="R-vignette" content="-------------------------------- 
DIRECTIVES FOR R: 

  %VignetteIndexEntry{The Structure of LAGOS} 
  %VignetteAuthor{Samantha Oliver} 
  %VignetteEngine{R.rsp::rsp} 
--------------------------------------------------------------------"%>
LAGOS Overview
--------------

The Lake Multi-Scaled Geospatial and Temporal Database (LAGOS) is a
combination of three data modules (LAGOSlocus, LAGOSlimno, LAGOSgeo)
designed to be of use for researchers and managers to \[insert line from
paper\]. The database includes information about lakes in a lake-rich
region of 17 states in the United States, including Minnesota, Iowa,
Wisconsin, Illinois, Missouri, Michigan, Indiana, Ohio, Pennsylvania,
New York, New Jersey, Connecticut, New Hampshire, Rhode Island,
Massachusetts, Vermont, and Maine. LAGOS contains a complete census of
all lakes greater than 4 hectares in the region with supporting
ecological context information. Additionally, for a subset of lakes,
LAGOS contains water quality data. The LAGOS package was built so that
future data users could easily retrieve and manipulate the data, as well
as easily access metadata.

LAGOS is the product of many thousands of human hours over the course of
data collection and integration. The nitty gritty details of such
efforts (which we highly recommend!) can be found in two locations. The
details describing how LAGOS was built, including sources and metric
derivations, can be found in Soranno et al. 2015. The details of the
data themselves, along with the data, can be found in Soranno et al.
2017.

Accessing LAGOS
---------------

Following [these instructions](https://github.com/cont-limno/LAGOS),
install the LAGOS package and download the data from the online
repository. The data are open-access and stored online as flat files
\[location\]. The data only need to be downloaded once, and will be
stored locally at the location returned by `rappdirs::user_data_dir`

Now that the data are stored locally, you can import them as a list.

    # Import LAGOS data into R
    dt <- lagos_load(version = "1.087.1", format = "rds")

LAGOS Structure
---------------

As previously noted, LAGOS is comprised of three modules with multiple
tables within each module. When LAGOS is imported using the above
method, the tables are stored in a list, and you can get information
about each table in a few ways:

    names(dt)

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
    ## [34] "epi_nutr"             "lakes_limno"          "secchi"              
    ## [37] "lagos_source_program" "locus"

    help.search("datasets", package = "LAGOS")

<table>
<thead>
<tr class="header">
<th align="left">Package</th>
<th align="left">Topic</th>
<th align="left">Title</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">LAGOS</td>
<td align="left">chag</td>
<td align="left">CHAG Datasets</td>
</tr>
<tr class="even">
<td align="left">LAGOS</td>
<td align="left">classifications</td>
<td align="left">LAGOS Spatial Classifications Metadata</td>
</tr>
<tr class="odd">
<td align="left">LAGOS</td>
<td align="left">conn</td>
<td align="left">Connectivity Datasets</td>
</tr>
<tr class="even">
<td align="left">LAGOS</td>
<td align="left">epi.nutr</td>
<td align="left">Epilimnion Water Quality Data</td>
</tr>
<tr class="odd">
<td align="left">LAGOS</td>
<td align="left">lagoslakes</td>
<td align="left">Lake Geospatial Metadata</td>
</tr>
<tr class="even">
<td align="left">LAGOS</td>
<td align="left">lakes_limno</td>
<td align="left">Metadata for Lakes with Water Quality</td>
</tr>
<tr class="odd">
<td align="left">LAGOS</td>
<td align="left">locus</td>
<td align="left">Metadata for all lakes &gt; 1ha</td>
</tr>
<tr class="even">
<td align="left">LAGOS</td>
<td align="left">lulc</td>
<td align="left">Land Use Land Cover (LULC) Data Frames</td>
</tr>
<tr class="odd">
<td align="left">LAGOS</td>
<td align="left">secchi</td>
<td align="left">Secchi (Water Clarity) Data</td>
</tr>
<tr class="even">
<td align="left">LAGOS</td>
<td align="left">source</td>
<td align="left">LAGOS sources</td>
</tr>
</tbody>
</table>

Below, we describe how each table fits within each module.

### LAGOSlimno

LAGOSlimno is an integration of preexisting water quality data from
disparate sources, including state, federal, tribal, and university
organizations. Water chemistry (various species of nitrogen, phosphorus,
and carbon) and transparency (Secchi disk measurement) are the main
features of the `epi.nutr` table, but also include metadata about those
measurements. `?epi.nutr` gives the names of all variables and metadata
(including units). Because many unique sampling events only included
Secchi depth, a separate table of all Secchi measurements is included
(see `?secchi`). `epi.nutr` does contain Secchi observations that are in
`secchi`, but only if additional water quality measurements were taken
during the same sampling event.

Each observation of LAGOSlimno is a discrete sampling event, where one
or more water quality parameters were measured. Sampling events are tied
to lakes that have a unique LAGOS and National Hydrography Dataset (NHD)
identifier, and lakes can have single or multiple obervations of each
parameter. There are 12,934 and 12,712 unique lakes in `epi.nutr` and
`secchi`, respectively, distributed across the 17-state region.

### LAGOSgeo

LAGOSgeo is an integration of information describing the air, water, and
land (hereafter, ecological context) surrounding all lakes greater than
or equal to 4 hectares in surface area in the LAGOS 17-state region.
LAGOSgeo contains three themes of data that describe the ecological
context of each lake: CHAG (climate, hyrology, atmospheric deposition,
and surficial geology), CONN (stream, wetland, and lake surficial
hydrologic connectivity), and LULC (land use/land cover). Some of these
metrics have temporal coverage (e.g., atmospheric deposition) whereas
others represent average conditions over a period of time (e.g., 30-year
climate normals). The source data and metric derivation for

Each theme of LAGOSgeo was calculated at one or more of the nine spatial
classifications (see `?classifications`). The table names of each
classification-theme combination are formatted as
\[classification\].\[theme\] (e.g., state.chag, hu4.conn, iws.lulc).
Each theme and table within LAGOSgeo is connected to a help file and can
be viewed by calling either the theme or table name (e.g., `?state.chag`
or `?chag`).

#### Spatial Classifications Layers

In additional to the multiple tables describing ecological context at
each spatial classification, we have provided the polygons for each
spatial classification. \[change to future location of shape files - for
now link to HU4 files that were put on Github as part of the time series
manuscript\]

    library(rgdal)

    # get huc4 polygons from github
    load(url("https://github.com/limnoliver/CSI-Nutrient-Time-Series/blob/72c8269902e53c7ec6a2cfbe13a0239d13062dc8/Data/huc4.RData?raw=true"))
    plot(huc4, lty = 1, lwd=1, border=TRUE, col = "lightgray")

### LAGOSlocus

LAGOSlocus provides a connection between all tables, as it contains
metadata for the census population of lakes (all lakes greater than or
equal to one hectare; n = ) in the LAGOS region, with corresponding
unique identifiers for the zone of each spatial classification in which
the lake is located. Lakes were identified through the National
Hydrography Dataset, and the table also includes data about the lake
polygons themselves, including surface area and perimeter. For a subset
of lakes where data were available, lake depth (mean and/or maximum) is
also included.
