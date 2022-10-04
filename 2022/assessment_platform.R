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
  #    series = "Norway_97A2 Bod? harbour AS Mytilus edulis SB Not_applicable",
  #    series = "Sweden_V?der?arna CD Clupea harengus LI Not_applicable",
  #   series = "Norway_57A Krossanes CD Mytilus edulis SB",
  #   series = "Norway_91A2 ?rland ytre Trondheimsfjord CD Mytilus edulis SB Not_applicable"
  #   Sediment
  #   series = "Germany_STG16 CD"
  #   Water
  #   series = "The Netherlands_DOOVBWT CD"
  #   series = "Ireland_Carlingford Lough Inner Stn 2 CD"
  
  params <- list(

   series = "Germany_STG16 CD",
    compartment = "sediment"
  )
  
#  rm(params)
  render(
    "assessment_platform.Rmd",
      params = list(
      compartment = "biota",
      series = "Sweden_Väderöarna CD Clupea harengus LI Not_applicable"
    )
  )
}