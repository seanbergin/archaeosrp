#' Find and store important values for document type 22
#'
#' This function allows you to sort through document type 22 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type22
#' @export
#' @examples
#' processDocType22()


# Note that this is a new type addition to read Louisiana State Site Records (type 22: "Update forms")

processDocType22 <- function(df = NULL, stringList = NULL){


  #df$Date = ArchaeoSRP:::wordFinder(stringList=stringList, "known)")
  df$Date = wordFinder(stringList=stringList, "known)")
  #if (df$Date == NULL){ df$ScanSuccess = FALSE}
  #stopped here because of problems reading lat/long

  return(df)
}
