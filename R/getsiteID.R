#' returns the filename of each file
#'
#' This function allows you to grab the name of a site from the file
#' @param siteString the location path of the pdf
#' @keywords site name
#' @export
#' @examples
#' getsiteID()

getsiteID <- function (siteString) {
  site.name = strsplit(siteString,"/")
  site.name = unlist(site.name)
  name.size = length(site.name)
  site = site.name[name.size]
  site2 = tools::file_path_sans_ext(site)
  site2 = toString(site2)
  return(site2)
}