# How to add new types of archaeological site records

The ArchaeoSRP package is designed to record information from scanned copies of archaeological site reports. In order to accomplish this, the program must be able to identify where the information you wish to record is located on a form. For example, the age of a site might be referred to as “age” on one form type, “period” on a second and “date" on a third. In order to record the correct information various types are recorded so that the package can record the correct information. In order to identify a type, something unique about a type must be identified. Often unique types have unique headers. As the use of this tool increases it will be necessary for users to add new document types that were not recorded in our initial analysis.

The package works in the following order, a pdf is converted to text, the document type is identified and then the text is recorded based on the document type.

#Step 1

Frist the new document type must be added to docTypeFinder.R The document type is identified by the presence of a string – usually a header unique to the document. The numerical value of the type is recorded if the string is present. To add a new type, one should add 

```shell
  stringTitle = "UNIQUE HEADER"
  presence = grepl(stringTitle,fullString)
  if(presence){
    value <- append(value,NUMBER ASSOCIATED WITH NEW TYPE)
  }
```

#Step 2

Next, you must modify processPDFDirectory.R   Here, the individual document types are processed based on the new type number. New types should be added by including code similar to this but with your document type number instead of 20:

```shell
if( doctypes [j] == 20){df = processDocType20(df, stringSplit)}

if( doctypes [j] == ##){df = processDocType##(df, stringSplit)}

```
#Step 3

Finally, one must add the r script that will record information from your new type. For consistency, the script should be named processDocType## and ## should be your new document type. To get a clear picture of this should be formatted, we suggest that you modify an existing document type script. In general the scripts contain a function of the same name as.the script that takes a dataframe and the list of words scanned from your pdf. It should return a dataframe as well. The dataframes are created using dataFrameDefault.R In the processDocType## function, information can then be saved to the dataframe using its existing column names (found in dataFrameDefault.R). The existing procesDocType scripts provide a number of examples on ways to record information from the scanned text.

```shell
processDocType15 <- function(df,stringList){

  df$Zone.UTM <- wordFinder(stringList, "zone")
  df$E.UTM <- phraseFinder(stringList, "easting", "northing")
  df$N.UTM <- phraseFinder(stringList, "northing", "*usgs")
  .....

  return(df)
}
```

