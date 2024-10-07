# load libraries
library(ggplot2)
library(ggpubr)
# install.packages("officer")
library(officer)
install.packages("dplyr")
library(dplyr)


# location of data
setwd("/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/tsv_tables/")
dir <- "/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/tsv_tables/"
list.files(dir)

# read a table
XPyTa_F1_1_1I_Image7 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_1I_Image7_nej.tsv", sep = "\t")
XPyTa_F1_1_2I_Image35 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_2I_Image35_nej.tsv", sep = "\t")
XPyTa_F1_1_3I_Image22 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_3I_Image22_nej.tsv", sep = "\t")
XPyTa_F1_1_4I_Image39 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_4I_Image39.tsv", sep = "\t")
XPyTa_F1_1_6I_Image8 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_6I_Image8.tsv", sep = "\t")
XPyTa_F1_1_7I_Image26 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_7I_Image26.tsv", sep = "\t")
XPyTa_F1_1_8I_Image26 <- read.table("pygmaeus_chr_length_XPyTa_F1-1_8I_Image26.tsv", sep = "\t")
XPYTaF1_15_1_Image3 <- read.table("pygmaeus_chr_length_XPYTaF1-15-1_Image3.tsv", sep = "\t")
XPYTaF1_15_1_Image5 <- read.table("pygmaeus_chr_length_XPYTaF1-15-1_Image5.tsv", sep = "\t")
XPYTaF1_15_1_Image8 <- read.table("pygmaeus_chr_length_XPYTaF1-15-1_Image8.tsv", sep = "\t")
XPYTaF1_15_1_Image13 <- read.table("pygmaeus_chr_length_XPYTaF1-15-1_Image13.tsv", sep = "\t")

# label columns
for (x in 1:11) {
  cat(paste0('colnames() <- c("line_number", ','"chromosome", ', '"p_', x, '", ', '"q_', x, '", ', '"relative_length_',x, '", ', '"r1_', x, '")', "\n"))
}

colnames(XPyTa_F1_1_1I_Image7) <- c("line_number", "chromosome", "p_1", "q_1", "relative_length_1","r1_1")
colnames(XPyTa_F1_1_2I_Image35) <- c("line_number", "chromosome", "p_2", "q_2", "relative_length_2","r1_2")
colnames(XPyTa_F1_1_3I_Image22) <- c("line_number", "chromosome", "p_3", "q_3", "relative_length_3","r1_3")
colnames(XPyTa_F1_1_4I_Image39) <- c("line_number", "chromosome", "p_4", "q_4", "relative_length_4","r1_4")
colnames(XPyTa_F1_1_6I_Image8) <- c("line_number", "chromosome", "p_5", "q_5", "relative_length_5","r1_5")
colnames(XPyTa_F1_1_7I_Image26) <- c("line_number", "chromosome", "p_6", "q_6", "relative_length_6","r1_6")
colnames(XPyTa_F1_1_8I_Image26) <- c("line_number", "chromosome", "p_7", "q_7", "relative_length_7","r1_7")
colnames(XPYTaF1_15_1_Image3) <- c("line_number", "chromosome", "p_8", "q_8", "relative_length_8","r1_8")
colnames(XPYTaF1_15_1_Image5) <- c("line_number", "chromosome", "p_9", "q_9", "relative_length_9","r1_9")
colnames(XPYTaF1_15_1_Image8) <- c("line_number", "chromosome", "p_10", "q_10", "relative_length_10","r1_10")
colnames(XPYTaF1_15_1_Image13) <- c("line_number", "chromosome", "p_11", "q_11", "relative_length_11","r1_11")

# delete the first row
XPyTa_F1_1_1I_Image7 <- XPyTa_F1_1_1I_Image7[2:37,]
XPyTa_F1_1_2I_Image35 <- XPyTa_F1_1_2I_Image35[2:37,]
XPyTa_F1_1_3I_Image22 <- XPyTa_F1_1_3I_Image22[2:37,]
XPyTa_F1_1_4I_Image39 <- XPyTa_F1_1_4I_Image39[2:37,]
XPyTa_F1_1_6I_Image8 <- XPyTa_F1_1_6I_Image8[2:37,]
XPyTa_F1_1_7I_Image26 <- XPyTa_F1_1_7I_Image26[2:37,]
XPyTa_F1_1_8I_Image26 <- XPyTa_F1_1_8I_Image26[2:37,]
XPYTaF1_15_1_Image3 <- XPYTaF1_15_1_Image3[2:37,]
XPYTaF1_15_1_Image5 <- XPYTaF1_15_1_Image5[2:37,]
XPYTaF1_15_1_Image8 <- XPYTaF1_15_1_Image8[2:37,]
XPYTaF1_15_1_Image13 <- XPYTaF1_15_1_Image13[2:37,]

