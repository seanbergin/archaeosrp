#' Find and store important values for document type 8
#'
#' This function allows you to sort through document type 8 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type8
#' @export
#' @examples
#' processDocType8()

processDocType8 <- function(df,stringList){

  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone:", "easting")
  df$E.UTM <- srp:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- srp:::phraseFinder(stringList, "northing", "usgs")
  df$Date <- srp:::phraseFinder(stringList,"possible):","how") 
  df$UseInfo = srp:::phraseFinder(stringList,"type/function/use:","how")
  df$OccupationDensity <- srp:::phraseFinder(stringList,"dimensions:","acres:") 

  
  return(df)
}