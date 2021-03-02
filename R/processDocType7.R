#' Find and store important values for document type 7
#'
#' This function allows you to sort through document type 7 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type7
#' @export
#' @examples
#' processDocType7()

processDocType7 <- function(df,stringList){
  
  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone:", "easting:")
  if (identical(df$Zone.UTM,"jo")){
    df$Zone.UTM <- 10
    }

  df$E.UTM <- srp:::phraseFinder(stringList, "easting:", "northing:")
  df$N.UTM <- srp:::phraseFinder(stringList, "northing:", "usgs")
  #df$UseInfo <- srp:::phraseFinder(stringList,"description:","isolate") 
  df$OccupationDensity <- srp:::phraseFinder(stringList,"dimensions:","acres:") 
  df$Date <- srp:::phraseFinderRemover(stringList, "use:", "determined:", 2)
  
  return(df)
}