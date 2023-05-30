#' OCR on multiple pages
#'
#' This function allows you to modify an image and run OCR on multiple pages
#' @param pages the images used
#' @keywords ocr
#' @export
#' @examples
#' ocr2string()

ocr2string <- function(pages = "/"){

  number_pages <- length(pages)

  all_text = ""
  for(i in 1:number_pages[1]){

  # Reading one of the pages
  # text <- magick::image_read(pages[i]) %>%
  #   magick::image_convert(colorspace = 'gray') %>%
  #   magick::image_trim() %>%
  #   magick::image_write(format = 'png', density = '300x300') %>%
  #   tesseract::ocr()

    this_image <- magick::image_read(pages[i])
    this_image <- magick::image_convert(this_image, colorspace = 'gray')
    this_image <-magick::image_trim(this_image, )
    this_image <-magick::image_write(this_image, format = 'png', density = '300x300')
    text <- tesseract::ocr(this_image)

  all_text = paste(all_text, text, sep = " ")
  }

  return(all_text)
}
