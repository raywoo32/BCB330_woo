# Author: Rachel Woo 
# Purpose: Get Elegans Help tool 
# Date: Feb. 2019
# Contact: rachelsam.woo@mail.utoronto.ca


###### 1. INSTALL REQUIRED PACKAGES ######


###### 2. IMPORT OMA DATA ######
# OMA database
# https://omabrowser.org/oma/genomePW/
# species 1 = c. elegans, species 2 = c. briggsae 
# Source data ACs 



#' Helper Function to get and filter OMA results
#'
#' @param omaTSV oma results for 2 species as described above
#' @param sp1Name name of species 1 in first column, the one to be converted
#' @param sp2Name name of species 2 in second column, the one you want orthologues for
#'
#' @return dataframe with species 1 id, and species 2 id for 1:1 orthologues
#' @examples getOMA("C:/Users/rwoo/Desktop/orthoREAL.tsv", "elegans", "brig")
#' # A tibble: 11,570 x 2
#' elegans     brig    
#' <chr>       <chr>   
#'   1 Y74C9A.3    CBG03917
#'   2 Y74C9A.2a.2 CBG03916
#'   3 Y74C9A.4b   CBG11880
#'   4 Y74C9A.5.2  CBG03915
#'   5 Y48G1C.12   CBG03913
#'   6 Y48G1C.4a   CBG03912
#'   7 Y48G1C.5    CBG01136
#'   8 Y48G1C.2b.1 CBG03911
#'   9 Y48G1C.10a  CBG03910
#'   10 Y48G1C.9.2  CBG03909
getOMA <- function(omaTSV, sp1Name, sp2Name) {
  oma <- readr::read_tsv(omaTSV,
                         skip = 0, #no header
                         col_names = c(sp1Name, sp2Name, "type", "oma")) 
  # Filter OMA data
  oma <- oma[oma$type == "1:1", c(sp1Name, sp2Name)] #only take 1:1 orthologs
  return(oma)
}

#' Helper function to get Ids to convert into df
#'
#' @param toConvert filepath to a plain text file of ids matching OMA ids for species 1
#' @param sp1Name species name for genes from toConvert
#'
#' @return df with 1 column with genes as data and species name as column name
#' @examples
getToConvert <- function(toConvert, sp1Name) {
  toConvert <- readr::read_tsv(file.path(toConvert),
                                               skip = 0, #skip gets rid of header
                                               col_names = c(sp1Name)) 
  return(toConvert)
}


###### 3. RENAME RULES ######
# WILL NOT BE USEFUL TO OTHERS, CONVERTS NAMES INTO MORE SIMPLE NAMES
# Some ids are matched partially
# eg. AC3.5a.2 == AC3.5
# Rules:
# 1. Only numers allowed after first .
# 2. No second . 
# 3. Names continue until 1 or 2 is violated
renameOMA <- function(oma) {
  for (i in 1:length(rownames(oma))){
    initialName = oma[[i, 1]]
    firstPeriod <- FALSE
    newName = ""
    num = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
    initialName <- strsplit(initialName, "")[[1]]
    for (char in initialName) {
      if (char == "." && firstPeriod == FALSE) {
        firstPeriod <- TRUE
        newName = paste0(newName, char)
        next
      }
      if (firstPeriod == FALSE) {
        newName = paste0(newName, char)
      }
      else { 
        if (char %in% num) {
          newName = paste0(newName, char)
        }
        else{
           break
        }
      }
    }
    oma[[i, 1]] <- newName
  }
  return(oma)
}

# Workflow for my project specifically 
# get OMA and rename
#C:\Users\rwoo\Documents\BCB330_Github\Important Data Files
oma <- getOMA("C:/Users/rwoo/Documents/BCB330_Github/Important Data Files/orthoOMA.tsv", "elegans", "brig")
oma <- renameOMA(oma)
# get modules and write to .txt files
path = "C:/Users/rwoo/Documents/BCB330/330 workflow/Get orthologs/biomart input txt get ortho/"
for (i in 1:14) {
  filepath = paste0(path, toString(i), ".txt")
  mod <- getToConvert(filepath, "elegans")
  merged <- merge(oma, mod)
  orthoList <- merged["brig"]
  outputFileName <- paste0(toString(i), ".txt")
  lapply(orthoList, write, outputFileName, append=TRUE, ncolumns=10000)
}

### GO FROM BRIG TO ELEGANS:
path = "C:/Users/rwoo/Documents/BCB330_Github/Scripts/Get Ortho Scripts/GeneName/"
setwd(path)
for (i in 1:14) {
  filepath = paste0(path, toString(i), ".tsv")
  mod <- getToConvert(filepath, "brig")
  merged <- merge(oma, mod)
  orthoList <- merged["elegans"]
  filepathOutput = paste0(path, toString(i))
  outputFileName <- paste0(filepathOutput, ".txt")
  lapply(orthoList, write, outputFileName, append=TRUE, ncolumns=10000)
}


# AFTER THIS WORMMINE IT
