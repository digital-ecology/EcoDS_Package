#' formatdeskstudytables
#'
#' @param designatedsitelist list containing designated sites of a given type: international, national, or local
#'
#' @return designatedsitesdf, the dataframe formatted for printing 
#' @export
#'
#' @examples \dontrun{intnldf<-formatdeskstudytables(intnlsitelist)}
formatdeskstudytables<-function(designatedsitelist){
  
  #filter out dataframes where all rows NA
  nonempty <- Filter(function(df) !all(apply(df, 1, function(x) all(is.na(x)))), designatedsitelist)

  #if left with any, format
  if(length(nonempty) > 0) {
    
    #mash together - may be better as rbind
    designatedsitedf<-Reduce(function(x, y) merge(x, y, all = TRUE), nonempty)
    
    #create full df
    designatedsitedf <- data.frame(
      designatedsitedf[, 1:3], 
      ReasonForDesignation = NA,
      Distance = round(as.numeric(designatedsitedf[, -(1:3)]), -2)
    )
    
    designatedsitedf <- designatedsitedf[rowSums(is.na(designatedsitedf)) != ncol(designatedsitedf), ]
    
    #colnames
    colnames(designatedsitedf) <- c("Name", "Designation", "Grid Reference", "Reason For Designation", "Distance to Site (m)")
    
  } else {
    
    designatedsitedf <- NULL
    
  }
  
  return(designatedsitedf)
  
}