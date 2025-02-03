
#' EcoDS - ecological desk study
#'
#' @param siteboundary sf object for site boundary
#'
#' @return an sf object of all sites within the buffers
#' @export
#'
#' @examples ecods(sample_site_boundary)
ecods <- function(siteboundary){
  
  # buffer site
  siteboundary <- sf::st_transform(siteboundary, 4326)
  buf <- getbuffers(siteboundary)
  
  ten <- buf$internationalbuffer
  fiv <- buf$nationalbuffer
  two <- buf$localbuffer
  
  # fetch sites
  # international
  spa <- fetch_spa(ten)
  sac <- fetch_sac(ten)
  ramsar <- fetch_ramsar(ten)
  
  # national
  sssi <- fetch_sssi(fiv)
  nnr <- fetch_nnr(fiv)
  aonb <- fetch_aonb(fiv)
  natpark <- fetch_natpark(fiv)
  
  # local
  lnr <- fetch_lnr(two)
  
  # combine above tables
  sites <- rbind(spa, sac, ramsar, sssi, nnr, aonb, natpark, lnr)
  
  # distance to feature
  x <- sf::st_distance(sf::st_transform(sample_site_boundary, 4326), sites)
  x <- as.numeric(round(x,2))
  sites$distance_to_site <- x
  
  # grid references
  gr <- getgridref(sites)
  gr <- unlist(gr, use.names = FALSE)
  sites$gridref <- gr
  
  return(sites)
  
}

