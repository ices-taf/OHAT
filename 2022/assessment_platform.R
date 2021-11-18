require(lattice)
require(grid)
require(rmarkdown)
require(dplyr)
require(data.table)

series <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

load("assessment_platform.RData")

render(
  output_file = paste(gsub(" ", "_", series), "__", gsub(" ", "_", compartment), "__2022.html", sep = ""),
  output_dir = "html",
  "assessment_platform.Rmd",
  params = list(
    compartment = compartment,
    series = series
  )
)


#Use this for executing
if (FALSE) {
  
  params <- list(
    series = "Norway_97A2 Bodø harbour AS Mytilus edulis SB Not_applicable",
#    series = "Norway_57A Krossanes CD Mytilus edulis SB",
    compartment = "biota"
  )
  
  rm(params)
  render(
    "assessment_platform.Rmd",
    params = list(
      compartment = "biota",
      series = "Norway_97A2 Bodø harbour AS Mytilus edulis SB Not_applicable"
#      series = "Norway_57A Krossanes CD Mytilus edulis SB"
    )
  )
}