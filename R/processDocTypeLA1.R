#' Find and store important values for document type LA-1
#'
#' This function allows you to sort through document type LA-1 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords typeLA-1
#' @export
#' @examples
#' processDocTypeLA-1()


# Note that this is a new type addition to read Louisiana State Site Records (type LA-1: "Update forms")

processDocType22 <- function(df = NULL, stringList = NULL){

  df$Date <- phraseFinder(stringList,"possible):","how")
  df$UseInfo = phraseFinder(stringList,"type/function/use:","physical")
  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$OccupationDensity <- phraseFinder(stringList, "dimensions:", "acres")

  return(df)
}
