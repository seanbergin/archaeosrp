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

  df$Zone.UTM <- phraseFinder(stringList, "zone:", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- phraseFinder(stringList, "northing", "usgs")
  df$Date <- phraseFinder(stringList,"possible):","how")
  df$UseInfo = phraseFinder(stringList,"type/function/use:","how")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:","acres:")


  return(df)
}
