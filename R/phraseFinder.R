#' Find the words in between two words
#'
#' This function allows you to look for a phrase that is bounded by two words
#' @param firstword  the first word you are searching for
#' @param lastword  the last word you are searching for which must occur after the first word
#' @param stringList  all of the page as a string list
#' @keywords find
#' @export
#' @examples
#' phraseFinder()

phraseFinder <- function(stringList  = "", firstword  = "", lastword  = ""){
  match1 = (match(firstword,stringList)+1)

  if (is.na(match1)){
    value = NA
  }else{
    stringSegment = stringList[match1:length(stringList)]
    match2 = (match(lastword,stringSegment)-1)
    if (is.na(match2)){
      value = NA
    }
    else{
      value = paste(stringSegment[1:match2], sep=" ", collapse=" ")
    }
  }

  if (identical(value,lastword)){
    value = NA
  }

  return(value)
}
