#' OCR on multiple pages
#'
#' This function allows you to modify an image and run OCR on multiple pages
#' @param pages the images used
#' @keywords ocr
#' @export
#' @examples
#' ocr2string()

ocr2string <- function(pages){
  number_pages <- length(pages)
  
  all_text = ""
  for(i in 1:number_pages[1]){
  
  # Reading one of the pages
  text <- magick::image_read(pages[i]) %>%
    image_convert(colorspace = 'gray') %>%
    image_trim() %>%
    image_write(format = 'png', density = '300x300') %>%
    tesseract::ocr()
  
  all_text = paste(all_text, text, sep = " ")
  }

  return(all_text)
}