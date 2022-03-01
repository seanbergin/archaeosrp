#' Find and store important values for document type 5
#'
#' This function allows you to sort through document type 5 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type5
#' @export
#' @examples
#' processDocType5()

processDocType5 <- function(df,stringList){

  df$Zone.UTM <- ArchaeoSRP:::phraseFinder(stringList, "zone", "easting")
  df$E.UTM <- ArchaeoSRP:::phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- ArchaeoSRP:::wordFinder(stringList, "northing")
  df$Lat <- ArchaeoSRP:::phraseFinder(stringList, "latitude:", "longitude:")
  df$Long <- ArchaeoSRP:::phraseFinder(stringList, "longitude:", "elevation")
  df$UseInfo <- ArchaeoSRP:::phraseFinderRemover(stringList,"type:","different", 3)
  # Since there's no other simple information reocrded about the site, I am jsut keeping the whole site description text here
  df$OccupationDensity <- ArchaeoSRP:::phraseFinderRemover(stringList,"narrative","recorders", 1)

  if(is.na( df$Zone.UTM)){
    df$Zone.UTM <- ArchaeoSRP:::wordFinderB4(stringList,"easting",1)
  }


  #
  # if (df$UseInfo == NULL || df$Date == NULL || df$OccupationDensity == NULL)
  # { df$ScanSuccess = FALSE}
  # if (df$Zone.UTM == NULL && df$E.UTM == NULL && df$N.UTM == NULL && df$Lat == NULL && df$Long == NULL)
  # { df$ScanSuccess = FALSE}
  #
  return(df)
}