# change character vector to numeric
for (x in 1:length(XPyTa_F1_1_1I_Image7)) {
  XPyTa_F1_1_1I_Image7[[x]] <- as.numeric(XPyTa_F1_1_1I_Image7[[x]])
}
for (x in 1:length(XPyTa_F1_1_2I_Image35)) {
  XPyTa_F1_1_2I_Image35[[x]] <- as.numeric(XPyTa_F1_1_2I_Image35[[x]])
}
for (x in 1:length(XPyTa_F1_1_3I_Image22)) {
  XPyTa_F1_1_3I_Image22[[x]] <- as.numeric(XPyTa_F1_1_3I_Image22[[x]])
}
for (x in 1:length(XPyTa_F1_1_4I_Image39)) {
  XPyTa_F1_1_4I_Image39[[x]] <- as.numeric(XPyTa_F1_1_4I_Image39[[x]])
}
for (x in 1:length(XPyTa_F1_1_6I_Image8)) {
  XPyTa_F1_1_6I_Image8[[x]] <- as.numeric(XPyTa_F1_1_6I_Image8[[x]])
}
for (x in 1:length(XPyTa_F1_1_7I_Image26)) {
  XPyTa_F1_1_7I_Image26[[x]] <- as.numeric(XPyTa_F1_1_7I_Image26[[x]])
}
for (x in 1:length(XPyTa_F1_1_8I_Image26)) {
  XPyTa_F1_1_8I_Image26[[x]] <- as.numeric(XPyTa_F1_1_8I_Image26[[x]])
}
for (x in 1:length(XPYTaF1_15_1_Image3)) {
  XPYTaF1_15_1_Image3[[x]] <- as.numeric(XPYTaF1_15_1_Image3[[x]])
}
for (x in 1:length(XPYTaF1_15_1_Image5)) {
  XPYTaF1_15_1_Image5[[x]] <- as.numeric(XPYTaF1_15_1_Image5[[x]])
}
for (x in 1:length(XPYTaF1_15_1_Image8)) {
  XPYTaF1_15_1_Image8[[x]] <- as.numeric(XPYTaF1_15_1_Image8[[x]])
}
for (x in 1:length(XPYTaF1_15_1_Image13)) {
  XPYTaF1_15_1_Image13[[x]] <- as.numeric(XPYTaF1_15_1_Image13[[x]])
}

# because of warning message "NAs introduced by coercion" the chromosome column with NA values must be replaced by character vector
chromosome <- c("1L", "1S", "2L", "2S", "3L", "3S", "4L", "4S", "5L", "5S", "6L", "6S", "7L", "7S", "8L", "8S", "9_10L", "9_10S")
chromosome <- rep(chromosome, each=2)
XPyTa_F1_1_1I_Image7$chromosome <- chromosome
XPyTa_F1_1_2I_Image35$chromosome <- chromosome
XPyTa_F1_1_3I_Image22$chromosome <- chromosome
XPyTa_F1_1_4I_Image39$chromosome <- chromosome
XPyTa_F1_1_6I_Image8$chromosome <- chromosome
XPyTa_F1_1_7I_Image26$chromosome <- chromosome
XPyTa_F1_1_8I_Image26$chromosome <- chromosome
XPYTaF1_15_1_Image3$chromosome <- chromosome
XPYTaF1_15_1_Image5$chromosome <- chromosome
XPYTaF1_15_1_Image8$chromosome <- chromosome
XPYTaF1_15_1_Image13$chromosome <- chromosome

# check the type of a vector
typeof(XPyTa_F1_1_1I_Image7$p_1) # double vector is good
typeof(chromosome) # character vector

# calculation of the l_percentage, r2, i
metaphases <- c("XPyTa_F1_1_1I_Image7", "XPyTa_F1_1_2I_Image35", "XPyTa_F1_1_3I_Image22", "XPyTa_F1_1_4I_Image39", "XPyTa_F1_1_6I_Image8", "XPyTa_F1_1_7I_Image26", "XPyTa_F1_1_8I_Image26", "XPYTaF1_15_1_Image3", "XPYTaF1_15_1_Image5", "XPYTaF1_15_1_Image8", "XPYTaF1_15_1_Image13")
for (x in 1:length(metaphases)) {
    cat(paste0(metaphases[x],'$l_percentage_', x, ' <- (', metaphases[x], '$relative_length_', x, '*100)/sum(', metaphases[x], '$relative_length_', x, ')', "\n"))
  }

XPyTa_F1_1_1I_Image7$l_percentage_1 <- (XPyTa_F1_1_1I_Image7$relative_length_1*100)/sum(XPyTa_F1_1_1I_Image7$relative_length_1)
XPyTa_F1_1_2I_Image35$l_percentage_2 <- (XPyTa_F1_1_2I_Image35$relative_length_2*100)/sum(XPyTa_F1_1_2I_Image35$relative_length_2)
XPyTa_F1_1_3I_Image22$l_percentage_3 <- (XPyTa_F1_1_3I_Image22$relative_length_3*100)/sum(XPyTa_F1_1_3I_Image22$relative_length_3)
XPyTa_F1_1_4I_Image39$l_percentage_4 <- (XPyTa_F1_1_4I_Image39$relative_length_4*100)/sum(XPyTa_F1_1_4I_Image39$relative_length_4)
XPyTa_F1_1_6I_Image8$l_percentage_5 <- (XPyTa_F1_1_6I_Image8$relative_length_5*100)/sum(XPyTa_F1_1_6I_Image8$relative_length_5)
XPyTa_F1_1_7I_Image26$l_percentage_6 <- (XPyTa_F1_1_7I_Image26$relative_length_6*100)/sum(XPyTa_F1_1_7I_Image26$relative_length_6)
XPyTa_F1_1_8I_Image26$l_percentage_7 <- (XPyTa_F1_1_8I_Image26$relative_length_7*100)/sum(XPyTa_F1_1_8I_Image26$relative_length_7)
XPYTaF1_15_1_Image3$l_percentage_8 <- (XPYTaF1_15_1_Image3$relative_length_8*100)/sum(XPYTaF1_15_1_Image3$relative_length_8)
XPYTaF1_15_1_Image5$l_percentage_9 <- (XPYTaF1_15_1_Image5$relative_length_9*100)/sum(XPYTaF1_15_1_Image5$relative_length_9)
XPYTaF1_15_1_Image8$l_percentage_10 <- (XPYTaF1_15_1_Image8$relative_length_10*100)/sum(XPYTaF1_15_1_Image8$relative_length_10)
XPYTaF1_15_1_Image13$l_percentage_11 <- (XPYTaF1_15_1_Image13$relative_length_11*100)/sum(XPYTaF1_15_1_Image13$relative_length_11)

