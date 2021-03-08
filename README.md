# SRP
Site Report Processor

The purpose of this package is to read PDFs with archaeological site report information and return the information on the forms as a dataframe.

The package was developed to read archaeological site reports from the Wenatchee National Forest. The package uses the OCR engine from Tesseract to transform the PDFs into text. The text is then searched for keywords to locate information which is then saved to the dataframe. 

The forest service has been recording and documenting arhcaeological sites for approximately 100 years. During this time the types of forms used to record information about archaeological sites has changed. To adjust for different types of forms, the package first uses specific keywords and the titles on documents to identify a form type. Once the form type has been identified specific keywords are then used to locate and save information. There are 19 different form types. 

# How To Use

The package can be used in two main ways. 


# How to Install

To install this package in R you must have the most recent and updated copy of devtools. 
