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
  
  return(natpark)
  
}