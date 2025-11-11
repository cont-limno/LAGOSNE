# Epilimnion Water Quality Data

A dataset containing physical and chemical observations in the
epilimnion (surface waters). Each row is a sampling event, and lakes can
have multiple sampling events.

## Format

A data frame with observations of 93 variables:

- eventida1087: unique combination of programid, lakeid, and date for
  each sampling event in LAGOSNE

- lagoslakeid: unique integer identifier for each lake in LAGOSNE

- programname: name of the sampling/monitoring program that collected
  the data

- programtype: categorical description of the type of
  sampling/monitoring effort (Federal Agency, LTER = Long Term
  Ecological Research program, National Survey Program, Non-Profit
  Agency, State Agency, State Agency/Citizen Monitoring Program, State
  Agency/University/Citizen Monitoring Program, State Agency/Citizen
  Monitoring Program, Tribal Agency, University)

- lagosversion: current version of LAGOSNE that the data record belongs
  to

- sampledate: date at which the sample was collected, stored in date
  format (YYYY-MM-DD)

- chla: chlorophyll a (µg/l)

- colora: color, apparent (PCU)

- colort: color, true (PCU)

- dkn: nitrogen, dissolved Kjeldahl (µg/l as N)

- doc: carbon, dissolved organic (µg/l as C)

- nh4: nitrogen, ammonium NH4 (µg/l as N)

- no2: nitrogen, nitrite NO2 (µg/l as N)

- no2no3: nitrogen, nitrite NO2 + nitrate NO3 nitrogen (µg/l as N)

- srp: phosphorus, soluble reactive (µg/l as P)

- tdn: nitrogen, total dissolved (µg/l as N)

- tdp: phosphorus, total dissolved (µg/l as P)

- tkn: nitrogen, total Kjeldahl (µg/l as N)

- tn: nitrogen, total (µg/l as N)

- toc: carbon, total organic (µg/l as C)

- ton: nitrogen, total organic (µg/l as N)

- tp: phosphorus, total (µg/l as P)

- secchi: Secchi disk transparency (m).

- \*\_qual: data flags (qualifiers) from the source program for each
  water quality parameter (\* = all water quality parameters listed
  above). For example, "chla_qual" is the variable name for the data
  flag for chlorophyll a observations.

- \*\_censorcode: identifies whether a data value is censored and the
  censor type for each water quality parameter (\* = all water quality
  parameters listed above). For example, "chla_censorcode" is the
  variable name for censor information regarding chlorophyll a
  observations.

  - NC1: has detection limit and data value is above detection limit and
    has no qualifier or comments

  - NC2: has detection limit and data value is above detection limit,
    and has qualifier or comments

  - NC3: has no detection limit and has qualifier or comments

  - NC4: has no detection limit and has no qualifiers or comments

  - LE1: has detection limit, data value is less than or equal to
    detection limit, has qualifier or comments

  - LE2: has detection limit, data value is less than or equal to
    detection limit, has no qualifier or comments

  - LE3: has no detection limit, \< than comes from source program, has
    qualifier or comments

  - LE4: has no detection limit, \< than comes from source program, has
    no qualifier or comments

- \*\_detectionlimit: the detection limit used by the source program for
  each water quality parameter (\* = all water quality parameters listed
  above). For example, "chla_detectionlimit" is the name of the variable
  that reports detection limits for chlorophyll a observations.

- \*\_labmethodname: analytical procedure, from a standards body if
  available for each water quality parameter (\* = all water quality
  parameters listed above). For example, "chla_labmethodname" is the
  variable name for lab methods associated with each chlorophyll a
  observation.

- chla_methodinfo: flag to indicate variable was sampled using different
  methods. "CHLA_UNFILTERED" means that a sample was

- secchi_methodinfo: flag to indicate variable was sampled using
  different methods. "SECCHI_VIEW" means that Secchi depth was measured
  using a viewer box, whereas "SECCHI_VIEW_UNKNOWN" reports observations
  where it is unclear if a Secchi viewer box was used. A secchi
  observation without a methodinfo code means the Secchi depth was made
  without the viewer box.

- sampleyear: year (4-digit) in which sample was collected

- samplemonth: month in which sample was collected

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)
