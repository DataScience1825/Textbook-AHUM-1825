## Update paths (moved into shared resources) and move into the R functions available for the library

#Create R code to update all css folders.
library(sass)

shared_resources_dir <- "~/ahum1825/inst/tutorials/SharedResources" # Replace with the location of your Shared Resources directory


##Update All css will be on folder
#Recompile thedata:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAWElEQVR42mNgGPTAxsZmJsVqQApgmGw1yApwKcQiT7phRBuCzzCSDSHGMKINIeDNmWQlA2IigKJwIssQkHdINgxfmBBtGDEBS3KCxBc7pMQgMYE5c/AXPwAwSX4lV3pTWwAAAABJRU5ErkJggg== shared SASS file and update all of tutorials' css files
update_css <- function(){
  current_wd <- getwd() #Preserve working directory
  setwd(shared_resources_dir)

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

# Generate a starter tutorial for a provided name
# This method will generate:
# - A new directory for the tutorial
# - Copy into the new directory all the files/folders in starter
# - Rename starter.Rmd to be *name*.Rmd
# - Swap all mentions of _starter_ to be _name_ in the name.Rmd and homework_1.Rmd files
generate_starters <- function(name){
  current_wd <- getwd() #Preserve working directory
  setwd(shared_resources_dir)

  #If tutorial's folder doesn't exist, create it
  if(!file.exists(paste("../", name, sep="")))
    dir.create(paste("../", name, sep=""))

  #Copy the contents of the starter tutorial
  file.copy(list.files("starter/", full.names = TRUE), paste("../", name, sep=""), recursive=TRUE)

  #Rename starter.Rmd to match the new tutorial, tutorial.Rmd
  file.rename(paste("../", name, "/starter.Rmd", sep="") , paste("../", name, "/", name, ".Rmd", sep="") )

  #Swap the _starter_ keywords in the starter.Rmd and homework_1.Rmd files
  starter  <- readLines(paste("../", name, "/", name, ".Rmd", sep=""))
  f_version  <- gsub(pattern = "_starter_", replace = name, x = starter)
  writeLines(f_version, con=paste("../", name, "/", name, ".Rmd", sep=""))

  starter  <- readLines(paste("../", name, "/hmw/homework_1.Rmd", sep=""))
  f_version  <- gsub(pattern = "_starter_", replace = name, x = starter)
  writeLines(f_version, con=paste("../", name, "/hmw/homework_1.Rmd", sep=""))

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
updateOneHomework <- function(tutorial, hmw_number){

}

