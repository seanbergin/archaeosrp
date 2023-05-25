#' Find and store important values for document type 18
#'
#' This function allows you to sort through document type 18 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type18
#' @export
#' @examples
#' processDocType18()

processDocType18 <- function(df,stringList){

  df$Zone.UTM <- phraseFinder(stringList, "zone", "easting")
  df$UseInfo <- phraseFinder(stringList,"type/function/use:", "how")

  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- phraseFinder(stringList, "northing", "gps’d")
  df$Date <- phraseFinder(stringList, "use", "how")
  df$OccupationDensity <- phraseFinder(stringList,"dimensions:", "acres:")

  if(is.na( df$E.UTM)){
    df$E.UTM <- phraseFinder(stringList,"eastng","northing")
  }
  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- phraseFinder(stringList, "zone", "eastng")
  }
  if(is.na( df$E.UTM)){
    df$E.UTM <- phraseFinder(stringList,"eastng","northmg")
  }
  if(is.na( df$N.UTM)){
    df$N.UTM <- phraseFinder(stringList,"northmg","gps’d")
  }


  return(df)
}
