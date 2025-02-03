#' fetch_sssi
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
  s <- data.frame(
    name = sssi$SSSI_NAME,
    desingation = "SSSI",
    gridref = sssi$REFERENCE,
    distance_to_site = NA,
    geom = sssi$geoms
  )
  
  sssi <- sf::st_as_sf(s)
  
  return(sssi)
  
}

#' fetch_aonb
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
      desingation = "AONB",
      gridref = NA,
      distance_to_site = NA,
      geom = aonb$geoms
    )
    }
  
  aonb <- if(nrow(aonb)>0){sf::st_as_sf(a)}
  
  return(aonb)
  
}

#' fetch_nnr
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
      desingation = "NNR",
      gridref = nnr$REFERENCE,
      distance_to_site = NA,
      geom = aonb$geoms
    )
  }
  
  nnr <- if(nrow(nnr)>0){sf::st_as_sf(n)}
  
  return(nnr)
  
}

#' fetch_sac
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
  
  return(sac)
  
}

#' fetch_spa
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
  
  return(spa)
  
}

#' fetch_ramsar
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
  
  return(ramsar)
  
}

#' fetch_lnr
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
      desingation = "LNR",
      gridref = NA,
      distance_to_site = NA,
      geom = lnr$geoms
    )
  }
  
  lnr <- if(nrow(lnr)>0){sf::st_as_sf(l)}
  
  return(lnr)
  
}

#' fetch_natpark
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
      desingation = "National Park",
      gridref = NA,
      distance_to_site = NA,
      geom = natpark$geoms
    )
  }
  
  natpark <- if(nrow(natpark)>0){sf::st_as_sf(p)}
  
  return(natpark)
  
}
