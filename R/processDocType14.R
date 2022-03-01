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

  #df$Zone.UTM <- srp:::wordFinder(stringList, "zone")   #This is actually missing from the form
  df$UseInfo <- ArchaeoSRP:::phraseFinder(stringList,"use:","current")

  df$E.UTM <- ArchaeoSRP:::wordFinder(stringList, "easting:")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing:")
  # df$Lat <- srp:::wordFinder(stringList, "latitude:")
  # df$Long <- srp:::wordFinder(stringList, "longitude:")
  df$Date <- ArchaeoSRP:::phraseFinder(stringList,"construction:","builder:")
  df$OccupationDensity <-  ArchaeoSRP:::wordFinder(stringList, "acreage")


  return(df)
}
