# Author: Rachel Woo 
# Purpose: To Parse and Interpret MEME results
# Date: Feb. 2019
# Contact: rachelsam.woo@mail.utoronto.ca

###### 1. INSTALL REQUIRED PACKAGES ######
if (! requireNamespace("readr")) {
  install.packages("readr")
}
if (! requireNamespace("methods")) {
  install.packages("methods")
}
if (! requireNamespace("XML")) {
  install.packages(pkgs="XML")  
}

# TEST
rootDirectory = "C:/Users/rwoo/Documents/BCB330_Github/results/elegans/meme_results"
setwd(rootDirectory)
test1 <-XML::xmlParse (file.path("./1", "meme.xml"))
# Print the result.
print(test1)
# Exract the root node form the xml file.
rootnode <- XML::xmlRoot(test1)
# Find number of nodes in the root.
rootsize <- XML::xmlSize(rootnode)
# Print THE ROOT SIZE
print(rootsize)
# print first node
print(rootnode[1])
# Get the first element of the first node.
print(rootnode[[1]][[1]])
# Convert the input xml file to a data frame.
moduleDF <- XML::xmlToDataFrame(file.path("./1", "meme.xml"))
print(moduleDF)

###### 2. IMPORT DATA IN XLM FORMAT ######
rootDirectory = "C:/Users/rwoo/Desktop/BCB330_Github/results/elegans/meme_results"
setwd(rootDirectory)
moduleList <- list()
for (i in 1:8) {
  subpath = paste(rootDirectory, i, sep="/")
  print(subpath)
  setwd(subpath) # Paste concatenates strings
  moduleDF <- readr::read_tsv(file.path(".", "ame.tsv"),
                              skip = 1, #skip gets rid of header
                              col_names = c("rank",	"motif_DB",	"motif_ID",	
                                            "motif_alt_ID",	"consensus",	"p-value",	
                                            "adj_p-value",	"E-value",	"tests",	
                                            "FASTA_max",	"pos",	"neg",	"PWM_min",	
                                            "TP","	%TP",	"FP",	"%FP")) 
  moduleList[[i]] <- moduleDF
  setwd(rootDirectory)
  getwd()
}

###### CITATIONS ######
# https://www.tutorialspoint.com/r/r_xml_files.htm 
