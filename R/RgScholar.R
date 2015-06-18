library(rvest)

#'Search Google Scholar
#'
#'Function to search Google Scholar for research papers
#'@param user_query search term(s) given by user separated by space 
#'@param year_low Lower limit of the year filter (optional). Default Value = NULL
#'@param year_high Upper limit of the year filter (optional).    Default Value = NULL
#'@param journal Limit search to a specific journal (optional).    Default value = NULL
#'@return \code{result} dataframe having titles, links and short abstracts of the research papers matching \code{user_query}
#'@examples 
#'google_Scholar("heart rate") #without filters
#'google_Scholar("heart rate",year_low = 1989, year_high = 2015,journal = "nature")

google_Scholar <- function(user_query,year_low=NULL,year_high=NULL,journal=NULL){
  user_query_CLEAN <- gsub("^ *|(?<= ) | *$", "", tolower(user_query), perl=T)  #removing multiple spaces
  user_query_for_URL <- gsub(" ","+",user_query_CLEAN)        #replacing space with + for URL
  base_URL <- "https://scholar.google.co.in/scholar?as_vis=1&hl=en&q="
  query_URL <- paste(base_URL,user_query_for_URL,sep="")
  
  if(!is.null(journal)){
    journal_CLEAN <- gsub("^ *|(?<= ) | *$", "", tolower(journal), perl=T)  #removing multiple spaces
    journal_for_URL <- gsub(" ","+",journal_CLEAN)        #replacing space with + for URL
    query_URL <- paste(query_URL,"&as_publication=",journal_for_URL,sep="")
  }
  
  if(!is.null(year_low)){
    query_URL <- paste(query_URL,"&as_ylo=",year_low,sep = "")
  }
  
  if(!is.null(year_high)){
    query_URL <- paste(query_URL,"&as_yhi=",year_high,sep="")
  }
  print(query_URL)
  HTML_from_query_URL <- read_html(query_URL)
  
  getTitles<- HTML_from_query_URL %>%
    html_nodes(".gs_rt") %>%
    html_text()
  
  getLinks<- HTML_from_query_URL %>%
    html_nodes(".gs_rt a") %>%
    html_attr("href")
  
  getShortAbstract<- HTML_from_query_URL %>%
    html_nodes(".gs_rs") %>%
    html_text()
  result <- data.frame(title=getTitles,link=getLinks,ShortAbstract=getShortAbstract)
  
  return(result)
} 







