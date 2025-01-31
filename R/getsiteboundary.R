#' getsiteboundary
#'
#' @param site_boundary_data the site boundary file imported initially by database loading
#'
#' @return siteboundary, a sf object formatted for desk study
#' @export
#'
#' @examples \dontrun{siteboundary<-getsiteboundary(site_boundary_data)}
getsiteboundary<-function(site_boundary_data){
  
  #write spatial data and reproject
  siteboundary <- sf::st_as_sf(site_boundary_data, wkt = "geom", crs = 27700)
  
  #may be able to get rid of above line and just load in as 4326, but will slim later, works for now
  
  #make siteboundary right crs
  siteboundary<- sf::st_transform(siteboundary, crs = 4326)
  
  #check where theres more than one polygon and make it one 
   if (nrow(siteboundary) > 1) {
    siteboundary <- sf::st_union(siteboundary) 
    siteboundary <- sf::st_sf(geometry = siteboundary) 
  }
  
  return(siteboundary)
}