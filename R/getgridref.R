#' Identify site grid-reference
#'
#' @param sf_object an sf object output from the getsiteboundary function 
#'
#' @return A list containing:
#' \item{x_coord}{Numeric value representing the longitude of the centroid.}
#' \item{y_coord}{Numeric value representing the latitude of the centroid.}
#' \item{grid_reference_numeric}{Character string representing the numeric grid reference of the centroid.}
#' \item{grid_reference_letternumeric}{Character string representing the letter and numeric grid reference of the centroid.}
#'
#' @export
getgridref <- function(sf_object) {
  # get the centroid
  centroid <- sf::st_centroid(sf_object)
  
  # extract coordinates
  centroid_coords <- sf::st_coordinates(centroid)
  x_coord <- centroid_coords[1, 1]  # long
  y_coord <- centroid_coords[1, 2]  # lat
  
  # ensure correct CRS of centroid (EPSG:27700 for OS grid references)
  centroid_transformed <- sf::st_transform(centroid, crs = 27700)
  
  # re-calculate centroids in transformed CRS
  centroid_coords_transformed <- sf::st_coordinates(centroid_transformed)
  
  # identify grid reference (numeric) of centroid
  grid_reference_numeric <- sprintf("%d%d", centroid_coords_transformed[1, 1], centroid_coords_transformed[1, 2])
  
  # letter and numeric grid reference
  grid_reference_letternumeric <- sgo::sgo_bng_ngr(list(sgo_points(centroid_coords_transformed[1, 1], centroid_coords_transformed[1, 2])))
  
  # return all relevant values
  return(list(
    x_coord = x_coord,
    y_coord = y_coord,
    grid_reference_numeric = grid_reference_numeric,
    grid_reference_letternumeric = grid_reference_letternumeric
  ))
}
