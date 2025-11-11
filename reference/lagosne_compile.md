# Compile LAGOSNE data

Compile LAGOSNE data from component flat files. This function should
rarely be called directly outside of manual updating of source data.

## Usage

``` r
lagosne_compile(
  version,
  limno_folder = NA,
  geo_folder = NA,
  locus_folder = NA,
  dest_folder = NA
)
```

## Arguments

- version:

  character LAGOSNE database version string

- limno_folder:

  file.path to limno export folder

- geo_folder:

  file.path to geo export folder

- locus_folder:

  file.path to locus export folder

- dest_folder:

  file.path optional will default to the location returned by
  [`user_data_dir`](https://rappdirs.r-lib.org/reference/user_data_dir.html)

## Examples

``` r
if (FALSE) { # \dontrun{
lagosne_compile("1.087.3",
 limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
 geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
 locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT",
 dest_folder = lagos_path())
} # }
```
