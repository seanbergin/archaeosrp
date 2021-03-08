# SRP
Site Report Processor

The purpose of this package is to read PDFs with archaeological site report information and return the information in the forms as a dataframe. This information may include things like, site size, location information, periods of use, or types of use. 

The package was developed to read archaeological site reports from the Wenatchee National Forest. SRP uses the OCR engine from Tesseract to transform the PDFs into text. The text is then searched for keywords to locate information which is then saved to the dataframe. 

The forest service has been recording and documenting arhcaeological sites for approximately 100 years. During this time the types of forms used to record information about archaeological sites has changed. To adjust for different types of forms, the package first uses specific keywords and phrases such as the titles on documents to identify a form type. Once the form type has been identified specific keywords are then used to locate and save information. There are 19 different form types. 

# How to Install

To install this package in R you must have the most recent and updated copy of the devtools package. Then, you can install the package directly from github. Then type the following command into R:

install_github("seanbergin/srp")


# How To Use

The package can be used in two main ways. There is one procedure which can use all of the procedures in the package to process site reports. Or, all of the procedures used to locate words in the documents and all of the procedures to process individual types of documents are useable as well. A user may also want to use the procedures in this package to add additional document types. 



