library(htmltools)
library(rprojroot)

insert_description <- function(name){
  if(name == "palmerpenguins"){
    return(
      div(
        img(src=rprojroot::find_package_root_file("images", "palmerpenguins_banner.png"), alt="Palmer Penguins, showing drawings of the Chinstrap (left), Gentoo (center), and Adélie (right) penguins", style="width:100%;"),
        p("Artwork by ", a(href="https://twitter.com/allison_horst?lang=en", "@allison_horst") )
      )
    )
  }


}
