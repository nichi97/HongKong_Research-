library("tidyverse")
library("quanteda")
library("striprtf")
library(readtext)
library("textreadr")

file_list = list.files("./Datasets/NewYorkTimes/")

setwd("./Datasets/NewYorkTimes/")

# read in the documentList
#documentList <- lapply(file_list, read_rtf)
# just read the r data instead


# This function take in an element of the documentList, and return a corpus. 
text2Corpus <- function(data){
  
  
  # Organize the data, parse each element as an element of corpusList
  corpusList = list()
  articleList = list()
  currInd = 1
  for (i in seq(length(data))){
    
    # if reach end of document, move on to another list element
    if(data[i] == "End of Document"){
      corpusList[[currInd]] <- articleList
      articleList <- list();
      currInd <- currInd + 1
    } else {
      articleList = append(articleList, data[i])
    }
  }
  
  # Further organize data, organize them into corpus
  
  dateList <- character()
  sectionList <- character()
  bodyList <- character()
  for(elem in corpusList){
    
    dateList <- append(dateList, elem[[2]])
    sectionList <- append(sectionList, elem[[4]])
    
    # construct the body string
    bodyStr <- ""
    startPt <- which(elem == "Body") + 1
    endPt <- length(elem)
    for(i in seq(startPt, endPt)){
      bodyStr <- str_c(bodyStr, elem[[i]])
    }
    bodyList <- append(bodyList, bodyStr)
    
  }
  # clean the date into the format we wanted
  date_regEx <- "[A-Z|a-z]+\\s\\d{1,2},\\s\\d{4}\\s"
  dateList <- str_extract(dateList, date_regEx)
  
  
  corp_NYT <- corpus(bodyList)
  docvars(corp_NYT, "Date") <- dateList
  docvars(corp_NYT, "Section") <- sectionList
  
  return(corp_NYT)
}

corpusList = lapply(documentList, text2Corpus)
x = corpusList[[1]] + corpusList[[2]]


