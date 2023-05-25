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

  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$UseInfo <- phraseFinder(stringList,"physical","management")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:","acres:")

  return(df)
}
