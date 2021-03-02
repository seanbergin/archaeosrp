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
  
  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone", "easting:")
  df$UseInfo <- srp:::phraseFinderAdvanced(stringList,"type:", "dimensions:","narrative") 
  
  df$E.UTM <- srp:::wordFinder(stringList, "easting:")
  df$N.UTM <- srp:::wordFinder(stringList, "northing:")
  df$Lat <- srp:::wordFinder(stringList, "latitude:")
  df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- srp:::phraseFinderAdvanced(stringList, "component:", "archaeological", "permanence:")
  df$OccupationDensity <- srp:::phraseFinderAdvanced(stringList,"dimensions:","vegetation:", "description") 
  
#  if(is.na( df$E.UTM)){
#    df$E.UTM <- srp:::phraseFinder(stringList,"eastng","northing")
#  }

  
  
  return(df)
}