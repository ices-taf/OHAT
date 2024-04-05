require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)
require(remotes)
remotes::install_github("osparcomm/HARSAT@main")

series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

load("assessment_platform.RData")

rename_report <- function(series_id, compartment, path = "html") {
  
  assessment_obj <- get(paste0(compartment, "_assessment"))
  
  timeseries <- assessment_obj$timeSeries
  
  timeseries <- tibble::rownames_to_column(timeseries, "series")
  
  timeseries <- dplyr::left_join(
    timeseries, 
    assessment_obj$stations, 
    by = "station_code"
  )
  
  timeseries <- tibble::column_to_rownames(timeseries, "series")
  
  timeseries <- timeseries[series_id, ]
  
  output_id <- sub(
    timeseries$station_code,
    paste(timeseries$station_code, timeseries$country, timeseries$station_name), 
    series_id,
    fixed=TRUE
  )
  
  # get rid of any slashes that might have crept in 
  
  output_id <- gsub(" / ", " ", output_id, fixed = TRUE)
  output_id <- gsub("/", " ", output_id, fixed = TRUE)
  
  output_id <- gsub(" \ ", " ", output_id, fixed = TRUE)
  output_id <- gsub("\\", " ", output_id, fixed = TRUE)
  
  file.rename(
    file.path(path, paste0(output_id, ".html")),
    file.path(path, paste(gsub(" ", "_", series_id), compartment, "2024.html", sep = "__"))        
  )
  
  invisible()  
}

harsat::report_assessment(
  get(paste0(compartment, "_assessment")), 
  subset = series == series_id, 
  output_dir = "html"
)

rename_report(series_id, compartment)  


#Use this for executing
if (FALSE) {
  series_id <- "13704 AS Gadus morhua LI"
  compartment <- "biota"

  harsat::report_assessment(
    get(paste0(compartment, "_assessment")), 
    subset = series == series_id, 
    output_dir = "html"
  )
  rename_report(series_id, compartment)  
}