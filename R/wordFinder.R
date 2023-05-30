#' Find the word following another word
#'
#' This function allows you to find the word or value that comes after a word
#' @param word2find  the word you are searching for
#' @param stringList  all of the page as a string list
#' @keywords find
#' @export
#' @examples
#' wordFinder()

wordFinder <- function(stringList = NULL, word2find = NULL){
  matches = match(word2find,stringList)
  value = stringList[matches + 1]
  return(value)
}
