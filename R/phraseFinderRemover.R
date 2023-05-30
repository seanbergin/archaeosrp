#' Find the words in between two words
#'
#' This function allows you to look for a phrase that is bounded by two words and remove some of it
#' @param firstword  the first word you are searching for
#' @param lastword  the last word you are searching for
#' @param stringList  all of the page as a string list
#' @param words.to.remove  number of words to remove from the end of a string
#' @keywords find
#' @export
#' @examples
#' phraseFinderRemover()

phraseFinderRemover <- function(stringList  = "", firstword  = "", lastword  = "", words.to.remove  = 0){
  match1 = (match(firstword,stringList)+1)
  match2 = (match(lastword,stringList)-1)
  match2 = match2 - words.to.remove

  if (is.na(match1) || is.na(match2)){
    value = NA
  }else{
    value = paste(stringList[match1:match2], sep=" ", collapse=" ")
  }
  return(value)
}
