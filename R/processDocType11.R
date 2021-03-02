#' Find and store important values for document type 11
#'
#' This function allows you to sort through document type 11 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType11()

processDocType11 <- function(df,stringList){
  
  df$Zone.UTM <- srp:::wordFinder(stringList, "zone:")
  df$UseInfo = srp:::phraseFinder(stringList,"type/function/use:","site")
  
  df$E.UTM <- srp:::wordFinder(stringList, "easting")
  df$N.UTM <- srp:::wordFinder(stringList, "northing")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- srp:::phraseFinder(stringList,"use:","how") 
  df$OccupationDensity <- srp:::phraseFinder(stringList,"dimensions:","acres:") 
  
  return(df)
}