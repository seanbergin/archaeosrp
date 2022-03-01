#' Find and store important values for document type 17
#'
#' This function allows you to sort through document type 17 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType17()

processDocType17 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::phraseFinder(stringList, "zone", "easting")
  df$UseInfo <- ArchaeoSRP:::phraseFinder(stringList,"map/drawings:", "isolate")

  df$E.UTM <- ArchaeoSRP:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- ArchaeoSRP:::phraseFinder(stringList, "northing", "usgs")
  df$OccupationDensity <- "isolate"


  return(df)
}
