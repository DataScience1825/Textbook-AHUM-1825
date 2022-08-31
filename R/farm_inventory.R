#' Food stocks from fictitious farms
#'
#'
#' This dataset represents the foods goods stored at four fictitious farms.
#'  Each row represents a food item being stored at a given farm and each
#'  column provides additional details on that food item:
#'
#' @format A tibble with 7 variables(columns) and 236 observations(row):
#' \describe{
#' \item{p_name}{(character) a food product's name (e.g. Fuji Apples, Sweet Corn)}
#' \item{f_name}{(character) the name of the farm storing the food item (Peppridge, Old Mcdonald, Bailey, Sevier)}
#' \item{p_per_lb}{(number) the food item's price per pound}
#' \item{q_in_lbs}{(number) the quantity of food being store in pounds}
#' \item{season}{(factor) the typical season for harvesting the food item (Fall, Winter, Spring, Summer, Year Round)}
#' \item{type}{(factor) the food item's type (FRUIT, VEGETABLE, TUBER, LEGUME, CEREAL, MEAT, or DAIRY)}
#' \item{avg_sl}{(number) the average shelf life (in days) for the food item  }
#' }
#'
#' @source {Michael Schneider, https://github.com/SchneiderCode}
#'
"farm_inventory"
