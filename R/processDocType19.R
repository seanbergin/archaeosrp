#' Find and store important values for document type 19
#'
#' This function allows you to sort through document type 19 and save relevant information. It is very similar to type 5
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type19
#' @export
#' @examples
#' processDocType19()

processDocType19 <- function(df = NULL, stringList = NULL){

  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting:")
  df$UseInfo <- phraseFinderAdvanced(stringList,"type:", "dimensions:","narrative")

  df$E.UTM <- wordFinder(stringList, "easting:")
  df$N.UTM <- wordFinder(stringList, "northing:")
  df$Lat <- wordFinder(stringList, "latitude:")
  df$Long <- wordFinder(stringList, "longitude:")
  df$Date <- phraseFinderAdvanced(stringList, "component:", "archaeological", "permanence:")
  df$OccupationDensity <- phraseFinderAdvanced(stringList,"dimensions:","vegetation:", "description")


  return(df)
}
