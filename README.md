# ArchaeoSRP
Archaeological Site Record Processor

ArchaeoSRP is an R package whose purpose is to read digital (PDF) archaeological site records and return information in the forms as a dataframe. This information may include things like, site size, location information, periods of use, or types of use. 

The package was developed to read archaeological site records from the Wenatchee National Forest. SRP uses the OCR engine from Tesseract to transform the PDFs into text. The text is then searched for keywords to locate information which is then saved to the dataframe. 

The USDA Forest Service has been documneting and monitoring archaeological sites for decades. During this time the types of forms used to record information about archaeological sites has changed. To adjust for different types of forms, the package first uses specific keywords and phrases such as the titles on documents to identify a form type. Once the form type has been identified specific keywords are then used to locate and save information. There are 21 different form types. 

<a href="https://zenodo.org/badge/latestdoi/343913660"><img src="https://zenodo.org/badge/343913660.svg" alt="DOI"></a>


# How To Install

In order to use this package you must have the R statistical language installed. The most recent copy of R can be downloaded from  https://cran.r-project.org/
To install this package in R you should have the most recent and updated copy of the remotes packages. You must also load this package first. Then, you can install the package directly from github. To install the remotes package you can use the following command:


```shell
install.packages("remotes")
```

Once it is installed you can use this package to install the ArchaeoSRP package from Github:

```shell
library(remotes)
remotes::install_github("seanbergin/archaeosrp")
```

# How To Use

The package can be used in two main ways. The main procedure takes a folder location as an input (where PDFs are stored) and outputs data recorded from the form as a dataframe. It is called processPDFDirectory(directory to pdfs).

Or, all of the procedures used to locate words in the documents and all of the procedures to process individual types of documents are useable as well. A user may also want to use the procedures in this package to add additional document types. 

*Please Note:*   
ArchaeoSRP conducts a large amount of image manipulation and therefore requires a substantial amount of computer resources. Attempting to use this package while conducting other tasks on your computer is not recommended. Also, the package can utilize up to 10Gb of hard drive space while it scans the documents.

# How To Try The Package

The package includes three example site records. The sites are not real but the documents contain information in a manner similar to actual documents. Three PDFs are included and can be processed using the following instructions.

1. Assign the example PDF location to a variable.
```shell
pdflocation <- system.file("extdata", "SamplePDFs", package = "ArchaeoSRP", mustWork = TRUE)
```
2. Use ArchaeSRP to scan the documents and extract information.
```shell
siteDF <- processPDFDirectory(pdflocation)
```

# How to Extend The Package For Your Research

This package was developed for a specific use case, but it was designed to be extensible for the needs of other researchers. To extend the package to the site form types of your region or office, one can add additional site form types to the package. Instrictions on how to add a new site form type can be found here: <https://github.com/seanbergin/archaeosrp/blob/main/How_to_Add_New_Types.md>

Once you have added a new form type we invite you to upload your new site types to this package to aid in its usability for future research.

# Dependencies

This package imports four R packages in order to read archaeological site records:

  Ooms J (2023). _magick: Advanced Graphics and Image-Processing in R_. R package version 2.7.4, <https://CRAN.R-project.org/package=magick>.

  Ooms J (2022). _tesseract: Open Source OCR Engine_. R package version 5.1.0, <https://CRAN.R-project.org/package=tesseract>.

  Ooms J (2023). _pdftools: Text Extraction, Rendering and Converting of PDF Documents_. R package version 3.3.3,
  <https://CRAN.R-project.org/package=pdftools>.
  
  Wickham H (2022). _stringr: Simple, Consistent Wrappers for Common String Operations_. R package version 1.5.0,
  <https://CRAN.R-project.org/package=stringr>.