for (x in 1:length(metaphases)) {
  cat(paste0(metaphases[x],'$r2_', x, ' <- (', metaphases[x], '$q_', x, '/', metaphases[x], '$p_', x, ')', "\n"))
}

XPyTa_F1_1_1I_Image7$r2_1 <- (XPyTa_F1_1_1I_Image7$q_1/XPyTa_F1_1_1I_Image7$p_1)
XPyTa_F1_1_2I_Image35$r2_2 <- (XPyTa_F1_1_2I_Image35$q_2/XPyTa_F1_1_2I_Image35$p_2)
XPyTa_F1_1_3I_Image22$r2_3 <- (XPyTa_F1_1_3I_Image22$q_3/XPyTa_F1_1_3I_Image22$p_3)
XPyTa_F1_1_4I_Image39$r2_4 <- (XPyTa_F1_1_4I_Image39$q_4/XPyTa_F1_1_4I_Image39$p_4)
XPyTa_F1_1_6I_Image8$r2_5 <- (XPyTa_F1_1_6I_Image8$q_5/XPyTa_F1_1_6I_Image8$p_5)
XPyTa_F1_1_7I_Image26$r2_6 <- (XPyTa_F1_1_7I_Image26$q_6/XPyTa_F1_1_7I_Image26$p_6)
XPyTa_F1_1_8I_Image26$r2_7 <- (XPyTa_F1_1_8I_Image26$q_7/XPyTa_F1_1_8I_Image26$p_7)
XPYTaF1_15_1_Image3$r2_8 <- (XPYTaF1_15_1_Image3$q_8/XPYTaF1_15_1_Image3$p_8)
XPYTaF1_15_1_Image5$r2_9 <- (XPYTaF1_15_1_Image5$q_9/XPYTaF1_15_1_Image5$p_9)
XPYTaF1_15_1_Image8$r2_10 <- (XPYTaF1_15_1_Image8$q_10/XPYTaF1_15_1_Image8$p_10)
XPYTaF1_15_1_Image13$r2_11 <- (XPYTaF1_15_1_Image13$q_11/XPYTaF1_15_1_Image13$p_11)

for (x in 1:length(metaphases)) {
  cat(paste0(metaphases[x],'$i_', x, ' <- 100/(', metaphases[x], '$r2_', x, '+1', ')', "\n"))
}

XPyTa_F1_1_1I_Image7$i_1 <- 100/(XPyTa_F1_1_1I_Image7$r2_1+1)
XPyTa_F1_1_2I_Image35$i_2 <- 100/(XPyTa_F1_1_2I_Image35$r2_2+1)
XPyTa_F1_1_3I_Image22$i_3 <- 100/(XPyTa_F1_1_3I_Image22$r2_3+1)
XPyTa_F1_1_4I_Image39$i_4 <- 100/(XPyTa_F1_1_4I_Image39$r2_4+1)
XPyTa_F1_1_6I_Image8$i_5 <- 100/(XPyTa_F1_1_6I_Image8$r2_5+1)
XPyTa_F1_1_7I_Image26$i_6 <- 100/(XPyTa_F1_1_7I_Image26$r2_6+1)
XPyTa_F1_1_8I_Image26$i_7 <- 100/(XPyTa_F1_1_8I_Image26$r2_7+1)
XPYTaF1_15_1_Image3$i_8 <- 100/(XPYTaF1_15_1_Image3$r2_8+1)
XPYTaF1_15_1_Image5$i_9 <- 100/(XPYTaF1_15_1_Image5$r2_9+1)
XPYTaF1_15_1_Image8$i_10 <- 100/(XPYTaF1_15_1_Image8$r2_10+1)
XPYTaF1_15_1_Image13$i_11 <- 100/(XPYTaF1_15_1_Image13$r2_11+1)

# Function for dissection of "l_percentage" values for each haploid chromosome
Select_chrome <- function(i,j) {chromosome <- 
  c(XPyTa_F1_1_1I_Image7$l_percentage_1[i:j],
    XPyTa_F1_1_2I_Image35$l_percentage_2[i:j],
    XPyTa_F1_1_3I_Image22$l_percentage_3[i:j],
    XPyTa_F1_1_4I_Image39$l_percentage_4[i:j],
    XPyTa_F1_1_6I_Image8$l_percentage_5[i:j],
    XPyTa_F1_1_7I_Image26$l_percentage_6[i:j],
    XPyTa_F1_1_8I_Image26$l_percentage_7[i:j],
    XPYTaF1_15_1_Image3$l_percentage_8[i:j],
    XPYTaF1_15_1_Image5$l_percentage_9[i:j],
    XPYTaF1_15_1_Image8$l_percentage_10[i:j],
    XPYTaF1_15_1_Image13$l_percentage_11[i:j])
}

l_percentage_dissected=data.frame(l_chromosome1L=l_chromosome1L <- Select_chrome(1,2))
l_percentage_dissected$l_chromosome1S <- Select_chrome(3,4)
l_percentage_dissected$l_chromosome2L <- Select_chrome(5,6)
l_percentage_dissected$l_chromosome2S <- Select_chrome(7,8)
l_percentage_dissected$l_chromosome3L <- Select_chrome(9,10)
l_percentage_dissected$l_chromosome3S <- Select_chrome(11,12)
l_percentage_dissected$l_chromosome4L <- Select_chrome(13,14)
l_percentage_dissected$l_chromosome4S <- Select_chrome(15,16)
l_percentage_dissected$l_chromosome5L <- Select_chrome(17,18)
l_percentage_dissected$l_chromosome5S <- Select_chrome(19,20)
l_percentage_dissected$l_chromosome6L <- Select_chrome(21,22)
l_percentage_dissected$l_chromosome6S <- Select_chrome(23,24)
l_percentage_dissected$l_chromosome7L <- Select_chrome(25,26)
l_percentage_dissected$l_chromosome7S <- Select_chrome(27,28)
l_percentage_dissected$l_chromosome8L <- Select_chrome(29,30)
l_percentage_dissected$l_chromosome8S <- Select_chrome(31,32)
l_percentage_dissected$l_chromosome9_10L <- Select_chrome(33,34)
l_percentage_dissected$l_chromosome9_10S <- Select_chrome(35,36)

