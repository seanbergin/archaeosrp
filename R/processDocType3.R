#' Find and store important values for document type 3
#'
#' This function allows you to sort through document type 3 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type3
#' @export
#' @examples
#' processDocType3()

processDocType3 <- function(df,stringList){


  df$Date <- phraseFinder(stringList,"possible):","how")
  df$UseInfo = phraseFinder(stringList,"type/function/use:","physical")
  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$OccupationDensity <- phraseFinder(stringList, "dimensions:", "acres")


  return(df)
}
