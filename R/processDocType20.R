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

  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$Lat <- phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- phraseFinder(stringList, "longitude:", "elevation")



  if(is.na( df$Lat)){
    df$Lat <- wordFinderAfter(stringList,"latitude:",0)
  }
  if(is.na( df$Long)){
    df$Long <- wordFinderB4(stringList,"elevation",1)
    df$Long <- gsub(".*\\:", "", df$Long)
  }


  df$UseInfo <- phraseFinder(stringList,"19):","site")

  df$OccupationDensity <- phraseFinder(stringList,"dimensions):","*method")
  if(is.na( df$OccupationDensity)){
    df$OccupationDensity <- phraseFinder(stringList,"dimensions):","method")
  }

  df$OtherInfo<- phraseFinder(stringList,"Details):","*Method")
  if(is.na( df$OtherInfo)){
    df$OtherInfo <- phraseFinder(stringList,"Details):","Method")
  }


  df$Date <- wordFinder(stringList, "*Component:")
  if(is.na( df$Date)){
    df$Date <- wordFinder(stringList, "Component:")
  }
  if(is.na( df$Date)){
    df$Date <- wordFinderB4(stringList, "approximation):", 5)
  }

  df$BP <- wordFinderAfter(stringList,"approximation):", 0)
  if(is.na( df$BP)){
    df$BP <- phraseFinder(stringList,"approximation):","dating")
  }


  #Check for  7's being misinterpreted as /
  df$Zone.UTM = gsub("/", "7", df$Zone.UTM )
  df$E.UTM  = gsub("/", "7", df$E.UTM )
  df$N.UTM = gsub("/", "7", df$N.UTM )
  df$Lat = gsub("/", "7", df$Lat )
  df$Long = gsub("/", "7", df$Long )
  #df$UseInfo = gsub("/", "7", df$UseInfo )
  df$OccupationDensity = gsub("/", "7", df$OccupationDensity )
  df$OtherInfo = gsub("/", "7", df$OtherInfo )
  df$Date = gsub("/", "7", df$Date )
  df$BP = gsub("/", "7", df$BP )



  return(df)
}
