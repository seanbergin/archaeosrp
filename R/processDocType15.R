#' Find and store important values for document type 15
#'
#' This function allows you to sort through document type 15 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType15()

processDocType15 <- function(df,stringList){

  df$Zone.UTM <- wordFinder(stringList, "zone")
  df$UseInfo <- phraseFinderAdvanced(stringList,"type:", "phase", "physical" )

  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- phraseFinder(stringList, "northing", "*usgs")

  df$Date <- phraseFinderAdvanced(stringList,"date:","basis", "physical")
  if (is.na(df$Date)){
    df$Date <- phraseFinder(stringList,"historic/prehistoric:","site")
  }
  df$OccupationDensity <- phraseFinderAdvanced(stringList,"dimensions:","features", "physical")


  return(df)
}
