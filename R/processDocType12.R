#' Find and store important values for document type 12
#'
#' This function allows you to sort through document type 12 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType12()

processDocType12 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::wordFinder(stringList, "zone:")
  df$UseInfo = ArchaeoSRP:::wordFinder(stringList, "classification:")

  df$E.UTM <- ArchaeoSRP:::wordFinder(stringList, "easting:")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing:")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- ArchaeoSRP:::wordFinder(stringList, "construction:")
  #df$OccupationDensity <- srp:::phraseFinder(stringList,"dimensions:","acres:")

  return(df)
}
