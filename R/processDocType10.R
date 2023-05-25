#' Find and store important values for document type 10
#'
#' This function allows you to sort through document type 10 and save relevant information
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords type10
#' @export
#' @examples
#' processDocType10()

processDocType10 <- function(df,stringList){

  df$UseInfo = phraseFinder(stringList,"type*","dimensions:")
  df$Date <- phraseFinder(stringList,"component*","phase")
  df$OccupationDensity <- phraseFinder(stringList,"measurement","vegetation:")


  return(df)
}
