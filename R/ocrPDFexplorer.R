ocrPDFexplorer <- function(pdf_dir = ""){
  my_dir=pdf_dir
  all_files = pdfGrabber(my_dir)
  list_size = length(all_files)
  df.all.sites = dataFrameDefault()
  if (list_size > 0){
    for(i in 1:list_size[1]){

      # Render pdf to png image
      img_file <- pdftools::pdf_convert(all_files[i], format = 'tiff', pages = NULL, dpi = 1200)
      #Use OCR on each page
      fullString = ocr2string(img_file)
      #Identify which document types are present
      doctypes = docTypeFinder(fullString)
      #Split the string into a giant vector
      stringSplit = cleanString(fullString)

      file.remove(img_file)
      gc( full = TRUE)

    }
  }

  return(stringSplit)
}
