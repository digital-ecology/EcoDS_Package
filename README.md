
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EcoDS - ecological desk studies

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
```

## Usage

The main function in the package is the `ecods()` function. This creates
buffers around an input site, and returns an sf object with the sites
that intersect those buffers. The package has an example site to
demonstrate the function.

``` r
library(ecods)

site <- sf::st_transform(sample_site_boundary, 4326)

ecods(site)
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

The Local Planning Authority or National Character Area functions return
just the name of the area as a string:

``` r
fetch_lpa(site)
#> [1] "Rutland"

fetch_nca(site)
#> [1] "Leicestershire and Nottinghamshire Wolds"
```

## Bugs

If you encounter a bug, please file an issue with a minimal reproducible
example on
[Codeberg](https://codeberg.org/Digital-Ecology/EcoDS_Package/issues).

## Code of Conduct

This project is released subject to a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).
By participating in the project you agree to bide by its terms.
