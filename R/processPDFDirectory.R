#' Process all the PDFs in a given directory
#'
#' This function allows you to submit the directory of your pdfs which contain archaeological site records and returns a dataframe with the data
#' @param pdf_dir  the directory that has all of the PDFs you wish to process
#' @keywords pdf
#' @export
#' @examples
#' processPDFDirectory()



processPDFDirectory <- function(pdf_dir){

  library(tesseract)
  library(magick)
  library(magrittr)
  library(pdftools)
  library(dplyr)

  my_dir=pdf_dir
  all_files = srp:::pdfGrabber(my_dir)
  list_size = length(all_files)
  df.all.sites = srp:::dataFrameDefault()

  for(i in 1:list_size[1]){

    # Render pdf to png image
    img_file <- pdftools::pdf_convert(all_files[i], format = 'tiff', pages = NULL, dpi = 800)
    #Use OCR on each page
    fullString = srp:::ocr2string(img_file)
    #Identify which document types are present
    doctypes = srp:::docTypeFinder(fullString)
    #Split the string into a giant vector
    stringSplit = srp:::cleanString(fullString)
    df = srp:::dataFrameDefault()
    df[1,1] = srp:::getsiteID(all_files[i])

    #Make sure the document type has been identified
    if(length(doctypes) == 0){
      df$ScanSuccess = FALSE
    }else{
      df$ScanSuccess = TRUE
      df$Doc.Type = doctypes[1]
    }
    #system("say doc processing complete")

    if (df$ScanSuccess){
      totalTypes = length(doctypes)
      #Determine which document types to process and record the info in a dataframe
      for( j in 1:totalTypes[1]){
        if( doctypes [j] == 1){df = srp:::processDocType1(df, stringSplit)}
        if( doctypes [j] == 2){df = srp:::processDocType2(df, stringSplit)}
        if( doctypes [j] == 3){df = srp:::processDocType3(df, stringSplit)}
        if( doctypes [j] == 4){df = srp:::processDocType4(df, stringSplit)}
        if( doctypes [j] == 5){df = srp:::processDocType5(df, stringSplit)}
        if( doctypes [j] == 6){df = srp:::processDocType6(df, stringSplit)}
        if( doctypes [j] == 7){df = srp:::processDocType7(df, stringSplit)}
        if( doctypes [j] == 8){df = srp:::processDocType8(df, stringSplit)}
        if( doctypes [j] == 9){df = srp:::processDocType9(df, stringSplit)}
        if( doctypes [j] == 10){df = srp:::processDocType10(df, stringSplit)}
        if( doctypes [j] == 11){df = srp:::processDocType11(df, stringSplit)}
        if( doctypes [j] == 12){df = srp:::processDocType12(df, stringSplit)}
        if( doctypes [j] == 13){df = srp:::processDocType13(df, stringSplit)}
        if( doctypes [j] == 14){df = srp:::processDocType14(df, stringSplit)}
        if( doctypes [j] == 15){df = srp:::processDocType15(df, stringSplit)}
        if( doctypes [j] == 17){df = srp:::processDocType17(df, stringSplit)}
        if( doctypes [j] == 18){df = srp:::processDocType18(df, stringSplit)}
        if( doctypes [j] == 19){df = srp:::processDocType19(df, stringSplit)}
        if( doctypes [j] == 20){df = srp:::processDocType20(df, stringSplit)}
      }
    }


    df.all.sites = rbind(df.all.sites,df)
    #Get Rid of the temporary Image files
    file.remove(img_file)
    cat("Document", i, "of", list_size,"Complete", sep=" ")
    cat("\n")

  }

  return(df.all.sites)
}
