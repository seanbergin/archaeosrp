#' Find the word following another word
#'
#' This function allows you to find the word or value that comes multiple places after a word
#' @param word2find  the word you are searching for
#' @param stringList  all of the page as a string list
#' @param numberAfter the location of the word after the one identified in word2find that is being recorded
#' @keywords find
#' @export
#' @examples
#' wordFinderAfter()

wordFinderAfter <- function(stringList = NULL, word2find = NULL, numberAfter = NULL){
  matches = match(word2find,stringList)
  value = stringList[matches + (1 + numberAfter)]
  return(value)
}
