#' Find and store important values for document type 19
#'
#' This function allows you to sort through document type 19 and save relevant information. It is very similar to type 5
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type19
#' @export
#' @examples
#' processDocType19()

processDocType19 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::phraseFinder(stringList, "zone", "easting:")
  df$UseInfo <- ArchaeoSRP:::phraseFinderAdvanced(stringList,"type:", "dimensions:","narrative")

  df$E.UTM <- ArchaeoSRP:::wordFinder(stringList, "easting:")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing:")
  df$Lat <- ArchaeoSRP:::wordFinder(stringList, "latitude:")
  df$Long <- ArchaeoSRP:::wordFinder(stringList, "longitude:")
  df$Date <- ArchaeoSRP:::phraseFinderAdvanced(stringList, "component:", "archaeological", "permanence:")
  df$OccupationDensity <- ArchaeoSRP:::phraseFinderAdvanced(stringList,"dimensions:","vegetation:", "description")


  return(df)
}