# Function for dissection of "i" values for each haploid chromosome
Select_chromeII <- function(i,j) {chromosome <- 
  c(XPyTa_F1_1_1I_Image7$i_1[i:j],
    XPyTa_F1_1_2I_Image35$i_2[i:j],
    XPyTa_F1_1_3I_Image22$i_3[i:j],
    XPyTa_F1_1_4I_Image39$i_4[i:j],
    XPyTa_F1_1_6I_Image8$i_5[i:j],
    XPyTa_F1_1_7I_Image26$i_6[i:j],
    XPyTa_F1_1_8I_Image26$i_7[i:j],
    XPYTaF1_15_1_Image3$i_8[i:j],
    XPYTaF1_15_1_Image5$i_9[i:j],
    XPYTaF1_15_1_Image8$i_10[i:j],
    XPYTaF1_15_1_Image13$i_11[i:j])
}

i_dissected=data.frame(i_chromosome1L=i_chromosome1L <- Select_chromeII(1,2))
i_dissected$i_chromosome1S <- Select_chromeII(3,4)
i_dissected$i_chromosome2L <- Select_chromeII(5,6)
i_dissected$i_chromosome2S <- Select_chromeII(7,8)
i_dissected$i_chromosome3L <- Select_chromeII(9,10)
i_dissected$i_chromosome3S <- Select_chromeII(11,12)
i_dissected$i_chromosome4L <- Select_chromeII(13,14)
i_dissected$i_chromosome4S <- Select_chromeII(15,16)
i_dissected$i_chromosome5L <- Select_chromeII(17,18)
i_dissected$i_chromosome5S <- Select_chromeII(19,20)
i_dissected$i_chromosome6L <- Select_chromeII(21,22)
i_dissected$i_chromosome6S <- Select_chromeII(23,24)
i_dissected$i_chromosome7L <- Select_chromeII(25,26)
i_dissected$i_chromosome7S <- Select_chromeII(27,28)
i_dissected$i_chromosome8L <- Select_chromeII(29,30)
i_dissected$i_chromosome8S <- Select_chromeII(31,32)
i_dissected$i_chromosome9_10L <- Select_chromeII(33,34)
i_dissected$i_chromosome9_10S <- Select_chromeII(35,36)

# Function for dissection of "r" values for each haploid chromosome
Select_chromeIII <- function(i,j) {chromosome <- 
  c(XPyTa_F1_1_1I_Image7$r1_1[i:j],
    XPyTa_F1_1_2I_Image35$r1_2[i:j],
    XPyTa_F1_1_3I_Image22$r1_3[i:j],
    XPyTa_F1_1_4I_Image39$r1_4[i:j],
    XPyTa_F1_1_6I_Image8$r1_5[i:j],
    XPyTa_F1_1_7I_Image26$r1_6[i:j],
    XPyTa_F1_1_8I_Image26$r1_7[i:j],
    XPYTaF1_15_1_Image3$r1_8[i:j],
    XPYTaF1_15_1_Image5$r1_9[i:j],
    XPYTaF1_15_1_Image8$r1_10[i:j],
    XPYTaF1_15_1_Image13$r1_11[i:j])
}

r1_dissected=data.frame(r1_chromosome1L=r1_chromosome1L <- Select_chromeIII(1,2))
r1_dissected$r1_chromosome1S <- Select_chromeIII(3,4)
r1_dissected$r1_chromosome2L <- Select_chromeIII(5,6)
r1_dissected$r1_chromosome2S <- Select_chromeIII(7,8)
r1_dissected$r1_chromosome3L <- Select_chromeIII(9,10)
r1_dissected$r1_chromosome3S <- Select_chromeIII(11,12)
r1_dissected$r1_chromosome4L <- Select_chromeIII(13,14)
r1_dissected$r1_chromosome4S <- Select_chromeIII(15,16)
r1_dissected$r1_chromosome5L <- Select_chromeIII(17,18)
r1_dissected$r1_chromosome5S <- Select_chromeIII(19,20)
r1_dissected$r1_chromosome6L <- Select_chromeIII(21,22)
r1_dissected$r1_chromosome6S <- Select_chromeIII(23,24)
r1_dissected$r1_chromosome7L <- Select_chromeIII(25,26)
r1_dissected$r1_chromosome7S <- Select_chromeIII(27,28)
r1_dissected$r1_chromosome8L <- Select_chromeIII(29,30)
r1_dissected$r1_chromosome8S <- Select_chromeIII(31,32)
r1_dissected$r1_chromosome9_10L <- Select_chromeIII(33,34)
r1_dissected$r1_chromosome9_10S <- Select_chromeIII(35,36)

# calculation of median of l, r1, and i for each chromosome
median_l <- c(median(l_percentage_dissected$l_chromosome1L),
              median(l_percentage_dissected$l_chromosome1S),
              median(l_percentage_dissected$l_chromosome2L),
              median(l_percentage_dissected$l_chromosome2S),
              median(l_percentage_dissected$l_chromosome3L),
              median(l_percentage_dissected$l_chromosome3S),
              median(l_percentage_dissected$l_chromosome4L),
              median(l_percentage_dissected$l_chromosome4S),
              median(l_percentage_dissected$l_chromosome5L),
              median(l_percentage_dissected$l_chromosome5S),
              median(l_percentage_dissected$l_chromosome6L),
              median(l_percentage_dissected$l_chromosome6S),
              median(l_percentage_dissected$l_chromosome7L),
              median(l_percentage_dissected$l_chromosome7S),
              median(l_percentage_dissected$l_chromosome8L),
              median(l_percentage_dissected$l_chromosome8S),
              median(l_percentage_dissected$l_chromosome9_10L),
              median(l_percentage_dissected$l_chromosome9_10S))

