#' Find and store important values for document type 10
#'
#' This function allows you to sort through document type 10 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType10()

processDocType10 <- function(df,stringList){

  df$UseInfo = ArchaeoSRP:::phraseFinder(stringList,"type*","dimensions:")
  # df$Zone.UTM <- srp:::wordFinder(stringList, "zone")
  # df$E.UTM <- srp:::wordFinder(stringList, "easting:")
  # df$N.UTM <- srp:::wordFinder(stringList, "northing:")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- ArchaeoSRP:::phraseFinder(stringList,"component*","phase")
  df$OccupationDensity <- ArchaeoSRP:::phraseFinder(stringList,"measurement","vegetation:")


  return(df)
}
