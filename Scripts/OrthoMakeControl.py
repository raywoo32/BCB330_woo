#Make ortholog controls without duplicates!

#Make files with dups then get rid of later 
filenames = ["1.txt", "2.txt", "3.txt", "4.txt", "5.txt", "6.txt", "7.txt", "8.txt", "9.txt", "10.txt", "11.txt", "12.txt", "13.txt", "14.txt"]
fileInts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
for file in fileInts:
    root = "C:/Users/rwoo/Desktop/cleanedBrig/"
    controlName = root + str(file) + "control.txt"
    with open(controlName, 'w') as outfile:
        for fname in filenames:
            if fname == str(file) + ".txt":
                print(file)
                continue
            with open(root + fname) as infile:
                for line in infile:
                    outfile.write(line)

#Get rid of duplicates
for file in fileInts:
    lines_seen = set() # holds lines already seen
    outfilename = root + str(file) + "control2.txt"
    outfile = open(outfilename, "w")
    infilename = root + str(file) + "control.txt"
    for line in open(infilename, "r"):
        if line not in lines_seen: # not a duplicate
            outfile.write(line)
            lines_seen.add(line)
    outfile.close()

### Programming Citations
# https://stackoverflow.com/questions/13613336/python-concatenate-text-files
# https://stackoverflow.com/questions/1215208/how-might-i-remove-duplicate-lines-from-a-file
