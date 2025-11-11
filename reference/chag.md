# Climate, Hydrology, Atmospheric, and Geologic (CHAG) Datasets

Datasets containing information on climate, hydrology, atmospheric
deposition, and surficial geology characteristics calculated at hu12,
hu8, hu4, edu, county and state spatial classifications (see ?scales).

## Format

Data frames with all or a subset of the following variables. Number of
observations is equal to the number of zones in each spatial scale (see
Details below). Wildcard options include a subset of the LAGOSNE spatial
scales (\* = hu12, hu8, hu4, edu, county, state), years of measurement
(\*\* = 1985, 1990, 1995, 2000, 2005, 2010), and summary statistic or
units (\*\*\* = min, max, mean, std for atmospheric deposition and
hydrology; \*\*\* = ha, pct for surficial geology)

- \*\_zoneid: unique zone identifier

- \*\_dep_no3\_\*\*\_\*\*\*: nitrate ion wet deposition (kg/ha) in zone
  during specified year

- \*\_dep_so4\_\*\*\_\*\*\*: sulfate ion wet deposition (kg/ha) in zone
  during specified year

- \*\_dep_totaln\_\*\*\_\*\*\*: total inorganic nitrogen ion wet
  deposition (kg/ha) in zone during specified year

- \*\_baseflowindex\_\*\*\*: ground-water discharge into streams in the
  zone (baseflow/totalflow \*100)

- \*\_groundwaterrecharge\_\*\*\*: mean annual natural groundwater
  recharge (mm/yr) in zone - Baseflow multiplied by mean annual runoff

- \*\_runoff\_\*\*\*: average annual runoff (in/yr) in the zone, 1951-80

- \*\_prism_ppt_30yr_normal_800mm2_annual\_\*\*\*: 30-yr long-term
  (normal) annual mean precipitation (mm/yr) for zone

- \*\_prism_tmax_30yr_normal_800mm2_annual\_\*\*\*: 30-yr long-term
  (normal) annual maximum temperature (deg C) for zone

- \*\_prism_tmean_30yr_normal_800mm2_annual\_\*\*\*: 30-yr long-term
  (normal) annual mean temperature (deg C) for zone

- \*\_prism_tmin_30yr_normal_800mm2_annual\_\*\*\*: 30-yr long-term
  (normal) annual minimum temperature (deg C) for zone

- \*\_surficialgeology_alluv\_\*\*\*: alluvial of all ages

- \*\_surficialgeology_beach\_\*\*\*: beach deposits of Holocene age

- \*\_surficialgeology_colluv\_\*\*\*: colluvium of all ages

- \*\_surficialgeology_dec_resid\_\*\*\*: decomposition residuum of all
  ages

- \*\_surficialgeology_eolian\_\*\*\*: silt (loess), sand of all ages

- \*\_surficialgeology_gf_out\_\*\*\*: glaciofluvial (outwash) deposits
  of all ages

- \*\_surficialgeology_grus\_\*\*\*: glaciated, granitic grus of
  Quaternary and Tertiary age

- \*\_surficialgeology_ice\_\*\*\*: ice-contact depositives of lake
  Wisconsin and Holocene age

- \*\_surficialgeology_lac\_\*\*\*: combination of: Glacial-lake clay
  and silt lake deposits of pre-Illinoian and Illinoin age; Glacial and
  postglacial lake deposits (delta, clay, silt and sand, sand and
  gravel, density-current underflow-fan) of Holocene and late Wisconsin
  age; Beach sand and dune sand deposits of Holocene age; and Lake
  slack-water and alluvium deposits of pre-Illinoian, Illinoian, and
  late Wisconsin ages

- \*\_surficialgeology_lac_clay\_\*\*\*: glacial and postglacial lake
  deposits (clay and silt) of Holocene and late Wisconsin age

- \*\_surficialgeology_marine\_\*\*\*: coastal-plain marine deposits of
  Pleistocene and Pliocene ages, and glaciomarine deposits of late
  Wisconsin age

- \*\_surficialgeology_open_water\_\*\*\*: open water

- \*\_surficialgeology_other\_\*\*\*: surficial deposits, surficial
  materials, and bedrock masses that were deformed and (or) transported
  intact by glacial ice

- \*\_surficialgeology_peat_mrsh\_\*\*\*: coastal or inland deposits of
  freshwater, brackish-water, peat and muck or freshwater swamps of
  Holocene and late Wisconsin age

- \*\_surficialgeology_saprol\_\*\*\*: saprolite of quaternary and
  tertiary age on crystalline igneous and metamorphic rocks mostly

- \*\_surficialgeology_solif\_\*\*\*: solifluction deposits of Holocene
  and late to middle Pleistocene age, and lake Wisconsin age

- \*\_surficialgeology_solut\_\*\*\*: solution residuum of Quaternary
  and tertiary age

- \*\_surficialgeology_till_clay\_\*\*\*: till, clay of pre-Illinoian
  age, late Wisconsin and Holocene(?) age

- \*\_surficialgeology_till_loam\_\*\*\*: till, loam of pre-Illinoian,
  Illinoian, and late Wisconsin and Holocene(?) age

- \*\_surficialgeology_till_oth\_\*\*\*: till, complex depositions of
  lake Wisconsin and Illinoian age

- \*\_surficialgeology_till_sand\_\*\*\*: till, sand of pre-Illinoian
  age, late Wisconsin and Holocene(?) age

## Details

Original data sources and layers from which each metric was derived can
be found in additional file 5 of Soranno et al. (2015). Briefly, climate
data came from the PRISM climate group, hydrology metrics were derived
from United States Geologic Survey (USGS) data, atmospheric deposition
was from the National Atmospheric Deposition program, and surficial
geology were derived from layers USGS data.

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)
