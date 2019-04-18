# Author: Rachel Woo 
# Purpose: To Format and Display TOMTOM/MEME results
# Date: Mar. 2019
# Contact: rachelsam.woo@mail.utoronto.ca


###### 1. INSTALL REQUIRED PACKAGES ######
if (! requireNamespace("readr")) {
  install.packages("readr")
}
if (! requireNamespace("ggplot2")) {
  install.packages("ggplot2")
}
if (! requireNamespace("rlist")) {
  install.packages(pkgs="rlist")  
}


###### 2. IMPORT TOMTOM DATA INTO DATAFRAMES ######
rootDirectory = "C:/Users/rwoo/Documents/BCB330_Github/results/elegans/meme_results/tomtom"
setwd(rootDirectory)
moduleList <- list()
for (i in 1:14) {
  subpath = paste(rootDirectory, i, sep="/")
  print(subpath)
  setwd(subpath) # Paste concatenates strings
  #Query_ID	Target_ID	Optimal_offset	p-value	E-value	q-value	Overlap	Query_consensus	Target_consensus	Orientation
  moduleDF <- readr::read_tsv(file.path(".", "tomtom.tsv"),
                              skip = 1, #skip gets rid of header
                              col_names = c("Query_ID",	"Target_ID",	"Optimal_offset",	
                                            "p-value",	"	E-value",	"q-value",	
                                            "Overlap",	"Query_consensus",	"Target_consensus",	
                                            "Orientation")) 
  moduleDF <- moduleDF[-seq(nrow(moduleDF), nrow(moduleDF) - 2 ),] #remove last 3 rows 
  moduleList[[i]] <- moduleDF
  setwd(rootDirectory)
}


###### Only keep Q value below 10% ###### 

# Display Results
i = 0
for (module in moduleList) {
  i <- i + 1
  print(i)
  filePath = paste0("C:/Users/rwoo/Desktop/", toString(i), "tomtom.txt")
  matched <- module[module$"q-value" <= 0.1, ]
  print(unique(matched$Query_ID))
  write.csv(matched, filePath)
  #print(matched)
}
# Significant IDs 
# [1] 3
# [1] "CTSCGTCTC"   "GYGGCGAGACC" 
# BOTH 3 are significant and different 
# [1] 4
# [1] "CYTTTATAAYA"         "TTYTHWTTTTTTATWKTTT" "TTTTYTATWTT" "AAATWTTTTTKAAAA"    
# RERUN MAST
# "TTYTHWTTTTTTATWKTTT" is significant 
# [1] 5
# [1] "CNCCCSCCCSCC" "GCTCCGCC"    
# RERUN MAST CNCCSCCCSCC is significant 
# [1] 6
# [1] "TTTTYHTHHWTTTTYTTTTY" "GSGBGBSGSYCKCGCAGCG" 
# Both significant 
# [1] 9
# [1] "CYCCBCCTC"
# Rerun mast, insignificant 
# [1] 10
# [1] "GGRGGGGGGG"
# Significant
# [1] 11
# [1] "CCCCCCCCCCCCC"  "TCAAWTTTGATTTG" "TTTGAAATT"  
# Exclude CCCCCC for obvious reasons 
# TCAAWTTTGATTTG is significant 
# Rerun mast on others 
# [1] 13
# [1] "CTCYGYC"
# Is Significant  

# NOTE: the significance was determined by checking if motif 
# was q <10 and significnatly different from other non-significnat 
# motifs 



###### ANALYSIS 1: Show Number Recognized for each one########
freqList <- list()
for (module in (moduleList)) {
  testTable = data.frame(table(module$Query_ID))
  freqList[[i]] <- testTable
}
View(moduleList[[2]])

for (module in freqList){
  barplot(module$Freq, names = module$var1)
  #barplot(uk2007$Production, names = uk2007$Commodity,
       #   xlab = "Commodity", ylab = "Production (1,000 MT)",
        #  main = "UK 2007 Top 5 Food and Agricultural Commodities")
}

#Q value of 10% needed

