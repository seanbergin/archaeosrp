#' Find and store any dates that are mentioned in random locations by looking for BP
#'
#' This function allows you to save miscellaneous dates
#' @param df  the dataframe for this site which is passed to each document type
#' @param stringList  all of the page as a string list
#' @keywords BP
#' @export
#' @examples
#' bpFinder()

bpFinder <- function(df,stringList){
  
  df$BP <- srp:::wordFinderB4(stringList, "BP", 1)
  
  if (is.na(df$BP)){
    df$BP <- srp:::wordFinderB4(stringList, "bp", 1)
  }
  if (is.na(df$BP)){
    df$BP <- srp:::wordFinderB4(stringList, "B.P.", 1)
  }
  if (is.na(df$BP)){
    df$BP <- srp:::wordFinderB4(stringList, "B.P", 1)
  }
  if (is.na(df$BP)){
    df$BP <- srp:::wordFinderB4(stringList, "B.P)", 1)
  }
  if (is.na(df$BP)){
    df$BP <- srp:::wordFinderB4(stringList, "B.P.)", 1)
  }
  
  return(df)
}