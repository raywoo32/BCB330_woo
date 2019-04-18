#### INTERPRET AME BRIG and AME elegans which coresponds to brig
#### RACHEL WOO 
#projectSpecific
#specificWorkingEnvironment

#### INITIALIZE EMPTY DF 
compareAme <- data.frame(matrix(0, nrow = 14, ncol = 3)) #Initialize at 0
rowNames <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14") 
rownames(compareAme) <- rowNames
colNames <- c("Number of Genes in Module", "Elegans", "Brig")
colnames(compareAme) <- colNames


#### LOAD FRAME
# Didn't bother to parse data since most were empty, loaded the frame by row 
# where the value inside is the number of enriched motifs found 
compareAme[1,] <- c(333, 0, 0)
compareAme[2,] <- c(193, 0, 3)
compareAme[3,] <- c(1043, 21, 22)
compareAme[4,] <- c(35, 0, 4)
compareAme[5,] <- c(572, 5, 8)
compareAme[6,] <- c(41, 0, 1)
compareAme[7,] <- c(420, 4, 1)
compareAme[8,] <- c(345, 0, 0)
compareAme[9,] <- c(185, 0, 0)
compareAme[10,] <- c(117, 1, 3)
compareAme[11,] <- c(122, 1, 3)
compareAme[12,] <- c(712, 11, 12)
compareAme[13,] <- c(338, 3, 0)
compareAme[14,] <- c(320, 0, 0)

#### PLOT RESULTS
x <- compareAme[,1]
y <- compareAme[,2]
z <- compareAme[,3]
# Main plot 
plot(x, y, xlab = "Numer of Genes in Module", ylab="Number of Enriched Motifs", col="purple", pch=1)
points(x, z, col="orange", pch=2) # Brig 
# Add fit lines
abline(lm(y~x), col="purple") # Regression line
abline(lm(z~x), col="orange")
# ELEGANS TRENDLINE
coef(lm(y~x))
#(Intercept)           x 
#-3.35750494  0.01947342 

# BRIG TRENDLINE
coef(lm(z~x))
# (Intercept)           x 
#-2.1305138   0.0181799 

#### EXPORT PLOT 
setwd("C:/Users/rwoo/Desktop")
jpeg("GenesVSSize.jpg", width = 500, height = 500)
plot(x, y, xlab = "Numer of Genes in Module", ylab="Number of Enriched Motifs", col="purple", pch=1)
points(x, z, col="orange", pch=2) # Brig 
# Add fit lines
abline(lm(y~x), col="purple") # Regression line
abline(lm(z~x), col="orange")
legend("topleft", pch=c(1,2), col=c("purple", "orange"), c("Elegans", "Briggsae"), bty="o", cex=.8, box.col="black")
with(compareAme[1:14,], text(sr~dpi, labels = row.names(compareAme, pos = 4)))
dev.off()

#### EXPORT BRIG PLOT ONLY
setwd("C:/Users/rwoo/Desktop")
jpeg("BrigAme.jpg", width = 500, height = 500)
plot(x, z, xlab = "Numer of Genes in Module", ylab="Number of Enriched Motifs", col="orange", pch=2)
# Add fit lines
abline(lm(z~x), col="orange")
text(x, z, labels=rownames(compareAme), cex= 0.5, pos=3)
dev.off()

### EXPORT AME PLOT ONLY 
setwd("C:/Users/rwoo/Desktop")
jpeg("EletobrigAme.jpg", width = 500, height = 500)
plot(x, y, xlab = "Numer of Genes in Module", ylab="Number of Enriched Motifs", col="purple", pch=1)
# Add fit lines
abline(lm(y~x), col="purple")
text(x, y, labels=rownames(compareAme), cex= 0.5, pos=3)
dev.off()