median_i <- c(median(i_dissected$i_chromosome1L),
              median(i_dissected$i_chromosome1S),
              median(i_dissected$i_chromosome2L),
              median(i_dissected$i_chromosome2S),
              median(i_dissected$i_chromosome3L),
              median(i_dissected$i_chromosome3S),
              median(i_dissected$i_chromosome4L),
              median(i_dissected$i_chromosome4S),
              median(i_dissected$i_chromosome5L),
              median(i_dissected$i_chromosome5S),
              median(i_dissected$i_chromosome6L),
              median(i_dissected$i_chromosome6S),
              median(i_dissected$i_chromosome7L),
              median(i_dissected$i_chromosome7S),
              median(i_dissected$i_chromosome8L),
              median(i_dissected$i_chromosome8S),
              median(i_dissected$i_chromosome9_10L),
              median(i_dissected$i_chromosome9_10S))

median_r1 <- c(median(r1_dissected$r1_chromosome1L),
              median(r1_dissected$r1_chromosome1S),
              median(r1_dissected$r1_chromosome2L),
              median(r1_dissected$r1_chromosome2S),
              median(r1_dissected$r1_chromosome3L),
              median(r1_dissected$r1_chromosome3S),
              median(r1_dissected$r1_chromosome4L),
              median(r1_dissected$r1_chromosome4S),
              median(r1_dissected$r1_chromosome5L),
              median(r1_dissected$r1_chromosome5S),
              median(r1_dissected$r1_chromosome6L),
              median(r1_dissected$r1_chromosome6S),
              median(r1_dissected$r1_chromosome7L),
              median(r1_dissected$r1_chromosome7S),
              median(r1_dissected$r1_chromosome8L),
              median(r1_dissected$r1_chromosome8S),
              median(r1_dissected$r1_chromosome9_10L),
              median(r1_dissected$r1_chromosome9_10S))

# rounding values to 2 decimal places
median_l <-  round(median_l, 2)
median_i <-  round(median_i, 2)
median_r1 <-  round(median_r1, 2)

# chromosome vector modify as a vector with 18 haploid chromosomes
chromosome <- c("1L", "1S", "2L", "2S", "3L", "3S", "4L", "4S", "5L", "5S", "6L", "6S", "7L", "7S", "8L", "8S", "9_10L", "9_10S")

# final table for plots including chromosome categories
final_table <- data.frame(chromosome=chromosome, median_l=median_l, median_r1=median_r1, median_i=median_i)
for(i in 1:18) {
  if(final_table$median_i[i]>=37.5) {final_table$category[i] = "m"} 
  else if (final_table$median_i[i]>=25 & final_table$median_i[i]<37.5){final_table$category[i] = "sm"} 
  else if (final_table$median_i[i]>=12.5 & final_table$median_i[i]<25){final_table$category[i] = "st"} 
  else if (final_table$median_i[i]>0 & final_table$median_i[i]<12.5) {final_table$category[i] = "a"} 
  else {final_table$category[i] = "T"}
}

# export final table as txt
write.table(final_table, file = '/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/xpy_final_table.txt', 
            col.names = TRUE,
            row.names = FALSE, sep = "\t")

# export table as a word (docx)
# Create a Word document and add the table
doc <- read_docx()
doc <- body_add_table(doc, value = final_table, style = "table_template")
# Save the Word document
print(doc, target = "/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/final.table.docx")

# generation of scatter plot
xpy_scatterplot <- ggplot(final_table, aes(x=median_i, y=median_l))+geom_point(color=c("blue","red","blue","red","blue","red","blue","red","blue","red","blue","red","blue","red","blue","red","blue","red"))+
  labs(y="l (%)", x="i")+
  geom_vline(xintercept = c(0, 12.5, 25, 37.5, 50), linetype="dashed")
  
# show plot
xpy_scatterplot

# vectors and data frame for box plot of l values - all measurements must be in one vector associated with chromosome ID
for (x in 1:length(chromosome)) {
  cat(paste0("l_percentage_dissected$l_chromosome", chromosome[x], ","))
}

l_percentage_box_plot <- c(l_percentage_dissected$l_chromosome1L,
                           l_percentage_dissected$l_chromosome1S,
                           l_percentage_dissected$l_chromosome2L,
                           l_percentage_dissected$l_chromosome2S,
                           l_percentage_dissected$l_chromosome3L,
                           l_percentage_dissected$l_chromosome3S,
                           l_percentage_dissected$l_chromosome4L,
                           l_percentage_dissected$l_chromosome4S,
                           l_percentage_dissected$l_chromosome5L,
                           l_percentage_dissected$l_chromosome5S,
                           l_percentage_dissected$l_chromosome6L,
                           l_percentage_dissected$l_chromosome6S,
                           l_percentage_dissected$l_chromosome7L,
                           l_percentage_dissected$l_chromosome7S,
                           l_percentage_dissected$l_chromosome8L,
                           l_percentage_dissected$l_chromosome8S,
                           l_percentage_dissected$l_chromosome9_10L,
                           l_percentage_dissected$l_chromosome9_10S)

chromosomes_box_plot <- rep(chromosome, each=22) # repeat number 22 means 11*2 (number of metaphases and each chromosome is in haploid pair)
l_percentage_box_plot_data_frame=data.frame(l_percentage_box_plot=l_percentage_box_plot, chromosomes_box_plot=chromosomes_box_plot)

