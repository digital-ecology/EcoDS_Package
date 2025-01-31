#' getnearestdistance
#' 
#' a function to be used to pull the min distances between each designated site and the site boundary
#' most likely to be built into the table formatting function 
#'
#' @param designated_sites the dataframe of sites produced by a given 'fetch_x' function
#' @param siteboundary the siteboundary object produced by the 'getsiteboundary' function
#' @param name the name of the column in the designated_sites DF that refers to the designated site name
#'
#' @return a dataframe containing designated site name, and the distance to the siteboundary

getnearestdistance <- function(designated_sites, siteboundary, name = "name") {
  
  mindist <- numeric(nrow(designated_sites))
  
  #change this to be for each site name
  for (i in seq_len(nrow(designated_sites))) {
    nearest_points <- sf::st_nearest_points(designated_sites[i, ], siteboundary, pairwise = FALSE)
    linestrings<- sf::st_cast(nearest_points, "LINESTRING")
    distances <- sf::st_length(linestrings)
    mindist[i] <- as.numeric(min(distances))
  }
  
  df<-data.frame(Name = designated_sites[[name]], Distance = (round(mindist, 0)))
  return(df)
}