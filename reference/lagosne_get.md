# Retrieve LAGOSNE flat files

Retrieve LAGOSNE flat files from EDI.

## Usage

``` r
lagosne_get(
  version = lagosne_version(),
  overwrite = FALSE,
  dest_folder = tempdir()
)
```

## Arguments

- version:

  character LAGOSNE database version string

- overwrite:

  logical overwrite existing data for the specified version

- dest_folder:

  file.path to save data. Default to a temporary folder. Recommended to
  set to LAGOSNE:::lagos_path() so that data persists between R
  sessions.

## Examples

``` r
if (FALSE) { # \dontrun{
# default to latest version
lagosne_get(dest_folder = LAGOSNE:::lagos_path())

# get previous version(s)
# - recommended to install corresponding package version
# - See 'Legacy Versions' section of the README for instructions
} # }
```
