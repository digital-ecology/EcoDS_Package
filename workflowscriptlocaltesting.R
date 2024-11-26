library(DBI)
library(sf)
library(RPostgreSQL)
library(dplyr)
library(arcpullr)

# #set site name
# site_name <- "Drovers Hill Farm"
# 
# #connect using gisdb_connect script, dont forget to enter credentials! #define connection deets
# host <- "104.248.162.185"
# port <- "5432"
# dbname <- "bngdata"
# user <- "charlie"
# password <- ""
# 
# #connect
# con <- DBI::dbConnect(drv = RPostgreSQL::PostgreSQL(), dbname = dbname, host = host, port = port, user = user, password = password)
# 
# #check connection
# tryCatch({
#   result <- DBI::dbGetQuery(con, "SELECT 1")
#   cat("Connection successful.\n")
# }, error = function(e) {
#   cat("Connection failed:", e$message, "\n")
# })
# 
# #pull site data
# 
# #define query to retrieve site_boundary data for site_name
# query <- paste("SELECT ST_AsText(geom) AS geom FROM postgis.site_boundary WHERE site_name = '", site_name, "'", sep = "")
# site_boundary_data <- dbGetQuery(conn = con, statement = query)




########## ECODS ############
# REad in local file as a test 

#format site boundary
siteboundary<-getsiteboundary(st_read(sample_site_boundary))
sitegridref <- getgridref(siteboundary)

#get buffers
buffers<-getbuffers(siteboundary)
internationalbuffer<-buffers$internationalbuffer
nationalbuffer<-buffers$nationalbuffer
localbuffer<-buffers$localbuffer

#get designated sites, and format produced dataframes 
  
sac<-fetch_sac(internationalbuffer)
spa<-fetch_spa(internationalbuffer)
ramsar<-fetch_ramsar(internationalbuffer)
sssi<-fetch_sssi(nationalbuffer)
aonb<-fetch_aonb(nationalbuffer)
nnr<-fetch_nnr(nationalbuffer)
lnr<-fetch_lnr(localbuffer)


sacdf<-formatdsdataframe(sac, siteboundary, name_col = "SAC_NAME", designation = "SAC", grid_ref_col = "GRID_REF")
spadf<-formatdsdataframe(spa, siteboundary, name_col = "SPA_NAME", designation = "SPA", grid_ref_col = "GRID_REF")
ramsardf<-formatdsdataframe(ramsar, siteboundary, name_col = "NAME", designation = "Ramsar", grid_ref_col = "GRID_REF")
sssidf<-formatdsdataframe(sssi, siteboundary, name_col = "SSSI_NAME", designation = "SSSI")
aonbdf<-formatdsdataframe(aonb, siteboundary, name_col = "NAME", designation = "AONB")
nnrdf<-formatdsdataframe(nnr, siteboundary, name_col = "NNR_NAME", designation = "NNR", grid_ref_col = "REFERENCE")
lnrdf<-formatdsdataframe(lnr, siteboundary, name_col = "LNR_NAME", designation = "LNR", grid_ref_col = "REFERENCE")

#make into lists, and format tables from lists
intnlsitelist<-list(sacdf, spadf, ramsardf)
ntnlsitelist<-list(sssidf, aonbdf, nnrdf)
localsitelist<-list(lnrdf)
 
  #get formatted tables
intnldf<-formatdeskstudytables(intnlsitelist)
ntnldf<-formatdeskstudytables(ntnlsitelist)
lcldf<-formatdeskstudytables(localsitelist)