xpy_l_percentage_boxplot <- ggplot(l_percentage_box_plot_data_frame, aes(x=as.factor(chromosomes_box_plot), y=l_percentage_box_plot, color=chromosomes_box_plot)) + geom_boxplot()+
  labs(y="l (%)", x="chromosome") +
  scale_color_manual(values = c("blue", "red", "blue", "red", "blue", "red", "blue", "red", "blue", "red", "blue", "red","blue", "red","blue", "red","blue", "red")) +
  theme_minimal() +
  theme(legend.position = "none") +
  geom_vline(xintercept = c(2.5, 4.5, 6.5, 8.5, 10.5, 12.5, 14.5, 16.5), linetype="dashed")

# show plot
xpy_l_percentage_boxplot

# extract IQR (Q1-Q3 values)
# Calculate the IQR for each chromosome
l_iqr_values <- l_percentage_box_plot_data_frame %>%
  group_by(chromosomes_box_plot) %>%
  summarise(
    Q1 = quantile(l_percentage_box_plot, 0.25),
    Q3 = quantile(l_percentage_box_plot, 0.75),
    IQR = IQR(l_percentage_box_plot)
  )
print(l_iqr_values)

# Save i_iqr_values the Word document
doc <- read_docx()
doc <- body_add_table(doc, value = l_iqr_values, style = "table_template")
print(doc, target = "/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/l_iqr_values.docx")


# vectors and data frame for box plot of i values - all measurements must be in one vector associated with chromosome ID
for (x in 1:length(chromosome)) {
  cat(paste0("i_dissected$i_chromosome", chromosome[x], ","))
}

i_box_plot <- c(i_dissected$i_chromosome1L,
                i_dissected$i_chromosome1S,
                i_dissected$i_chromosome2L,
                i_dissected$i_chromosome2S,
                i_dissected$i_chromosome3L,
                i_dissected$i_chromosome3S,
                i_dissected$i_chromosome4L,
                i_dissected$i_chromosome4S,
                i_dissected$i_chromosome5L,
                i_dissected$i_chromosome5S,
                i_dissected$i_chromosome6L,
                i_dissected$i_chromosome6S,
                i_dissected$i_chromosome7L,
                i_dissected$i_chromosome7S,
                i_dissected$i_chromosome8L,
                i_dissected$i_chromosome8S,
                i_dissected$i_chromosome9_10L,
                i_dissected$i_chromosome9_10S)

i_box_plot_data_frame=data.frame(i_box_plot=i_box_plot, chromosomes_box_plot=chromosomes_box_plot)

# generation of box plot
xpy_i_boxplot <- ggplot(i_box_plot_data_frame, aes(x=as.factor(chromosomes_box_plot), y=i_box_plot, color=chromosomes_box_plot)) + geom_boxplot()+
  labs(y="i", x="chromosome")+
  scale_color_manual(values = c("blue", "red", "blue", "red", "blue", "red", "blue", "red", "blue", "red", "blue", "red","blue", "red","blue", "red","blue", "red")) +
  theme_minimal() +
  theme(legend.position = "none") +
  geom_vline(xintercept = c(2.5, 4.5, 6.5, 8.5, 10.5, 12.5, 14.5, 16.5), linetype="dashed")

# show plot
xpy_i_boxplot

# extract IQR (Q1-Q3 values)
# Calculate the IQR for each chromosome
i_iqr_values <- i_box_plot_data_frame %>%
  group_by(chromosomes_box_plot) %>%
  summarise(
    Q1 = quantile(i_box_plot, 0.25),
    Q3 = quantile(i_box_plot, 0.75),
    IQR = IQR(i_box_plot)
  )
print(i_iqr_values)

# Save i_iqr_values the Word document
doc <- read_docx()
doc <- body_add_table(doc, value = i_iqr_values, style = "table_template")
print(doc, target = "/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/xenopus_pygmaeus/karyotype_analysis/R/i_iqr_values.docx")

# generation of multipanel of plots
ggarrange(xpy_scatterplot, xpy_l_percentage_boxplot, xpy_i_boxplot, #+ rremove("x.text"), 
          labels = c("a", "b", "c"),
          nrow = 3)

# export l_percentage and i for multiple box plot
#write.table(l_percentage_box_plot_data_frame, file = '/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/cobitis_unal_et_al/R/ctu_l_percentage_box_plot_data_frame.tsv', 
#            col.names = FALSE,
#            row.names = FALSE, sep = "\t")
#write.table(i_box_plot_data_frame, file = '/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/cobitis_unal_et_al/R/ctu_i_box_plot_data_frame.tsv', 
#            col.names = FALSE,
#            row.names = FALSE, sep = "\t")

# export the l_percentage_dissected and i_dissected data frames for ANOVA test
write.table(l_percentage_dissected, file = '/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/cobitis_unal_et_al/R/ctu_l_percentage_dissected.tsv', 
            col.names = FALSE,
            row.names = FALSE, sep = "\t")
write.table(i_dissected, file = '/Users/martinknytl/Google\ Drive/My\ Drive/pracovni_slozka/vyzkum/moje_publikace/rozpracovane/cobitis_unal_et_al/R/ctu_i_dissected.tsv', 
            col.names = FALSE,
            row.names = FALSE, sep = "\t")

