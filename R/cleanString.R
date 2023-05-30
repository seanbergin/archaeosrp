#' Text processing to allow better identifcation of words
#'
#' This function allows you to take the giant strongs ID'd with OCR and clean the text
#' @param stringtoclean the string taken from the pdf that needs to be cleaned of problematic characters and text
#' @keywords text
#' @export
#' @examples
#' cleanString()

cleanString <- function(stringtoclean = ""){
  # Lowercase
  temp <- ""
  temp <- tolower(x = stringtoclean)
  # Remove everything that is not a number or letter (may want to keep more
  # stuff in your actual analyses).
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # Split it
  temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  }
  return(temp)
}
