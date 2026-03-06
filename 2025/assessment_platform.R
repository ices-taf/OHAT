# to live test:
# https://tafinternal.ices.dk/worker2/OAT/13704%20AS%20Gadus%20morhua%20LI/biota/2025

# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

# add logging
logfile <-
  paste0("log/", gsub(" ", "_", series_id), "_", compartment, "_log.txt")

con <- file(logfile)
sink(con, append = TRUE)
sink(con, type = "message", append = TRUE)



# for testing, contstruct calling url
calling_url <- paste0(
  "https://dome.ices.dk/ohat/Home/GettrResult?seriesID=",gsub(" ", "%20", series_id),
  "&matrix=", compartment, "&year=2025"
)

# print log file header
cat("\n\nStarting assessment platform for OHAT 2025\n")

cat("\nto test, try:\n\t", calling_url, "\n\n")

sessioninfo::session_info()

require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

# Get the current working directory
library_path <- file.path(getwd(), "lib")

# Install the package from the relevant branch 'main'/'develop' to the specified library path
#remotes::install_github("osparcomm/HARSAT@develop", lib = library_path, force = TRUE)

# Load the package harsat 1.0.2.1007
library("harsat", lib.loc = library_path)

cat("\nUsing harsat version:", capture.output(packageVersion("harsat")), "\n\n")

assessment <- readRDS(paste0(compartment, ".rds"))

harsat::report_assessment(
  assessment,
  subset = series == series_id,
  output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2025.html", sep = "__")
)

sessioninfo::session_info()

#Use this for executing
if (FALSE) {

  series_id <- "13704 AS Gadus morhua LI"
  #series_id <- "7884 CD Limanda limanda LI"
  compartment <- "biota"

  harsat::report_assessment(
    assessment <- readRDS(paste0(compartment, ".rds")),
    subset = series == series_id,
    output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2025.html", sep = "__")
  )

}