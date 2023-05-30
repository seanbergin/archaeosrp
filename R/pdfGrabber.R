#' A PDF Indexer for a given folder location
#'
#' This function allows you to graball the pdfs in a directory and returns a list.
#' @param directory location of all your pdfs.
#' @keywords files
#' @export
#' @examples
#' pdfGrabber()

pdfGrabber <- function(directory  = ""){
  all_files = list.files(path = directory, all.files = TRUE, full.names = TRUE, pattern = "\\.pdf$")
  return (all_files)
}
