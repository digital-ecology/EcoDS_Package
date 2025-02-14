#' Fetch SSSIs within 5km buffer of site
#'
#' @param nationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{sssi<-fetch_sssi(nationalbuffers)}
fetch_sssi <- function(nationalbuffers){
  
  sssi_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/SSSI_England/FeatureServer/0"
  sssi <- arcpullr::get_layer_by_poly(sssi_url, nationalbuffers, sp_rel = "intersects")
  
  # return just columns needed
  if(nrow(sssi) ==0){
    s <- NULL
  }
  else{
    s <- data.frame(
      name = sssi$SSSI_NAME,
      designation = "SSSI",
      gridref = sssi$REFERENCE,
      distance_to_site = NA,
      geom = sssi$geoms
    )
    
  }
  
  sssi <- if(nrow(sssi)>0){sf::st_as_sf(s)}
  
  return(sssi)
  
}

#' Fetch AONBs within 5km of site
#'
#' @param nationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{aonb<-fetch_aonb(nationalbuffers)}
fetch_aonb <- function(nationalbuffers){
  
  aonb_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Areas_of_Outstanding_Natural_Beauty_England/FeatureServer/0"
  aonb <- arcpullr::get_layer_by_poly(aonb_url, nationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(aonb) ==0){
        a <- NULL
  }
  else{
    a <- data.frame(
      name = aonb$NAME,
      designation = "AONB",
      gridref = NA,
      distance_to_site = NA,
      geom = aonb$geoms
    )
    }
  
  aonb <- if(nrow(aonb)>0){sf::st_as_sf(a)}
  
  return(aonb)
  
}

#' Fetch NNRs within 5km of site
#'
#' @param nationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{nnr<-fetch_nnr(nationalbuffers)}
fetch_nnr <- function(nationalbuffers){
  
  nnr_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/National_Nature_Reserves_England/FeatureServer/0"
  nnr <- arcpullr::get_layer_by_poly(nnr_url, nationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(nnr) ==0){
    n <- NULL
  }
  else{
    n <- data.frame(
      name = nnr$NNR_NAME,
      designation = "NNR",
      gridref = nnr$REFERENCE,
      distance_to_site = NA,
      geom = nnr$geoms
    )
  }
  
  nnr <- if(nrow(nnr)>0){sf::st_as_sf(n)}
  
  return(nnr)
  
}

#' Fetch SACs within 10km of site
#'
#' @param internationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{sac<-fetch_sac(internationalbuffers)}
fetch_sac <- function(internationalbuffers){
  
  sac_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Special_Areas_of_Conservation_England/FeatureServer/0"
  sac <- arcpullr::get_layer_by_poly(sac_url, internationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(sac) ==0){
    sa <- NULL
  }
  else{
    sa <- data.frame(
      name = sac$SAC_NAME,
      designation = "SAC",
      gridref = sac$GRID_REF,
      distance_to_site = NA,
      geom = sac$geoms
    )
  }
  
  sac <- if(nrow(sac)>0){sf::st_as_sf(sa)}
  
  return(sac)
  
}

#' Fetch SPAs within 10km of site
#'
#' @param internationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{spa<-fetch_spa(internationalbuffers)}
fetch_spa <- function(internationalbuffers){
  
  spa_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Special_Protection_Areas_England/FeatureServer/0"
  spa <- arcpullr::get_layer_by_poly(spa_url, internationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(spa) ==0){
    sp <- NULL
  }
  else{
    sp <- data.frame(
      name = spa$SPA_NAME,
      designation = "SPA",
      gridref = spa$GRID_REF,
      distance_to_site = NA,
      geom = spa$geoms
    )
  }
  
  spa <- if(nrow(spa)>0){sf::st_as_sf(sp)}
  
  return(spa)
  
}

#' Fetch Ramsar sites within 10km of site
#'
#' @param internationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{ramsar<-fetch_ramsar(internationalbuffers)}
fetch_ramsar <- function(internationalbuffers){
  
  ramsar_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Ramsar_England/FeatureServer/0"
  ramsar <- arcpullr::get_layer_by_poly(ramsar_url, internationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(ramsar) ==0){
    r <- NULL
  }
  else{
    r <- data.frame(
      name = ramsar$NAME,
      designation = "Ramsar",
      gridref = ramsar$GRID_REF,
      distance_to_site = NA,
      geom = ramsar$geoms
    )
  }
  
  ramsar <- if(nrow(ramsar)>0){sf::st_as_sf(r)}
  
  return(ramsar)
  
}

#' Fetch LNRs within 2km of site
#'
#' @param localbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{lnr<-fetch_lnr(localbuffers)}
fetch_lnr <- function(localbuffers){
  
  lnr_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Local_Nature_Reserves_England/FeatureServer/0"
  lnr <- arcpullr::get_layer_by_poly(lnr_url, localbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(lnr) ==0){
    l <- NULL
  }
  else{
    l <- data.frame(
      name = lnr$LNR_NAME,
      designation = "LNR",
      gridref = NA,
      distance_to_site = NA,
      geom = lnr$geoms
    )
  }
  
  lnr <- if(nrow(lnr)>0){sf::st_as_sf(l)}
  
  return(lnr)
  
}

