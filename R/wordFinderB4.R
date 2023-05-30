#' Find the word following another word
#'
#' This function allows you to find the word or value that comes before a word
#' @param word2find  the word you are searching for
#' @param stringList  all of the page as a string list
#' @param numberBefore the number of occurences of a string before
#' @keywords find
#' @export
#' @examples
#' wordFinderB4()

wordFinderB4 <- function(stringList = NULL, word2find = NULL, numberBefore = NULL){
  matches = match(word2find,stringList)
  value = stringList[matches - numberBefore]
  return(value)
}
