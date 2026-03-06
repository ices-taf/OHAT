# to live test:
# https://tafinternal.ices.dk/worker2/OAT/13704%20AS%20Gadus%20morhua%20LI/biota/2024

# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

# add logging
logfile <-
  paste0("log/", gsub(" ", "_", series_id), "_", compartment, "_log.txt")

con <- file(logfile)
sink(con, append = TRUE)
sink(con, type = "message", append = TRUE)

# begin script

# for testing, contstruct calling url
calling_url <- paste0(
  "https://dome.ices.dk/ohat/Home/GettrResult?seriesID=",
  gsub(" ", "%20", series_id),
  "&matrix=",
  compartment,
  "&year=2024"
)

# print log file header
cat("\n\nStarting assessment platform for OHAT 2024\n")

cat("\nto test, try:\n\t", calling_url, "\n\n")

# Get the current working directory
library_path <- file.path(getwd(), "lib")

# Install the package from the relevant branch 'main'/'develop' to the specified library path
# remotes::install_github("osparcomm/HARSAT@main", lib = library_path, force = TRUE)

# Load the package harsat 1.0.2
library("harsat", lib.loc = library_path)

require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

#packageVersion('harsat')

# load data
cat("\nLoading data...\n")
load("assessment_platform.RData", verbose = TRUE)

sessioninfo::session_info()

harsat::report_assessment(
  get(paste0(compartment, "_assessment")),
  subset = series == series_id,
  output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2024.html", sep = "__")
)

#sessioninfo::session_info()


#Use this for executing
if (FALSE) {

  series_id <- "13704 AS Gadus morhua LI"
  compartment <- "biota"

  harsat::report_assessment(
    get(paste0(compartment, "_assessment")),
    subset = series == series_id,
    output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2024.html", sep = "__")
  )

}
