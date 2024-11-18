library(DBI)
library(sf)
library(RPostgreSQL)
library(dplyr)
library(arcpullr)

#set site name
site_name <- "North Barrow"

#connect using gisdb_connect script, dont forget to enter credentials! #define connection deets
host <- "104.248.162.185"
port <- "5432"
dbname <- "bngdata"
user <- "maddie"
password <- ""

#connect
con <- DBI::dbConnect(drv = RPostgreSQL::PostgreSQL(), dbname = dbname, host = host, port = port, user = user, password = password)

#check connection
tryCatch({
  result <- DBI::dbGetQuery(con, "SELECT 1")
  cat("Connection successful.\n")
}, error = function(e) {
  cat("Connection failed:", e$message, "\n")
})

#pull site data

#define query to retrieve site_boundary data for site_name
query <- paste("SELECT ST_AsText(geom) AS geom FROM postgis.site_boundary WHERE site_name = '", site_name, "'", sep = "")
site_boundary_data <- dbGetQuery(conn = con, statement = query)

########## ECODS ############

#format site boundary
siteboundary<-getsiteboundary(site_boundary_data)

#get buffers
buffers<-getbuffers(siteboundary)
internationalbuffer<-buffers$internationalbuffer
nationalbuffer<-buffers$nationalbuffer
localbuffer<-buffers$localbuffer

#get designated sites, and format produced dataframes 
  #intnl
sac<-fetch_sac(internationalbuffer)
sacdf<-formatdsdataframe(sac, siteboundary, name_col = "SAC_NAME", designation = "SAC", grid_ref_col = "GRID_REF")

spa<-fetch_spa(internationalbuffer)
spadf<-formatdsdataframe(spa, siteboundary, name_col = "SPA_NAME", designation = "SPA", grid_ref_col = "GRID_REF")

ramsar<-fetch_ramsar(internationalbuffer)
ramsardf<-formatdsdataframe(ramsar, siteboundary, name_col = "NAME", designation = "Ramsar", grid_ref_col = "GRID_REF")

  #ntnl
sssi<-fetch_sssi(nationalbuffer)
sssidf<-formatdsdataframe(sssi, siteboundary, name_col = "NAME", designation = "SSSI")

aonb<-fetch_aonb(nationalbuffer)
aonbdf<-formatdsdataframe(aonb, siteboundary, name_col = "NAME", designation = "AONB")

nnr<-fetch_nnr(nationalbuffer)
nnrdf<-formatdsdataframe(nnr, siteboundary, name_col = "NNR_NAME", designation = "NNR", grid_ref_col = "REFERENCE")

  #lcl
lnr<-fetch_lnr(localbuffer)
lnrdf<-formatdsdataframe(lnr, siteboundary, name_col = "LNR_NAME", designation = "LNR", grid_ref_col = "REFERENCE")

#make into lists, and format tables from lists
intnlsitelist<-list(sacdf, spadf, ramsardf)
ntnlsitelist<-list(sssidf, aonbdf, nnrdf)
localsitelist<-list(lnrdf)

#get formatted tables
intnldf<-formatdeskstudytables(intnlsitelist)
ntnldf<-formatdeskstudytables(ntnlsitelist)
lcldf<-formatdeskstudytables(localsitelist)

