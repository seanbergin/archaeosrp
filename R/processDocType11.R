#' Find and store important values for document type 11
#'
#' This function allows you to sort through document type 11 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType11()

processDocType11 <- function(df = NULL, stringList = NULL){

  df$Zone.UTM <- wordFinder(stringList, "zone:")
  df$UseInfo = phraseFinder(stringList,"type/function/use:","site")

  df$E.UTM <- wordFinder(stringList, "easting")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$Date <- phraseFinder(stringList,"use:","how")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:","acres:")

  return(df)
}
