#' Find and store important values for document type 1
#'
#' This function allows you to sort through document type 1 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type1
#' @export
#' @examples
#' processDocType1()

processDocType1 <- function(df,stringList){


  df$Date = ArchaeoSRP:::wordFinder(stringList=stringList, "known)")

  #if (df$Date == NULL){ df$ScanSuccess = FALSE}
  #stopped here because of problems reading lat/long

  return(df)
}
