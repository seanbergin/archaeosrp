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
  
  df$Zone.UTM <- srp:::wordFinder(stringList, "zone")
  df$UseInfo <- srp:::phraseFinderAdvanced(stringList,"type:", "phase", "physical" )
  
  df$E.UTM <- srp:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- srp:::phraseFinder(stringList, "northing", "*usgs")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- srp:::phraseFinderAdvanced(stringList,"date:","basis", "physical") 
  if (is.na(df$Date)){
    df$Date <- srp:::phraseFinder(stringList,"historic/prehistoric:","site") 
  }
  df$OccupationDensity <- phraseFinderAdvanced(stringList,"dimensions:","features", "physical") 
  
  
  return(df)
}