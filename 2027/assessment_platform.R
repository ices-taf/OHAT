# to live test:
# https://tafinternal.ices.dk/worker2/OAT/13704%20AS%20Gadus%20morhua%20LI/biota/2027

# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

#Use this for executing
if (FALSE) {
  series_id <- "13704 AS Gadus morhua LI"
  compartment <- "biota"
}

# data and package sources in use: changing either of these causes the
# data to be redownloaded / harsat to be reinstalled on the next run
data_url <- "https://github.com/ices-taf/OHAT/releases/download/2027-v1/"
harsat_ref <- "osparcomm/HARSAT@develop"

# add logging
dir.create("log", showWarnings = FALSE)
logfile <-
  paste0("log/", gsub(" ", "_", series_id), "_", compartment, "_log.txt")

con <- file(logfile)
sink(con, append = TRUE)
sink(con, type = "message", append = TRUE)

# record of the data and package sources currently installed
version_file <- "versions.dcf"
recorded <-
  if (file.exists(version_file)) as.list(read.dcf(version_file)[1, ]) else list()

record_version <- function(field, value) {
  recorded[[field]] <<- value
  write.dcf(as.data.frame(recorded), version_file)
}

data_files <- c("biota.rds", "sediment.rds", "water.rds")

if (!identical(recorded$data_url, data_url)) {
  cat(
    "\nData source changed from", c(recorded$data_url, "(none)")[1], "to", data_url,
    "\nremoving old data files\n"
  )
  unlink(data_files)
}

ensure_data <- function(filename) {
  if (!file.exists(filename)) {
    # download to a temporary name so a failed download leaves no partial file
    tmpfile <- paste0(filename, ".download")
    download.file(
      paste0(data_url, filename),
      destfile = tmpfile,
      mode = "wb"
    )
    file.rename(tmpfile, filename)
  }
}

for (filename in data_files) ensure_data(filename)
record_version("data_url", data_url)

# for testing, contstruct calling url
calling_url <- paste0(
  "https://dome.ices.dk/ohat/Home/GettrResult?seriesID=",gsub(" ", "%20", series_id),
  "&matrix=", compartment, "&year=2027"
)

# print log file header
cat("\n\nStarting assessment platform for OHAT 2027\n")

cat("\nto test, try:\n\t", calling_url, "\n\n")

sessioninfo::session_info()

require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

# Get the current working directory
library_path <- file.path(getwd(), "lib")
dir.create("lib", showWarnings = FALSE)

# Install the package from harsat_ref to the specified library path, if it is
# missing or harsat_ref has changed since it was installed
if (!identical(recorded$harsat_ref, harsat_ref) ||
    !requireNamespace("harsat", lib.loc = library_path, quietly = TRUE)) {
  cat("\nInstalling harsat from", harsat_ref, "\n")
  remotes::install_github(harsat_ref, lib = library_path, force = TRUE, dependencies = FALSE)
  record_version("harsat_ref", harsat_ref)
}

# Load the package harsat 1.0.6
library("harsat", lib.loc = library_path)

cat("\nUsing harsat version:", capture.output(packageVersion("harsat")), "\n\n")

record_version("harsat_version", as.character(packageVersion("harsat")))
record_version("harsat_sha", packageDescription("harsat")$RemoteSha)

assessment <- readRDS(paste0(compartment, ".rds"))

dir.create("html", showWarnings = FALSE)

harsat::report_assessment(
  assessment,
  subset = series == series_id,
  output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2027.html", sep = "__")
)

sessioninfo::session_info()

sink(file = NULL)
sink(type = "message")
close(con)

#Use this for testing
if (FALSE) {

  series_id <- "13704 AS Gadus morhua LI"
  #series_id <- "7884 CD Limanda limanda LI"
  compartment <- "biota"

  harsat::report_assessment(
    assessment <- readRDS(paste0(compartment, ".rds")),
    subset = series == series_id,
    output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2027.html", sep = "__")
  )

}
