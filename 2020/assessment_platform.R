require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

series <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

load("assessment_platform.RData")

render(output_file = paste(gsub(" ", "_", series), "__", gsub(" ", "_", compartment), "__2020.html", sep = ""),
       "assessment platform.Rmd",
       params = list(
         compartment = compartment,
         series = series)
)