#' Find the word following another word
#'
#' This function allows you to find the word or value that comes before a word
#' @param word2find  the word you are searching for
#' @param stringList  all of the page as a string list
#' @keywords find
#' @export
#' @examples
#' wordFinderB4()

wordFinderB4 <- function(stringList, word2find, number.before){
  matches = match(word2find,stringList)
  value = stringList[matches - number.before]
  return(value)
}