#' Find the words in between two words
#'
#' This function allows you to look for a phrase that is bounded by two words and comes after a keyword in the document
#' @param firstword  the first word you are searching for
#' @param lastword  the last word you are searching for which must occur after the first word
#' @param stringList  all of the page as a string list
#' @param afterword the word that the first and last words must be after
#' @keywords finderAdvanced
#' @export
#' @examples
#' phraseFinderAdvanced()

phraseFinderAdvanced <- function(stringList, firstword, lastword, afterword){
  
  match3 = (match(afterword,stringList))
  if (is.na(match3)){
    value = NA
  }else{
    stringSegment = stringList[match3:length(stringList)]
    match1 = (match(firstword,stringSegment)+1)
    
    if (is.na(match1)){
      value = NA
    }else{
      stringSegment = stringSegment[match1:length(stringSegment)]
      match2 = (match(lastword,stringSegment)-1)
      if (is.na(match2)){
        value = NA
      }
      else{
        value = paste(stringSegment[1:match2], sep=" ", collapse=" ")
      }
    }
    
  }

  if (identical(value,lastword)){
    value = NA
  }
  
  return(value)
}