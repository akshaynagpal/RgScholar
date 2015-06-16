library(rvest)

p1 <- read_html('https://scholar.google.co.in/scholar?as_vis=1&hl=en&q=heart+rate+variability+analysis')

getTitles<- p1 %>%
  html_nodes(".gs_rt") %>%
  html_text()

getLinks<- p1 %>%
  html_nodes(".gs_rt a") %>%
  html_attr("href")

getShortAbstract<- p1 %>%
  html_nodes(".gs_rs") %>%
  html_text()


result <- data.frame(title=getTitles,link=getLinks,ShortAbstract=getShortAbstract)