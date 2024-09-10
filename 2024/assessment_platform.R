require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)
require(harsat)

#packageVersion('harsat')
#remotes::install_github("osparcomm/HARSAT@main")

# to live test:
# https://tafinternal.ices.dk/worker2/OAT/13704%20AS%20Gadus%20morhua%20LI/biota/2024

# add logging

logfile <-
  paste0(
    "log/",
    gsub(" ", "_", commandArgs(trailingOnly = TRUE)[1]),
    "_",
    commandArgs(trailingOnly = TRUE)[2],
    "_log.txt"
  )

con <- file(logfile)
sink(con, append = TRUE)
sink(con, type = "message", append = TRUE)

sessioninfo::session_info()

series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

load("assessment_platform.RData")

harsat::report_assessment(
  get(paste0(compartment, "_assessment")),
  subset = series == series_id,
  output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2024.html", sep = "__")
)

sessioninfo::session_info()


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