#' Fetch National Parks within 5km of site
#'
#' @param nationalbuffers buffer zone created by getbuffers
#'
#' @return a dataframe containing data regarding the designated site type searched
#' @export
#'
#' @examples \dontrun{natpark<-fetch_natpark(nationalbuffers)}
fetch_natpark <- function(nationalbuffers){
  
  natpark_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/National_Parks_England/FeatureServer/0"
  natpark <- arcpullr::get_layer_by_poly(natpark_url, nationalbuffers, sp_rel = "intersects")
  
  # keep just the columns needed
  # catch empty df's
  
  if(nrow(natpark) ==0){
    p <- NULL
  }
  else{
    p <- data.frame(
      name = natpark$NAME,
      designation = "National Park",
      gridref = NA,
      distance_to_site = NA,
      geom = natpark$geoms
    )
  }
  
  natpark <- if(nrow(natpark)>0){sf::st_as_sf(p)}
  
  return(natpark)
  
}

#' Fetch Priority Habitat Inventory (PHI) data that intersect site
#'
#' @param site sf object for site of interest, in EPSG:4326
#'
#' @return a dataframe containing data on priority habitats that intersect the site
#' @export
#'
#' @examples fetch_phi_site(sample_site_boundary)
fetch_phi_site <- function(site){
  
  phi_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Priority_Habitats_Inventory_England/FeatureServer/0"
  phi <- arcpullr::get_layer_by_poly(phi_url, site, sp_rel = "intersects")
  
  return(phi)
  
}

#' Fetch Priority Habitat Inventory (PHI) data from 500m buffer of site
#'
#' @param site sf object for site of interest, in EPSG:4326
#'
#' @return a dataframe containing data on priority habitats that intersect the site
#' @export
#'
#' @examples fetch_phi_buffer(sample_site_boundary)
fetch_phi_buffer <- function(site){
  
  site <- sf::st_buffer(site, 500)
  
  phi_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Priority_Habitats_Inventory_England/FeatureServer/0"
  phi <- arcpullr::get_layer_by_poly(phi_url, site, sp_rel = "intersects")
  
  return(phi)
  
}

#' Fetch Local Planning Authority in which site is located
#'
#' @param site sf object for site of interest, in EPSG:4326
#'
#' @return a string for the LPA in which the site is located
#' @export
#'
#' @examples fetch_lpa(sf::st_transform(sample_site_boundary, 4326))
fetch_lpa <- function(site){
  
  lpa_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Boundary_Line_Data/FeatureServer/14"
  lpa <- arcpullr::get_layer_by_poly(lpa_url, site, sp_rel = "intersects")
  
  lpa <- lpa$NAME
  
  return(lpa)
  
}

#' Fetch National Character Area in which site is located
#'
#' @param site sf object for site of interest, in EPSG:4326
#'
#' @return a string for the NCA in which the site is located
#' @export
#'
#' @examples fetch_nca(sample_site_boundary)
fetch_nca <- function(site){
  
  nca_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/National_Character_Areas_England/FeatureServer/0"
  nca <- arcpullr::get_layer_by_poly(nca_url, site, sp_rel = "intersects")
  
  nca <- nca$NCA_Name
  
  return(nca)
  
}

#' Fetch Ancient Woodland data intersecting site boundary
#'
#' @param site sf object for site of interest, in EPSG:4326
#'
#' @return an sf object of ancient woodland data intersecting the site
#' @export
#'
#' @examples fetch_awi(sample_site_boundary)
fetch_awi <- function(site){
  
  awi_url <- "https://services.arcgis.com/JJzESW51TqeY9uat/ArcGIS/rest/services/Ancient_Woodland_Revised_England/FeatureServer/2"
  awi <- arcpullr::get_layer_by_poly(awi_url, site, sp_rel = "intersects")
  
  #nca <- nca$NCA_Name
  
  return(awi)
  
}

#' Fetch irreplaceable habitats intersecting site boundary
#'
#' @param site sf object for site of interest, in EPSG:4326
#' @param buffer the buffer to apply to the site, in metres
#'
#' @return an sf object of irreplaceable habitats intersecting the site
#' @export
#'
#' @examples fetch_irreplaceable(sample_site_boundary)
fetch_irreplaceable <- function(site, buffer = 0){
  
  site <- sf::st_buffer(site, buffer)
  
  awi <- fetch_awi(site)
  
  if(nrow(awi) ==0){
    a <- NULL
  }
  else{
    a <- data.frame(
      type = "Ancient woodland",
      habitat = awi$NAME,
      geom = awi$geoms
    )

  }
  
  
  phi <- fetch_phi_site(site)
  # filter out irreplaceable habitats
  phi <- phi[phi$MainHabs %in% c("Blanket bog",
                          "Limestone pavements",
                          "Coastal sand dunes",
                          "Spartina saltmarsh swards",
                          "Mediterranean saltmarsh scrub",
                          "Lowland fens"),]
  
  if(nrow(phi) ==0){
    p <- NULL
  }
  else{
    p <- data.frame(
      type = "Priority habitat",
      habitat = phi$MainHabs,
      geom = phi$geoms
    )
    
  }
  
  irre <- rbind(a, p)
  
  return(irre)
  
  
}
