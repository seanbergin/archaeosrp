#' Find and store important values for document type 20
#'
#' This function allows you to sort through document type 20 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type20
#' @export
#' @examples
#' processDocType20()

processDocType20 <- function(df,stringList){

  df$Zone.UTM <- srp:::phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- srp:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- srp:::wordFinder(stringList, "northing")
  df$Lat <- srp:::phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- srp:::phraseFinder(stringList, "longitude:", "elevation")

  df$UseInfo <- srp:::phraseFinder(stringList,"19):","site")

  df$OccupationDensity <- srp:::phraseFinder(stringList,"Dimensions):","*Method")
  if(is.na( df$OccupationDensity)){
    df$OccupationDensity <- srp:::phraseFinder(stringList,"Dimensions):","Method")
  }

  df$OtherInfo<- srp:::phraseFinder(stringList,"Details):","*Method")
  if(is.na( df$OtherInfo)){
    df$OtherInfo <- srp:::phraseFinder(stringList,"Details):","Method")
  }


  df$Date <- srp:::wordFinder(stringList, "*Component:")
  if(is.na( df$Date)){
    df$Date <- srp:::wordFinder(stringList, "Component:")
  }

  df$BP <- srp:::phraseFinder(stringList,"Approximation):","*Dating")
  if(is.na( df$BP)){
    df$BP <- srp:::phraseFinder(stringList,"Approximation):","Dating")
  }

  return(df)
}
