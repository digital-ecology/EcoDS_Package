
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ecods

<!-- badges: start -->
<!-- badges: end -->

## Overview

ecods aims to streamline the preparation of ecological desk studies for
projects in England. It does this by scraping information from Natural
England’s [geodata
portal](https://naturalengland-defra.opendata.arcgis.com/). For a site
of interest the package returns data on designated sites, ancient
woodland and priority habitats. It also returns the Local Planning
Authority and National Character Area in which the site is located.

The designated sites currently queried are:

- SPA
- SAC
- Ramsar
- SSSI
- NNR
- AONB (now called National Landscapes)
- National Parks
- LNRs

## Installation

The package can be installed from Digital Ecology’s Codeberg repository:

``` r
remotes::install_git("https://codeberg.org/Digital-Ecology/EcoDS_Package.git")
#> Downloading git repo https://codeberg.org/Digital-Ecology/EcoDS_Package.git
#> Rcpp        (1.0.13 -> 1.0.14) [CRAN]
#> wk          (0.9.2  -> 0.9.4 ) [CRAN]
#> e1071       (1.7-14 -> 1.7-16) [CRAN]
#> rlang       (1.1.4  -> 1.1.5 ) [CRAN]
#> glue        (1.7.0  -> 1.8.0 ) [CRAN]
#> withr       (3.0.1  -> 3.0.2 ) [CRAN]
#> pillar      (1.9.0  -> 1.10.1) [CRAN]
#> fs          (1.6.4  -> 1.6.5 ) [CRAN]
#> tinytex     (0.52   -> 0.54  ) [CRAN]
#> fontawesome (0.5.2  -> 0.5.3 ) [CRAN]
#> bslib       (0.8.0  -> 0.9.0 ) [CRAN]
#> xfun        (0.46   -> 0.50  ) [CRAN]
#> evaluate    (0.24.0 -> 1.0.3 ) [CRAN]
#> later       (1.3.2  -> 1.4.1 ) [CRAN]
#> rmarkdown   (2.27   -> 2.29  ) [CRAN]
#> knitr       (1.48   -> 1.49  ) [CRAN]
#> digest      (0.6.36 -> 0.6.37) [CRAN]
#> promises    (1.3.0  -> 1.3.2 ) [CRAN]
#> jsonlite    (1.8.8  -> 1.8.9 ) [CRAN]
#> terra       (1.7-83 -> 1.8-15) [CRAN]
#> sp          (2.1-4  -> 2.2-0 ) [CRAN]
#> cpp11       (0.4.7  -> 0.5.1 ) [CRAN]
#> gtable      (0.3.5  -> 0.3.6 ) [CRAN]
#> sys         (3.4.2  -> 3.4.3 ) [CRAN]
#> askpass     (1.2.0  -> 1.2.1 ) [CRAN]
#> openssl     (2.2.0  -> 2.3.2 ) [CRAN]
#> curl        (5.2.1  -> 6.2.0 ) [CRAN]
#> classInt    (0.4-10 -> 0.4-11) [CRAN]
#> raster      (3.6-26 -> 3.6-31) [CRAN]
#> Installing 29 packages: Rcpp, wk, e1071, rlang, glue, withr, pillar, fs, tinytex, fontawesome, bslib, xfun, evaluate, later, rmarkdown, knitr, digest, promises, jsonlite, terra, sp, cpp11, gtable, sys, askpass, openssl, curl, classInt, raster
#> Installing packages into '/home/danc/R/x86_64-pc-linux-gnu-library/4.4'
#> (as 'lib' is unspecified)
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>      checking for file ‘/tmp/RtmpYDSI31/file2e2d55459e5c/DESCRIPTION’ ...  ✔  checking for file ‘/tmp/RtmpYDSI31/file2e2d55459e5c/DESCRIPTION’ (509ms)
#>   ─  preparing ‘ecods’:
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts (587ms)
#>   ─  checking for empty or unneeded directories
#> ─  building ‘ecods_0.0.0.9000.tar.gz’
#>      
#> 
#> Installing package into '/home/danc/R/x86_64-pc-linux-gnu-library/4.4'
#> (as 'lib' is unspecified)
```

## Usage

The main function in the package is the `ecods()` function. This creates
buffers around an input site, and returns an sf object with the sites
that intersect those buffers. The package has an example site to
demonstrate the function.

``` r
library(ecods)

site <- sample_site_boundary

ecods(site)
#> Warning in CPL_crs_from_input(x): GDAL Message 1: +init=epsg:XXXX syntax is
#> deprecated. It might return a CRS with a non-EPSG compliant axis order.
#> Warning: st_centroid assumes attributes are constant over geometries
#> Simple feature collection with 6 features and 4 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -0.7787038 ymin: 52.61348 xmax: -0.603416 ymax: 52.68473
#> Geodetic CRS:  WGS 84
#>                         name designation        gridref distance_to_site
#> 1              Rutland Water         SPA SK 90654 07196             0.00
#> 2              Rutland Water      Ramsar SK 90647 07150             0.00
#> 3   Burley and Rushpit Woods        SSSI SK 89158 09802          2568.81
#> 4            Prior's Coppice        SSSI SK 83130 05200          4255.14
#> 5 Wing Water Treatment Works        SSSI SK 89888 02691          3562.72
#> 6              Rutland Water        SSSI SK 90654 07196             0.00
#>                         geometry
#> 1 MULTIPOLYGON (((-0.6762392 ...
#> 2 MULTIPOLYGON (((-0.6738021 ...
#> 3 MULTIPOLYGON (((-0.6942947 ...
#> 4 MULTIPOLYGON (((-0.7733977 ...
#> 5 MULTIPOLYGON (((-0.6734955 ...
#> 6 MULTIPOLYGON (((-0.6762392 ...
```

The Local Planning Authority or National Character Area functiosn return
just the name of the area as a string:

``` r
fetch_lpa(site)
#> Warning in get_sf_crs(geometry): NAs introduced by coercion
#> Warning in get_sf_crs(sf_obj): NAs introduced by coercion
#> Warning in (function (query_url, fields, where, token = "", head, ...) : No
#> records match the search critera
#> NULL

fetch_nca(site)
#> Warning in get_sf_crs(geometry): NAs introduced by coercion
#> Warning in get_sf_crs(sf_obj): NAs introduced by coercion
#> Warning in (function (query_url, fields, where, token = "", head, ...) : No
#> records match the search critera
#> NULL
```
