data.org <- readLines("»ç¼³.txt",,encoding="UTF-8")
data <- data.org

data.word <- sapply(data,extractNoun,USE.NAMES = F)

data = unlist(data.word)
data = Filter(function(x){nchar(x)>=2},data)

temp1 <- SimplePos09(data)
temp2 <- str_match(temp1,"[°¡-ÆR]+/N")
temp3 <- temp2[,2]
data <- temp3[!is.na(temp3)]

data <- gsub("\t","",data)
data <- gsub("\\d+","",data)
data <- gsub("\\(","",data)
data <- gsub("\\)","",data)
data <- gsub(" ","",data)
data <- gsub('"',"",data)
data <- gsub("[0-9]","",data)

write(unlist(data),"data2.txt")

data2 <- read.table("data2.txt")

wordcount <- table(data2)

wordcloud2(data = wordcount, size=1, color = "random-light",
           backgroundColor = "black", ellipticity = 0.3,
           rotateRatio = 0.5, shape = "circle")

