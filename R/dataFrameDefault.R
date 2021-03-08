#' Makes an empty dataframe with col names
#'
#' This function allows you to create a dataframe with correct column titles but empty rows.
#' @keywords dataframe
#' @export
#' @examples
#' dataFrameDefault()

dataFrameDefault <- function(){

  df <- data.frame(Site=integer(),
                   Zone.UTM= double(),
                   E.UTM=double(),
                   N.UTM=double(),
                   Lat=double(),
                   Long=double(),
                   Date=character(),
                   OccupationDensity = character(),
                   UseInfo = character(),
                   ScanSuccess = logical(),
                   Doc.Type = character(),
                   BP = character(),
                   OtherInfo = character(),
                   stringsAsFactors=FALSE)


  return(df)
}
