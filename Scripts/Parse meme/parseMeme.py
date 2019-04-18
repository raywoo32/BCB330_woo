# Parse MEME.txt
# WARNING RUNNING EXECUTES
import csv
import re

#Get all lines containing p-value, value, sites, ect. in a raw list
def rawParse(filepath, moduleNum):
    filepath = filepath + str(moduleNum) + "/" + "meme.txt"
    meme = open(filepath)
    split = meme.read().split("\n")
    #motifs raw parse list
    rawParse = []
    #Find the motif id lines
    lineNum = 0
    for line in split:
        if len(split[lineNum]) >= 10:
            if split[lineNum][0:5] == "MOTIF":
                rawParse.append(split[lineNum])
        lineNum = lineNum + 1
    return rawParse
# Example output of these strings in list form 
#'MOTIF CYBYBYCTCYYHC MEME-1\twidth =  13  sites = 3385  llr = 16028  p-value = 1.1e-004  E-value = 1.1e-004',
#'MOTIF TATATA MEME-2\twidth =   6  sites =  92  llr = 619  p-value = 9.8e-001  E-value = 2.7e+000',

#['MOTIF', 'CYBYBYCTCYYHC', 'MEME-1\twidth', '=', '13', 'sites', '=', '3385', 'llr', '=', '16028', 'p-value', '=', '1.1e-004', 'E-value', '=', '1.1e-004']
# Write the raw list to csv files
def writeMeme(rawParseOutput, newFileName):
    with open(newFileName, 'w', newline='') as writer:
        writerModule = csv.writer(writer)
        writerModule.writerow(["motifID", "width", "sites", "llr", "p-value", "E-value"])

        strIndex = 0
        for motif in rawParseOutput:
            split = motif.split(" ")
            spacesRemoved = []
            for item in split:
                if item != "":
                    spacesRemoved.append(item)
            motifParsed = [spacesRemoved[1], spacesRemoved[4], spacesRemoved[7], spacesRemoved[10], spacesRemoved[13], spacesRemoved[16]]
            print(motifParsed)
            writerModule.writerow(motifParsed)

#Run
memeDone = [1, 2, 3, 4, 5, 6, 7, 8, 11]
filepath = "C:/Users/rwoo/Documents/BCB330_Github/results/elegans/meme_results/"
for module in memeDone:
    rawParseOutput = rawParse(filepath, module)
    newFileName = str(module) + ".csv"
    writeMeme(rawParseOutput, newFileName)
    
#moduleNum = 1
#rawParseOutput = rawParse("C:/Users/rwoo/Documents/BCB330_Github/results/elegans/meme_results/", moduleNum)
#writeMeme(rawParseOutput, '1.csv')



        