# one-way ANOVA test
for (x in 1:9) {
  cat(paste0("# ANOVA test chromosome ", x, "(xpy ", x, "L x ", x, "S)", "\n", 
             "chromosome", x, " <- c(rep('xpy", x, "L', times=22), rep('xpy", x, "S', times=22))", "\n",
             "l_chromosome", x, "_ANOVA = data.frame(chromosome", x, "=c(rep('xpy", x, "L', times=22), rep('xpy", x, "S', times=22)), c(l_percentage_dissected$l_chromosome", x, "L, l_percentage_dissected$l_chromosome", x, "S))", "\n",
             "i_chromosome", x, "_ANOVA = data.frame(chromosome", x, "=c(rep('xpy", x, "L', times=22), rep('xpy", x, "S', times=22)), c(i_dissected$i_chromosome", x, "L,i_dissected$i_chromosome", x, "S))", "\n",
             "one.way <- aov(c(l_percentage_dissected$l_chromosome", x, "L,l_percentage_dissected$l_chromosome", x, "S) ~ chromosome", x, ", data = l_chromosome", x, "_ANOVA)", "\n",
             "summary(one.way)", "\n",
             "tukey_result <- TukeyHSD(one.way)", "\n",
             "print(tukey_result)", "\n",
             "one.way <- aov(c(i_dissected$i_chromosome", x, "L,i_dissected$i_chromosome", x, "S) ~ chromosome", x, ", data = i_chromosome", x, "_ANOVA)", "\n",
             "summary(one.way)", "\n",
             "tukey_result <- TukeyHSD(one.way)", "\n",
             "print(tukey_result)", "\n",
             "\n"))
} 

# ANOVA test chromosome 1 (xpy 1L x 1S)
chromosome1 <- c(rep('xpy1L', times=22), rep('xpy1S', times=22))
l_chromosome1_ANOVA = data.frame(chromosome1=c(rep('xpy1L', times=22), rep('xpy1S', times=22)), c(l_percentage_dissected$l_chromosome1L, l_percentage_dissected$l_chromosome1S))
i_chromosome1_ANOVA = data.frame(chromosome1=c(rep('xpy1L', times=22), rep('xpy1S', times=22)), c(i_dissected$i_chromosome1L,i_dissected$i_chromosome1S))
one.way <- aov(c(l_percentage_dissected$l_chromosome1L,l_percentage_dissected$l_chromosome1S) ~ chromosome1, data = l_chromosome1_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome1L,i_dissected$i_chromosome1S) ~ chromosome1, data = i_chromosome1_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 2(xpy 2L x 2S)
chromosome2 <- c(rep('xpy2L', times=22), rep('xpy2S', times=22))
l_chromosome2_ANOVA = data.frame(chromosome2=c(rep('xpy2L', times=22), rep('xpy2S', times=22)), c(l_percentage_dissected$l_chromosome2L, l_percentage_dissected$l_chromosome2S))
i_chromosome2_ANOVA = data.frame(chromosome2=c(rep('xpy2L', times=22), rep('xpy2S', times=22)), c(i_dissected$i_chromosome2L,i_dissected$i_chromosome2S))
one.way <- aov(c(l_percentage_dissected$l_chromosome2L,l_percentage_dissected$l_chromosome2S) ~ chromosome2, data = l_chromosome2_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome2L,i_dissected$i_chromosome2S) ~ chromosome2, data = i_chromosome2_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 3(xpy 3L x 3S)
chromosome3 <- c(rep('xpy3L', times=22), rep('xpy3S', times=22))
l_chromosome3_ANOVA = data.frame(chromosome3=c(rep('xpy3L', times=22), rep('xpy3S', times=22)), c(l_percentage_dissected$l_chromosome3L, l_percentage_dissected$l_chromosome3S))
i_chromosome3_ANOVA = data.frame(chromosome3=c(rep('xpy3L', times=22), rep('xpy3S', times=22)), c(i_dissected$i_chromosome3L,i_dissected$i_chromosome3S))
one.way <- aov(c(l_percentage_dissected$l_chromosome3L,l_percentage_dissected$l_chromosome3S) ~ chromosome3, data = l_chromosome3_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome3L,i_dissected$i_chromosome3S) ~ chromosome3, data = i_chromosome3_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 4(xpy 4L x 4S)
chromosome4 <- c(rep('xpy4L', times=22), rep('xpy4S', times=22))
l_chromosome4_ANOVA = data.frame(chromosome4=c(rep('xpy4L', times=22), rep('xpy4S', times=22)), c(l_percentage_dissected$l_chromosome4L, l_percentage_dissected$l_chromosome4S))
i_chromosome4_ANOVA = data.frame(chromosome4=c(rep('xpy4L', times=22), rep('xpy4S', times=22)), c(i_dissected$i_chromosome4L,i_dissected$i_chromosome4S))
one.way <- aov(c(l_percentage_dissected$l_chromosome4L,l_percentage_dissected$l_chromosome4S) ~ chromosome4, data = l_chromosome4_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome4L,i_dissected$i_chromosome4S) ~ chromosome4, data = i_chromosome4_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 5(xpy 5L x 5S)
chromosome5 <- c(rep('xpy5L', times=22), rep('xpy5S', times=22))
l_chromosome5_ANOVA = data.frame(chromosome5=c(rep('xpy5L', times=22), rep('xpy5S', times=22)), c(l_percentage_dissected$l_chromosome5L, l_percentage_dissected$l_chromosome5S))
i_chromosome5_ANOVA = data.frame(chromosome5=c(rep('xpy5L', times=22), rep('xpy5S', times=22)), c(i_dissected$i_chromosome5L,i_dissected$i_chromosome5S))
one.way <- aov(c(l_percentage_dissected$l_chromosome5L,l_percentage_dissected$l_chromosome5S) ~ chromosome5, data = l_chromosome5_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome5L,i_dissected$i_chromosome5S) ~ chromosome5, data = i_chromosome5_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 6(xpy 6L x 6S)
chromosome6 <- c(rep('xpy6L', times=22), rep('xpy6S', times=22))
l_chromosome6_ANOVA = data.frame(chromosome6=c(rep('xpy6L', times=22), rep('xpy6S', times=22)), c(l_percentage_dissected$l_chromosome6L, l_percentage_dissected$l_chromosome6S))
i_chromosome6_ANOVA = data.frame(chromosome6=c(rep('xpy6L', times=22), rep('xpy6S', times=22)), c(i_dissected$i_chromosome6L,i_dissected$i_chromosome6S))
one.way <- aov(c(l_percentage_dissected$l_chromosome6L,l_percentage_dissected$l_chromosome6S) ~ chromosome6, data = l_chromosome6_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome6L,i_dissected$i_chromosome6S) ~ chromosome6, data = i_chromosome6_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 7(xpy 7L x 7S)
chromosome7 <- c(rep('xpy7L', times=22), rep('xpy7S', times=22))
l_chromosome7_ANOVA = data.frame(chromosome7=c(rep('xpy7L', times=22), rep('xpy7S', times=22)), c(l_percentage_dissected$l_chromosome7L, l_percentage_dissected$l_chromosome7S))
i_chromosome7_ANOVA = data.frame(chromosome7=c(rep('xpy7L', times=22), rep('xpy7S', times=22)), c(i_dissected$i_chromosome7L,i_dissected$i_chromosome7S))
one.way <- aov(c(l_percentage_dissected$l_chromosome7L,l_percentage_dissected$l_chromosome7S) ~ chromosome7, data = l_chromosome7_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome7L,i_dissected$i_chromosome7S) ~ chromosome7, data = i_chromosome7_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 8(xpy 8L x 8S)
chromosome8 <- c(rep('xpy8L', times=22), rep('xpy8S', times=22))
l_chromosome8_ANOVA = data.frame(chromosome8=c(rep('xpy8L', times=22), rep('xpy8S', times=22)), c(l_percentage_dissected$l_chromosome8L, l_percentage_dissected$l_chromosome8S))
i_chromosome8_ANOVA = data.frame(chromosome8=c(rep('xpy8L', times=22), rep('xpy8S', times=22)), c(i_dissected$i_chromosome8L,i_dissected$i_chromosome8S))
one.way <- aov(c(l_percentage_dissected$l_chromosome8L,l_percentage_dissected$l_chromosome8S) ~ chromosome8, data = l_chromosome8_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome8L,i_dissected$i_chromosome8S) ~ chromosome8, data = i_chromosome8_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 9(xpy 9L x 9S)
chromosome9_10 <- c(rep('xpy9L', times=22), rep('xpy9S', times=22))
l_chromosome9_10_ANOVA = data.frame(chromosome9_10=c(rep('xpy9_10L', times=22), rep('xpy9_10S', times=22)), c(l_percentage_dissected$l_chromosome9_10L, l_percentage_dissected$l_chromosome9_10S))
i_chromosome9_10_ANOVA = data.frame(chromosome9_10=c(rep('xpy9_10L', times=22), rep('xpy9_10S', times=22)), c(i_dissected$i_chromosome9_10L,i_dissected$i_chromosome9_10S))
one.way <- aov(c(l_percentage_dissected$l_chromosome9_10L,l_percentage_dissected$l_chromosome9_10S) ~ chromosome9_10, data = l_chromosome9_10_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome9_10L,i_dissected$i_chromosome9_10S) ~ chromosome9_10, data = i_chromosome9_10_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test chromosome 9_10S x 4S)
l_chromosome9_10S_4S_ANOVA = data.frame(chromosome9_10S_4S=c(rep('xpy9_10S', times=22), rep('xpy4S', times=22)), c(l_percentage_dissected$l_chromosome9_10S, l_percentage_dissected$l_chromosome4S))
i_chromosome9_10S_4S_ANOVA = data.frame(chromosome9_10S_4S=c(rep('xpy9_10S', times=22), rep('xpy4S', times=22)), c(i_dissected$i_chromosome9_10S,i_dissected$i_chromosome4S))
one.way <- aov(c(l_percentage_dissected$l_chromosome9_10S,l_percentage_dissected$l_chromosome4S) ~ chromosome9_10S_4S, data = l_chromosome9_10S_4S_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)
one.way <- aov(c(i_dissected$i_chromosome9_10S,i_dissected$i_chromosome4S) ~ chromosome9_10S_4S, data = i_chromosome9_10S_4S_ANOVA)
summary(one.way)
tukey_result <- TukeyHSD(one.way)
print(tukey_result)

