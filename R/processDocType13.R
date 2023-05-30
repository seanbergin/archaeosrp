#' Find and store important values for document type 13
#'
#' This function allows you to sort through document type 13 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType13()

processDocType13 <- function(df = NULL, stringList = NULL){

  df$Zone.UTM <- wordFinder(stringList, "zone")
  df$UseInfo <- phraseFinder(stringList,"physical","management")

  df$E.UTM <- wordFinder(stringList, "easting")
  df$N.UTM <- wordFinder(stringList, "northing")

  df$Date <- phraseFinder(stringList,"association:","physical")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:","temporal")

  return(df)
}
