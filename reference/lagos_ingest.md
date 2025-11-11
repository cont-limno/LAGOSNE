# Ingest LAGOSNE flat files

Ingest LAGOSNE data from component flat files

## Usage

``` r
lagos_ingest(version, limno_folder = NA, geo_folder = NA, locus_folder = NA)
```

## Arguments

- version:

  character LAGOSNE database version string

- limno_folder:

  file.path to limno export folder. optional.

- geo_folder:

  file.path to geo export folder. optional.

- locus_folder:

  file.path to locus export folder. optional.

## Examples

``` r
if (FALSE) { # \dontrun{
lagos_ingest("1.087.3",
 limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
 geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
 locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT")
} # }
```
