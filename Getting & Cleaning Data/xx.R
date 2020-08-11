#Week-1
#setwd("../") to go one directoy up
download.file(file,filepath,method = 'curl')#method = curl if downloading from a HTTP/HTTPS server
datedownload<-date() #important metada as data keeps on updating

#default separator for read.table() is tab, used for tab delimited files

#xlsx package to excel files. read.xlsx() #XLConnect good package
# one of the argument is sheetIndex
#specific rows and columns can be selcted by usinf colIndex and rowIndex args

#XML extensible markup language
#Extracting XML the basid for web scrapping
#Two components-> Markup i.e label and content->actual text of document
library('XML')
fileurl <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
doc <-xmlTreeParse(fileurl, useInternal = T)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

#directly access part of xml document
rootNode[[1]]

rootNode[[1]] [[1]]

xmlSApply(rootNode,xmlValue)

xpathSApply(rootNode,'//name',xmlValue)
(xpathSApply(rootNode, '//price',xmlValue))

fileurl <- getURL("https://www.espn.in/nfl/team/_/name/bal/baltimore-ravens")
doc <-htmlTreeParse(fileurl, useInternal = T)
scores<-xpathSApply(doc,"//li[@class = 'score']",xmlValue)

#JSON javascript object notation
#Common fomrat for data from APIs
#Data stored as number, strings, Boolean, Array, Object

library('jsonlite')
jsondata<-fromJSON('https://api.github.com/')
names(jsondata)
names(jsondata$owner)
myjson<-toJSON(iris,pretty = T)#convert to json
cat(myjson)
json2<-fromJSON(myjson)#convert json into a dataframe
head(json2)


?read.xlsx


