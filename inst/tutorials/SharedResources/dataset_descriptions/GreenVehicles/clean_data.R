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
