#' Find the word following another word
#'
#' This function allows you to find the word or value that comes multiple places after a word
#' @param word2find  the word you are searching for
#' @param stringList  all of the page as a string list
#' @param number.after the location of the word after the one identified in word2find that is being recorded
#' @keywords find
#' @export
#' @examples
#' wordFinderAfter()

wordFinderAfter <- function(stringList, word2find,number.after){
  matches = match(word2find,stringList)
  value = stringList[matches + (1 + number.after)]
  return(value)
}
