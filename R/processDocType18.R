#' Find and store important values for document type 18
#'
#' This function allows you to sort through document type 18 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type18
#' @export
#' @examples
#' processDocType18()

processDocType18 <- function(df,stringList){
  
  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone", "easting")
  df$UseInfo <- srp:::phraseFinder(stringList,"type/function/use:", "how")
  
  df$E.UTM <- srp:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- srp:::phraseFinder(stringList, "northing", "gps’d")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- srp:::phraseFinder(stringList, "use", "how")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:", "acres:") 
  
  if(is.na( df$E.UTM)){
    df$E.UTM <- srp:::phraseFinder(stringList,"eastng","northing")
  }
  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- srp:::phraseFinder(stringList, "zone", "eastng")
  }
  if(is.na( df$E.UTM)){
    df$E.UTM <- srp:::phraseFinder(stringList,"eastng","northmg")
  }
  if(is.na( df$N.UTM)){
    df$N.UTM <- srp:::phraseFinder(stringList,"northmg","gps’d")
  }
  
  
  return(df)
}