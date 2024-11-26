#' extract grid reference from coordinates of site centroid
#'
#' @param siteboundary sf object output from getsiteboundary function
#'
#' @return object with a grid reference 
#' @export 
#'
getgridref <- function (siteboundary){
  centroid <- sf::st_centroid(siteboundary)
  shapefile <- sf::st_transform(siteboundary, crs = 27700)
  centroid <- sf::st_transform(centroid, crs = 27700)
  
  # Plot the polygon and centroid
  # ggplot() +
  #   geom_sf(data = shapefile, fill = "lightblue", color = "blue", alpha = 0.5) +
  #   geom_sf(data = centroid, color = "red", size = 3) +
  #   ggtitle("Polygon and Centroid") +
  #   theme_minimal()
  
  long <- as.numeric(sf::st_coordinates(centroid)[, 1])
  lat <- as.numeric(sf::st_coordinates(centroid)[, 2])
  
  sgo <- sgo::sgo_points(list(x=long, y=lat),
                    coords=c("x", "y"), epsg=27700)
  grid10 <-c()
  grid10 <- sgo::sgo_bng_ngr(sgo)
  grid8 <- sgo::sgo_bng_ngr(sgo, digits=8)
  return(grid10)
}