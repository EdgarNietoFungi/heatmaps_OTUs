library(ggplot2)
library(gplots)
library(RColorBrewer)
# Reading data Gurue_2015#
Gurue_2015 <- read.csv("data/Gurue_2015.csv", stringsAsFactors = FALSE, header = TRUE, skip = 1)
#cleaning the data
Gurue_2015 <- Gurue_2015[,1:4]#taking out many columns 
Gurue_2015 <- Gurue_2015 [-c(43),]#taking out columns where there in no values
Gurue_2015[is.na(Gurue_2015)] <- 0#Cconverting NA to 0
#converting to matrix#
matrix.please<-function(M) {
  m<-as.matrix(M[,-1])
  rownames(m)<-M[,1]
  m
}
M <- matrix.please(Gurue_2015)

colfunc <- colorRampPalette(c("green", "red"))
pdf("output/Gurue_2015_OTUs.pdf")
heatmap.2(M,col=colfunc(15), main = "Gurue 2015 OTUs",dendrogram = "none", srtCol=360,  adjCol = c(0.5,0.5), scale="column", trace="none", key = F, denscol="black", cexRow=0.5, cexCol =0.8, margins = c(8,16))
heatmap.2(M,col=colfunc(15), dendrogram = "none", srtCol=360,  adjCol = c(0.5,0.5), scale="column", trace="none", density.info="density",denscol="black", cexRow=0.5, cexCol =0.8, margins = c(8,16))
heatmap.2(M, main = "Gurue 2015 OTUs", col=bluered, dendrogram = "none", srtCol=360,  adjCol = c(0.5,0.5), scale="column", trace="none", key = F, denscol="black", cexRow=0.5, cexCol =0.8, margins = c(8,16))
heatmap.2(M, col=bluered, dendrogram = "none", srtCol=360,  adjCol = c(0.5,0.5),scale="column", trace="none", density.info="density",denscol="black", cexRow=0.5, cexCol =0.8, margins = c(8,16))
dev.off()
