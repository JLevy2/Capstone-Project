library(shiny)
library(data.table)
library(stringi)
library(stringr)
library(tm)


#Load data input
data<-fread("./Data/Training_30percent.csv")
data<-data[,2:4]
colnames(data)<-c("Ans","length","Input")
dataTrain<-data
list<- read.csv("./Data/bad_words_google.csv", header=FALSE)

suppressPackageStartupMessages(c(
        library(shiny),
        library(stringi),
        library(stringr),
        library(tm)))


shinyServer(function(input, output) {
        
        Prediction <- reactive({
                inp <- input$text
                # Clean input data the same way as the training datset
                inp<- gsub("[^[:alnum:][:space:]']", "",inp)
                inp<-iconv(inp, "latin1", "ASCII", sub="")
                g<-Corpus(VectorSource(inp))
                i2<- tm_map(g, removeNumbers)
                i3 <- tm_map(i2, tolower)
                i4<- tm_map(i3, stripWhitespace)
                i5 <- tm_map(i4, removeWords, list$words)
                inp<-i5$content
                
                
                # define length of ngram to use
                nwords<-stri_count_words(inp)  
                if(nwords == 1){
                        N=2
                } else if(nwords == 2){
                        N=3
                } else if(nwords == 3){
                        N=4 
                } else if(nwords == 4){
                        N=5 
                } else if(nwords == 5){
                        N=6 
                } else if(nwords > 5){
                        N=6
                        inp<-word(as.character(inp),-5,-1)
                }  
                
               
                
                # subset the data for the ngram length and matches to the ngram length
                data<-data[dataTrain$length == N & dataTrain$Input == inp,]
                
                # if the phrase does not exist remove the first word in the phrase and back down to an n grams with one less word
                if (nrow(data) == 0 & N >2){
                        N=N-1
                        inp<-word(as.character(inp),-(N-1),-1) 
                        data<-dataTrain[dataTrain$length == N & dataTrain$Input == inp,]
                }
                # if the phrase does not exist remove the first word in the phrase and back down to an n grams with one less word       
                if (nrow(data) == 0 & N >2){
                        N=N-1
                        inp<-word(as.character(inp),-(N-1),-1) 
                        data<-dataTrain[dataTrain$length == N & dataTrain$Input == inp,]
                } 
                # if the phrase does not exist remove the first word in the phrase and back down to an n grams with one less word     
                if (nrow(data) == 0 & N >2){
                        N=N-1
                        inp<-word(as.character(inp),-(N-1),-1) 
                        data<-dataTrain[dataTrain$length == N & dataTrain$Input == inp,]
                }
                # if the phrase does not exist remove the first word in the phrase and back down to an n grams with one less word
                if (nrow(data) == 0 & N >2){
                        N=N-1
                        inp<-word(as.character(inp),-(N-1),-1) 
                        data<-dataTrain[dataTrain$length == N & dataTrain$Input == inp,]
                }  
                
                # If there are no ngram matches extract the most frequent words in the dataset
                if (nrow(data) == 0 & N == 2){
                        data<-dataTrain[dataTrain$length == 1,]
                       # print(data$Input[1:10])
                }
                
                word(as.character(data$Ans),-1)[1]
                
        })     
        
        output$Prediction<-renderText(Prediction())
})        

        