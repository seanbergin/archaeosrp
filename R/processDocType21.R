#' Find and store important values for document type 21
#'
#' This function allows you to sort through document type 21 and save relevant information. Doc Type 21 resembles type 5, but is for Isolates instead of Sites
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type21
#' @export
#' @examples
#' processDocType21()

processDocType21 <- function(df,stringList){


  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$Lat <- phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- phraseFinder(stringList, "longitude:", "elevation")
  df$UseInfo <- "Isolate"

  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- wordFinderB4(stringList,"easting",1)
  }


  if(is.na( df$Lat)){
    df$Lat <- wordFinderAfter(stringList,"latitude:",0)
  }
  if(is.na( df$Long)){
    df$Long <- wordFinderB4(stringList,"elevation",1)
    df$Long <- gsub(".*\\:", "", df$Long)
  }


  df$UseInfo <- phraseFinder(stringList,"designation","location")
  df$OccupationDensity <- phraseFinder(stringList,"overall","vegetation")


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

  df$OtherInfo <- phraseFinder(stringList,"features","method")

  #Check for  7's being misinterpreted as /
  df$Zone.UTM = gsub("/", "7", df$Zone.UTM )
  df$E.UTM  = gsub("/", "7", df$E.UTM )
  df$N.UTM = gsub("/", "7", df$N.UTM )
  df$Lat = gsub("/", "7", df$Lat )
  df$Long = gsub("/", "7", df$Long )
  df$OccupationDensity = gsub("/", "7", df$OccupationDensity )
  df$OtherInfo = gsub("/", "7", df$OtherInfo )
  df$Date = gsub("/", "7", df$Date )
  df$BP = gsub("/", "7", df$BP )



  return(df)
}
