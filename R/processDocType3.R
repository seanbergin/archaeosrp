#' Find and store important values for document type 3
#'
#' This function allows you to sort through document type 3 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type3
#' @export
#' @examples
#' processDocType3()

processDocType3 <- function(df,stringList){
  
  
  df$Date <- srp:::phraseFinder(stringList,"possible):","how") 
  df$UseInfo = srp:::phraseFinder(stringList,"type/function/use:","physical")
  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- srp:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- srp:::wordFinder(stringList, "northing")
  df$OccupationDensity <- srp:::phraseFinder(stringList, "dimensions:", "acres")
  
  
  return(df)
}