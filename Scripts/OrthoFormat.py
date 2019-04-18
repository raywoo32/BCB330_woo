#Parse and examine brig orthologs

#reformat
def reformat (filepath):
    fasta = open(filepath)
    split = fasta.read().split("\n")

    reformatted = []
    i = 0
    countN = 0
    countSeqUn = 0
    while i < len(split) - 1:
        #Check if sequence is not availalble! 
        if split[i + 1] == "Sequence unavailable":
            i = i + 2
            countSeqUn = countSeqUn + 1 
            continue
        #Make sequence from lines beneath it
        seq = ""
        seqLine = 1
        while ">WBGene" not in split[seqLine]:
            seq = seq + split[i + seqLine]
            seqLine = seqLine + 1
        #Check if seq contains "N"
        if "N" in seq:
            i = i + 5
            countN = countN + 1
            continue
        #Check to make sure is 200 in length 
        if len(seq) != 200:
            i = i + seqLine - 1
            continue
        reformatted.append(split[i])
        reformatted.append(seq)
        i = i + 5
##    output = open("TestWithNoN.txt", "w")
##    for line in reformatted:
##        output.write(line)
##        output.write("\n")
    return reformatted

reformat("C:/Users/rwoo/Documents/BCB330/brig fasta/1.txt")


#Run
def execute():
    root = "C:/Users/rwoo/Desktop/BRIGinput/"
    for item in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]:
        filepath = root + str(item) + ".txt"
        newFileName = str(item) + ".txt"
        reformatted = reformat(filepath)
        output = open(newFileName, "w")
        for line in reformatted:
            output.write(line)
            output.write("\n")

execute()

