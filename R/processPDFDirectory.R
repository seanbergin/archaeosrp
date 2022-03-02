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
  all_files = ArchaeoSRP:::pdfGrabber(my_dir)
  list_size = length(all_files)
  df.all.sites = ArchaeoSRP:::dataFrameDefault()

  for(i in 1:list_size[1]){

    # Render pdf to png image
    img_file <- pdftools::pdf_convert(all_files[i], format = 'tiff', pages = NULL, dpi = 1200)
    #Use OCR on each page
    fullString = ArchaeoSRP:::ocr2string(img_file)
    #Identify which document types are present
    doctypes = ArchaeoSRP:::docTypeFinder(fullString)
    #Split the string into a giant vector
    stringSplit = ArchaeoSRP:::cleanString(fullString)
    df = ArchaeoSRP:::dataFrameDefault()
    df[1,1] = ArchaeoSRP:::getsiteID(all_files[i])

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
        if( doctypes [j] == 1){df = ArchaeoSRP:::processDocType1(df, stringSplit)}
        if( doctypes [j] == 2){df = ArchaeoSRP:::processDocType2(df, stringSplit)}
        if( doctypes [j] == 3){df = ArchaeoSRP:::processDocType3(df, stringSplit)}
        if( doctypes [j] == 4){df = ArchaeoSRP:::processDocType4(df, stringSplit)}
        if( doctypes [j] == 5){df = ArchaeoSRP:::processDocType5(df, stringSplit)}
        if( doctypes [j] == 6){df = ArchaeoSRP:::processDocType6(df, stringSplit)}
        if( doctypes [j] == 7){df = ArchaeoSRP:::processDocType7(df, stringSplit)}
        if( doctypes [j] == 8){df = ArchaeoSRP:::processDocType8(df, stringSplit)}
        if( doctypes [j] == 9){df = ArchaeoSRP:::processDocType9(df, stringSplit)}
        if( doctypes [j] == 10){df = ArchaeoSRP:::processDocType10(df, stringSplit)}
        if( doctypes [j] == 11){df = ArchaeoSRP:::processDocType11(df, stringSplit)}
        if( doctypes [j] == 12){df = ArchaeoSRP:::processDocType12(df, stringSplit)}
        if( doctypes [j] == 13){df = ArchaeoSRP:::processDocType13(df, stringSplit)}
        if( doctypes [j] == 14){df = ArchaeoSRP:::processDocType14(df, stringSplit)}
        if( doctypes [j] == 15){df = ArchaeoSRP:::processDocType15(df, stringSplit)}
        if( doctypes [j] == 17){df = ArchaeoSRP:::processDocType17(df, stringSplit)}
        if( doctypes [j] == 18){df = ArchaeoSRP:::processDocType18(df, stringSplit)}
        if( doctypes [j] == 19){df = ArchaeoSRP:::processDocType19(df, stringSplit)}
        if( doctypes [j] == 20){df = ArchaeoSRP:::processDocType20(df, stringSplit)}

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
