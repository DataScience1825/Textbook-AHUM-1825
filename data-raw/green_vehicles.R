## code to prepare `green_vehicles` dataset goes here

## TODO: Fix this to use the EPA's API to gather and update the dataset
## The original dataset was built harvested from the "EPA Green Vehicle Guide" for 2020, 2021, 2022
## : https://www.fueleconomy.gov/feg/download.shtml
## Raw Data: https://www.fueleconomy.gov/feg/epadata/vehicles.csv.zip
## Will need to process it.
## Reference: https://github.com/hadley/fueleconomy/blob/master/data-raw/vehicles.R
##

# Utility function to convert the "/" notation for data in the green_vehicles dataset into a double (average of the two numbers)
convert_slash <- function(value){
  data <- sapply(value, function(x){
    if(str_detect(x, "/")){
      max_min <- str_split(x, "/")
      return(floor((strtoi(max_min[[1]][1]) + strtoi(max_min[[1]][2]))/2))
    }
    return(strtoi(x))
  })
  return(data)
}

#clean up the green_vehicles dataset to remove the "/" notation
clean_green_data <- function(){

  green_vehicles <- read_csv("datasets/original_data.csv")
  green_vehicles <- mutate(green_vehicles, across(c(CityMPG, HwyMPG, CmbMPG, CombCO2), mod_col))
  write_csv(green_vehicles, "datasets/data.csv", quote="none")

}


usethis::use_data(green_vehicles, overwrite = TRUE)
