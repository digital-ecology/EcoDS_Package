#' getbuffers
#'
#' @param siteboundary the SF object returned by getsiteboundary
#'
#' @return buffers, a list of sf objects representing the buffer zone for the desk study
#' @export
#'
#' @examples \dontrun{buffers<-getbuffers(siteboundary)}
getbuffers<-function(siteboundary){
  
  #create buffers for each point
  internationalbuffer<- sf::st_buffer(siteboundary, 10000)
  nationalbuffer <- sf::st_buffer(siteboundary, 5000)
  localbuffer <- sf::st_buffer(siteboundary, 2000)
  
  #return buffers
  buffers<-list(internationalbuffer = internationalbuffer, nationalbuffer = nationalbuffer, localbuffer = localbuffer)
  return(buffers)
  
}

