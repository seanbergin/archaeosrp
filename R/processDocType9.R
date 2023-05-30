#' Find and store important values for document type 9
#'
#' This function allows you to sort through document type 9 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type9
#' @export
#' @examples
#' processDocType9()

processDocType9 <- function(df = NULL, stringList = NULL){

  df$Zone.UTM <- phraseFinder(stringList,"zone","northing")
  df$E.UTM <- phraseFinder(stringList,"easting","elevation:")
  df$N.UTM <- phraseFinder(stringList,"northing", "easting")
  df$UseInfo = phraseFinder(stringList,"function:","how")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:","condition:")

  if(is.na( df$E.UTM)){
    df$E.UTM <- phraseFinder(stringList,"basting","elevation:")
  }
  if(is.na( df$N.UTM)){
    df$N.UTM <- phraseFinder(stringList,"northing", "basting")
  }
  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- phraseFinder(stringList,"zone", "£northing")
  }
  if(is.na( df$N.UTM)){
    df$N.UTM <- phraseFinder(stringList,"£northing", "easting")
  }

  return(df)
}
