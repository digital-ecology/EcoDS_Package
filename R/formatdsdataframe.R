#' formatdsdataframe
#'
#' @param dsdata the dataframe produced by a fetch function
#' @param siteboundary the sf object produced by getsiteboundarydata
#' @param name_col the column in the desk study dataframe referring to the designated site name
#' @param designation the designation for the table to be formatted
#' @param grid_ref_col the grid ref col, if known
#'
#' @return formatted dataframe if data present, null dataframe if not 
#' @export
#'
#' @examples \dontrun{sssidf<-formatdsdataframe(sssi, siteboundary, name_col = "NAME", designation = "SSSI")}
formatdsdataframe <- function(dsdata, siteboundary, name_col, designation, grid_ref_col = NULL) {
  
  #empty df to return 
  dsdf <- data.frame(matrix(ncol = 5, nrow = 1))
  
  #if data has been pulled, calculate minimum distance, and format table 
  if (nrow(dsdata) > 0) {
    
    #call min distance function
    dsdf <- getnearestdistance(dsdata, siteboundary, name = name_col)
    
    #round distance to nearest 50m
    dsdf$Distance <- round(dsdf$Distance / 50) * 50
    
    #add designation on
    dsdf$Designation <- designation
    
    #add OR assign gridref
    default_grid_ref = NA
    dsdf$GridRef <- if (!is.null(grid_ref_col)) dsdata[[grid_ref_col]] else default_grid_ref
    
    #add reason for designation column
    dsdf$Reason <- NA
    
    #if multiple measurements of one site distance, keep smallest distance only
    dsdf <- dsdf %>%
      dplyr::group_by(Name) %>%
      dplyr::slice_min(Distance) %>%
      dplyr::distinct(Name, Distance, .keep_all = TRUE) %>% #if multiple 0s, prints multiple names still 
      dplyr::ungroup()
    
    #rearrange and order 
    dsdf <- dsdf %>% select(Name, Designation, GridRef, Reason, Distance)
    
    #set colnames
    colnames(dsdf) <- c("Name", "Designation", "Grid Reference", "Reason For Designation", "Distance to Site (m)")
    
  } else {
    
    colnames(dsdf) <- c("Name", "Designation", "Grid Reference", "Reason For Designation", "Distance to Site (m)")
    
    #set all values NA
    dsdf[ , ] <- NA
    
  }
  
  return(dsdf)
}
