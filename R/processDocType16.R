#' Find and store important values for document type 16
#'
#' This function allows you to sort through document type 16 and save relevant information. Doc Type 216 is often handwritten and may not be very successful
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type16
#' @export
#' @examples
#' processDocType16()

processDocType16 <- function(df,stringList){


  df$Zone.UTM <- wordFinder(stringList, "zone")
  df$E.UTM <- wordFinder(stringList, "easting")
  df$N.UTM <- wordFinder(stringList, "northing")
  df$Lat <- wordFinder(stringList, "lat.")
  df$Long <- wordFinder(stringList, "long.")
  df$UseInfo <- wordFinder(stringList, "function/use")

  df$OccupationDensity <- wordFinder(stringList,"size")

  df$Date <- wordFinder(stringList, "use")


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
