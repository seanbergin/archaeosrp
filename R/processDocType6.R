#' Find and store important values for document type 6
#'
#' This function allows you to sort through document type 6 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type6
#' @export
#' @examples
#' processDocType6()

processDocType6 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- ArchaeoSRP:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing")
  df$UseInfo <- ArchaeoSRP:::phraseFinder(stringList,"physical","management")
  df$OccupationDensity <- ArchaeoSRP:::phraseFinder(stringList,"dimensions:","acres:")

  return(df)
}
