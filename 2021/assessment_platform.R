require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

# add logging

logfile <-
  paste0(
    "log/",
    commandArgs(trailingOnly = TRUE)[1],
    "_",
    commandArgs(trailingOnly = TRUE)[2],
    "_log.txt"
  )

con <- file(logfile)
sink(con, append = TRUE)
sink(con, type = "message", append = TRUE)


series <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

load("assessment_platform.RData")

render(
  output_file = paste(gsub(" ", "_", series), "__", gsub(" ", "_", compartment), "__2021.html", sep = ""),
  output_dir = "html",
  "assessment_platform.Rmd",
  params = list(
    compartment = compartment,
    series = series
  )
)

warnings()
sessioninfo::session_info()


#Use this for executing
if (FALSE) {

  params <- list(
    series = "Norway_97A2 Bod� harbour AS Mytilus edulis SB Not_applicable",
#    series = "Norway_57A Krossanes CD Mytilus edulis SB",
    compartment = "biota"
  )

  rm(params)
  render(
    "assessment_platform.Rmd",
    params = list(
      compartment = "biota",
      series = "Norway_97A2 Bod� harbour AS Mytilus edulis SB Not_applicable"
#      series = "Norway_57A Krossanes CD Mytilus edulis SB"
    )
  )
}