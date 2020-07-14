data.org <- readLines("»ç¼³.txt",,encoding="UTF-8")
 ## 사설의 text 파일을 읽어온다
data <- data.org
 ## 원본 데이터를 복제해서 사용한다
data.word <- sapply(data,extractNoun,USE.NAMES = F)
 ## 빠른 연산을 위해 분할,합병 처리하여 extractNoun 함수 작업을 시행한다.
data = unlist(data.word)
data = Filter(function(x){nchar(x)>=2},data)
 ## 사용이 용이하게 일차원 데이터로 변환시킨 후 2자 이상의 값만 남긴다. 


#temp1 <- SimplePos09(data)
#temp2 <- str_match(temp1,"[°¡-ÆR]+/N")
#temp3 <- temp2[,2]
#data <- temp3[!is.na(temp3)]
## SimplePos22를 이용하여 어간만을 추출 시도하였으나 개선 필요.

data <- gsub("\t","",data)
data <- gsub("\\d+","",data)
data <- gsub("\\(","",data)
data <- gsub("\\)","",data)
data <- gsub(" ","",data)
data <- gsub('"',"",data)
data <- gsub("[0-9]","",data)
## 공백(탭), 숫자, 특수기호 등 의도와 맞지 않은 데이터들은 없는 값으로 대체시킨다. 

write(unlist(data),"data2.txt")
data2 <- read.table("data2.txt")
## 만들어진 data 값을 파일에 백업 / 복사하여 진행한다.

wordcount <- table(data2)
## Data의 각 빈도를 wordcount 로 지정한다. 

wordcloud2(data = wordcount, size=1, color = "random-light",
           backgroundColor = "black", ellipticity = 0.3,
           rotateRatio = 0.5, shape = "circle")

 
