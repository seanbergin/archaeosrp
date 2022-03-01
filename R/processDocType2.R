#' Find and store important values for document type 2
#'
#' This function allows you to sort through document type 2 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type1
#' @export
#' @examples
#' processDocType1()

processDocType2 <- function(df,stringList){

  df$UseInfo = ArchaeoSRP:::phraseFinder(stringList,"instructions)","description")
  df$Date = ArchaeoSRP:::phraseFinder(stringList,"dates","cultural")
  df$OccupationDensity = ArchaeoSRP:::phraseFinder(stringList,"acreage","utm")

  #UTM is a problem
  #scanned: Al1,0) (612:311,5,0) [5,2/4,3]1,7,9| B[1,0} [6{2,3)2,7,0} 5,214 218 2,0

  return(df)
}