# ANOVA test for all chromosomes followed by Tukey test with p-values for each comparison
# this has different results than ANOVA test between separate chromosomes. Why? I think that it is because Tukey outputs lwr and upr are taken from the all group of values
l_chromosome1_2_ANOVA = data.frame(chromosome1_2=c(rep('xpy1L', times=22), rep('xpy1S', times=22), rep('xpy2L', times=22), rep('xpy2S', times=22)), 
                                   c(l_percentage_dissected$l_chromosome1L,l_percentage_dissected$l_chromosome1S,l_percentage_dissected$l_chromosome2L,l_percentage_dissected$l_chromosome2S))
one.way <- aov(c(l_percentage_dissected$l_chromosome1L,l_percentage_dissected$l_chromosome1S,l_percentage_dissected$l_chromosome2L,l_percentage_dissected$l_chromosome2S) ~ chromosome1_2, data = l_chromosome1_2_ANOVA)
summary(one.way)
i_chromosome1_2_ANOVA = data.frame(chromosome1_2=c(rep('xpy1L', times=22), rep('xpy1S', times=22), rep('xpy2L', times=22), rep('xpy2S', times=22)), 
                                   c(i_dissected$i_chromosome1L,i_dissected$i_chromosome1S,i_dissected$i_chromosome2L,i_dissected$i_chromosome2S))
one.way <- aov(c(i_dissected$i_chromosome1L,i_dissected$i_chromosome1S,i_dissected$i_chromosome2L,i_dissected$i_chromosome2S) ~ chromosome1_2, data = i_chromosome1_2_ANOVA)
summary(one.way)
