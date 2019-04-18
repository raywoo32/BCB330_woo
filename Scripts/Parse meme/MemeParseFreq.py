#This script parses meme.txt files to find the frequencies of all run and
#places them in a csv file 
#WARNING DO NOT RUN SCRIPT UNLESS YOU WANT FILES WRITTEN OVER!

import csv

def allFreq(filepath, moduleNum):
    filepath = filepath + str(moduleNum) + "/" + "meme.txt"
    meme = open(filepath)
    split = meme.read().split("\n")
    #Find the frequency line
    lineNum = 1
    freqFound = False 
    while freqFound == False:
        if split[lineNum] == "Background letter frequencies (from file dataset with add-one prior applied):":
            lineNum = lineNum + 1
            break
        lineNum = lineNum + 1
        
    #all freq is in the format below
    #A 0.326 C 0.174 G 0.174 T 0.326
    AT = float((split[lineNum][2:7]))
    CG = float((split[lineNum][10:15]))
    return [AT, CG]


#Make AT table file
#Make GC table file 
def writeAllFreq():
    memeDone = [1, 2, 3, 4, 5, 6, 7, 8, 11]
    ATmeme = []
    CGmeme = []
    filepath = "C:/Users/rwoo/Documents/BCB330_Github/results/elegans/meme_results/"
    for module in memeDone:
        print(module)
        moduleFreq = allFreq(filepath, module)
        with open('ATfreq.csv', 'a', newline='') as ATwrite:
            writerAT = csv.writer(ATwrite)
            writerAT.writerow([module, moduleFreq[0]])
        with open('CGfreq.csv', 'a', newline='') as CGwrite:
            writerCG = csv.writer(CGwrite)
            writerCG.writerow([module, moduleFreq[1]])

#Run
with open('ATfreq.csv', 'w', newline='') as ATwrite:
    writerAT = csv.writer(ATwrite)
with open('CGfreq.csv', 'w', newline='') as CGwrite:
    writerCG = csv.writer(CGwrite)
writeAllFreq()
