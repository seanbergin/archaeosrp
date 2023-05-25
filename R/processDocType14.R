#' Find and store important values for document type 14
#'
#' This function allows you to sort through document type 14 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType14()

processDocType14 <- function(df,stringList){

  df$UseInfo <- phraseFinder(stringList,"use:","current")

  df$E.UTM <- wordFinder(stringList, "easting:")
  df$N.UTM <- wordFinder(stringList, "northing:")

  df$Date <- phraseFinder(stringList,"construction:","builder:")
  df$OccupationDensity <-  wordFinder(stringList, "acreage")


  return(df)
}
