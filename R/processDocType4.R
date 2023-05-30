#' Find and store important values for document type 4
#'
#' This function allows you to sort through document type 4 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type4
#' @export
#' @examples
#' processDocType4()

processDocType4 <- function(df = NULL, stringList = ""){

  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting:")
  df$E.UTM <- phraseFinder(stringList, "easting:", "northing:")
  df$N.UTM <- phraseFinder(stringList, "northing:", "latitude:")
  df$Lat <- phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- phraseFinder(stringList, "longitude:", "elevation")
  df$UseInfo <- phraseFinder(stringList,"type:","dimensions,")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions,","vegetation:")
  df$Date <- phraseFinder(stringList,"*dates:","*dating")

  if(is.na(df$Zone.UTM)){
    df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  }
  if(is.na(df$E.UTM)){
    df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  }
  if(is.na(df$N.UTM)){
    df$N.UTM <- wordFinder(stringList, "northing")
  }
  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- wordFinderB4(stringList,"easting:",1)
  }
  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- wordFinderB4(stringList,"easting",1)
  }

  # if (df$UseInfo == NULL || df$Date == NULL || df$OccupationDensity == NULL)
  #   { df$ScanSuccess = FALSE}
  # if (df$Zone.UTM == NULL && df$E.UTM == NULL && df$N.UTM == NULL && df$Lat == NULL && df$Long == NULL)
  # { df$ScanSuccess = FALSE}

  return(df)
}
