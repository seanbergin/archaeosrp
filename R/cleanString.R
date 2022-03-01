#' Text processing to allow better identifcation of words
#'
#' This function allows you to take the giant strongs ID'd with OCR and clean the text
#' @param siteString the location path of the pdf
#' @keywords text
#' @export
#' @examples
#' cleanString()

cleanString <- function(string){
  # Lowercase
  temp <- tolower(string)
  # Remove everything that is not a number or letter (may want to keep more
  # stuff in your actual analyses).
  #temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")
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
