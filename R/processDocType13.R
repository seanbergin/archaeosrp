#' Find and store important values for document type 13
#'
#' This function allows you to sort through document type 13 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType13()

processDocType13 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::wordFinder(stringList, "zone")
  df$UseInfo <- ArchaeoSRP:::phraseFinder(stringList,"physical","management")

  df$E.UTM <- ArchaeoSRP:::wordFinder(stringList, "easting")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- ArchaeoSRP:::phraseFinder(stringList,"association:","physical")
  df$OccupationDensity <- ArchaeoSRP:::phraseFinder(stringList,"dimensions:","temporal")

  return(df)
}
