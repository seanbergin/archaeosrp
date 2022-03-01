#' Find and store important values for document type 16
#'
#' This function allows you to sort through document type 16 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type16
#' @export
#' @examples
#' processDocType16()

processDocType16 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- ArchaeoSRP:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing")
  df$Lat <- ArchaeoSRP:::phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- ArchaeoSRP:::phraseFinder(stringList, "longitude:", "elevation")

  df$UseInfo <- ArchaeoSRP:::phraseFinder(stringList,"19):","site")

  df$OccupationDensity <- ArchaeoSRP:::phraseFinder(stringList,"Dimensions):","*Method")
  if(is.na( df$OccupationDensity)){
    df$OccupationDensity <- ArchaeoSRP:::phraseFinder(stringList,"Dimensions):","Method")
  }

  df$OtherInfo<- ArchaeoSRP:::phraseFinder(stringList,"Details):","*Method")
  if(is.na( df$OtherInfo)){
    df$OtherInfo <- ArchaeoSRP:::phraseFinder(stringList,"Details):","Method")
  }


  df$Date <- ArchaeoSRP:::wordFinder(stringList, "*Component:")
  if(is.na( df$Date)){
    df$Date <- ArchaeoSRP:::wordFinder(stringList, "Component:")
  }

  df$BP <- ArchaeoSRP:::phraseFinder(stringList,"Approximation):","*Dating")
  if(is.na( df$BP)){
    df$BP <- ArchaeoSRP:::phraseFinder(stringList,"Approximation):","Dating")
  }

  return(df)
}
