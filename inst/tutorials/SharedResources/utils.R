#Create R code to update all css folders.
library(sass)

shared_resources_dir <- "~/AHUM-1825-Textbook/SharedResources" # Replace with the location of your Shared Resources directory

#Recompile the shared SASS file and update all of tutorials' css files
update_css <- function(){
  current_wd <- getwd() #Preserve working directory
  setwd(here::here("SharedResources"))

  #Update CSS
  sass(sass_file("textbook.sass"),
       output = paste("textbook.min.css", sep=""),
       options = sass_options(
         output_style = "compressed",
         source_map_embed = TRUE
       ))


  folders <- list.dirs("../", recursive = FALSE, full.names = FALSE)
  folders[folders != ".git" & folders != ".Rproj.user" & folders != "SharedResources"]  # Remove folders that don't need css files

  for(f in folders){

    #If css folder doesn't exist, create it
    if(!file.exists(paste("../", f, "/css", sep="")))
       dir.create(paste("../", f, "/css", sep=""))

    #Copy the css file over, replacing existing css file
    file.copy("textbook.min.css", paste("../", f, "/css/textbook.min.css", sep=""), overwrite = TRUE)

  }
  setwd(current_wd)#Restore working directory
}

#TODO: Create starter homework file!
# Generate a starter tutorial for a provided name
# This method will generate:
# - A new directory for the tutorial
# - Copy Starter.Rmd - replacing all mentions of starter with the provided name
# - Create the shared css file
# - Copy the starter images
generate_starters <- function(name){
  current_wd <- getwd() #Preserve working directory
  setwd(shared_resources_dir)

  #If tutorial's folder doesn't exist, create it
  if(!file.exists(paste("../", name, sep="")))
    dir.create(paste("../", name, sep=""))

  #If css folder doesn't exist, create it
  if(!file.exists(paste("../", name, "/css", sep="")))
    dir.create(paste("../", name, "/css", sep=""))

  #Copy the css file over, replacing existing css file
  file.copy("textbook.min.css", paste("../", name, "/css/textbook.min.css", sep=""), overwrite = TRUE)

  #If images folder doesn't exist create it
  if(!file.exists(paste("../", name, "/images", sep="")))
    dir.create(paste("../", name, "/images", sep=""))

  #If the main banner image doesn't exist, copy it
  if(!file.exists(paste("../", name, "/images/Blank Banner.png", sep="")))
    file.copy("images/Blank Banner.png", paste("../", name, "/images/Blank Banner.png", sep=""))

  #If the farming dataset's banner image doesn't exist, copy it
  if(!file.exists(paste("../", name, "/images/Blank Dataset.png", sep="")))
    file.copy("images/Blank Dataset.png", paste("../", name, "/images/Blank Dataset.png", sep=""))

  #If data folder doesn't exist create it
  if(!file.exists(paste("../", name, "/data", sep="")))
    dir.create(paste("../", name, "/data", sep=""))

  #If the homework dataset (Farming Inventory)doesn't exist, copy it
  if(!file.exists(paste("../", name, "/data/hmw_data.csv", sep="")))
    file.copy("datasets/FarmInventory/data.csv", paste("../", name, "/data/hmw_data.csv", sep=""))


  #If the homework markdown doesn't exist, copy it
  if(!file.exists(paste("../", name, "/homework_1.Rmd", sep="")))
    file.copy("grading/homework_1.Rmd", paste("../", name, "/homework_1.Rmd", sep=""))

  #If a tutorial doesn't exist, create it one from the Starter.Rmd
  if(!file.exists(paste("../", name, "/", name, ".Rmd", sep="")))
  {
    file.copy("Starter.Rmd", paste("../", name, sep=""))

    #Modify the newly created file so that it replaces all mentions of "starter" with the folder name
    file.rename(paste("../", name, "/Starter.Rmd", sep="") , paste("../", name, "/", name, ".Rmd", sep="") )
    starter  <- readLines(paste("../", name, "/", name, ".Rmd", sep=""))
    f_version  <- gsub(pattern = "_starter_", replace = name, x = starter)
    writeLines(f_version, con=paste("../", name, "/", name, ".Rmd", sep=""))
  }

  setwd(current_wd)#Restore working directory

}


#Todo:
# Create a utility that will change out all of the homework problems
#homework_1.Rmd
#at the top defines the dataset used:
# <!-- {{dataset:FarmInventory}} -->
updateAllHomeworks <- function(hmw_number){

}

#Todo:
# Create a utility that will update only a specific tutorial's homework problems


