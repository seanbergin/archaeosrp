#' Identifies the Document Type
#'
#' This function allows you to identify which document type a pdf is
#' @param fullString  the entire document
#' @keywords identify
#' @export
#' @examples
#' docTypeFinder()

docTypeFinder <- function(fullString){

  value <- NULL
  #check for document 1
  stringTitle = "NOMINATION FORM"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,1)
  }
  #check for document 2
  stringTitle = "Department of the Interior"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,2)
  }
  #check for document 3
  stringTitle = "Cultural Resource Site Report"
  presence = grepl(stringTitle,fullString)
  if(presence){
    stringTitle = "LOCATION DATA"
    presence = grepl(stringTitle,fullString)
    if(presence){
      value <- append(value,3)
    }
  }

  #Since doc types 4 and 5 are so close we can only find one or the other

  #check for document 4 & 5
  stringTitle = "SITE INVENTORY FORM"
  presence = grepl(stringTitle,fullString)
  if(presence){
    stringTitle = "Information for Official Smithsonian Number"
    presence = grepl(stringTitle,fullString)
    if(presence){
      stringTitle = "different from original"
      presence = grepl(stringTitle,fullString)
      if(presence){
        value <- append(value,5)
       } else {value <- append(value,20)}

    }else{
      stringTitle = "WASHINGTON ARCHAEOLOGICAL SITE INVENTORY FORM"
      presence = grepl(stringTitle,fullString)
      if (presence){
        value <- append(value,10)
      }else{
        stringTitle = "YAKIMA RESOURCE MANAGEMENT COOPERATIVE"
        presence = grepl(stringTitle,fullString)
        if (presence){
          value <- append(value,15)
        }else{
          value <- append(value,4)
        }

      }

    }
  }

  #check for document type 6
  stringTitle = "Cultural Resource Isolated Find"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,6)
  }
  #check for document type 7
  stringTitle = "USDA FOREST SERVICE"
  stringTitle2 = "PACIFIC NORTHWEST REGION"
  presence = grepl(stringTitle,fullString)
  presence2 = grepl(stringTitle2,fullString)
  if(presence && presence2){
    value <- append(value,7)
  }

  #check for document type 8
  stringTitle = "CULTURAL RESOURCES SITE REPORT"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,8)
  }

  #check for document type 9
  stringTitle = "TICKLER FORM"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,9)
  }
  #check for document type 9
  stringTitle = "ISOLATE FIND"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,9)
  }

  #check for document type 11, 10 is listed above
  stringTitle = "USDA Forest Service"
  stringTitle2 = "Pacific Northwest Region"
  presence = grepl(stringTitle,fullString)
  presence2 = grepl(stringTitle2,fullString)
  if(presence && presence2){
    value <- append(value,11)
  }

  #check for document type 12
  stringTitle = "Historic Property"
  stringTitle2 = "Historic Name:"
  stringTitle3 = "Common Name:"
  presence = grepl(stringTitle,fullString)
  presence2 = grepl(stringTitle2,fullString)
  presence3 = grepl(stringTitle3,fullString)
  if(presence && presence2 && presence3){
    value <- append(value,12)
  }

  #check for document type 13
  stringTitle = "CULTURAL RESOURCE ISOLATED FIND"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,13)
  }

  stringTitle = "Historic Inventory Report"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,14)
  }

  # 15 is up with type 4

  #check for document type 16 - This type often includes hand written information which may not scan correctly
  stringTitle = "FOREST SERVICE - Region Six"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,16)
  }

  #check for document type 17 - similar to 15 but is for an islated find
  stringTitle = "YAKIMA RESOURCE MANAGEMENT COOPERATIVE"
  presence = grepl(stringTitle,fullString)
  if(presence){
    stringTitle = "ISOLATED FIND INVENTORY"
    presence = grepl(stringTitle,fullString)
    if(presence){
      value <- append(value,17)
    }
  }

  #check for document type 18
  stringTitle = "Cultural Resource Site Update"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,18)
  }

  #check for document type 19 (similar to 5)
   stringTitle = "ARCHAEOLOGICAL SITE UPDATE FORM"
  presence = grepl(stringTitle,fullString)
  if(presence){
    stringTitle =  "STATE OF WASHINGTON"
    presence = grepl(stringTitle,fullString)
    if(presence){
    value <- append(value,19)
    }
  }


  #check for document type 21 (similar to 5) but is for Isolates instead of sites
  stringTitle = "ARCHAEOLOGICAL ISOLATE INVENTORY FORM"
  presence = grepl(stringTitle,fullString)
  if(presence){
    stringTitle =  "STATE OF WASHINGTON"
    presence = grepl(stringTitle,fullString)
    if(presence){
      value <- append(value,21)
    }
  }

  return(value)

}
