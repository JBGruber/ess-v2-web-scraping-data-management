
library(RMySQL)
library(httr2)
library(rvest)
library(stringr)


check_in_browser <- function(html) {
  tmp <- tempfile(fileext = ".html")
  writeLines(as.character(html), tmp)
  browseURL(tmp)
}# Request a single page and scrape all the links
search_speeches_page <- function(txOrador = "abelardo",
                                 txPartido = NULL,
                                 txUF = NULL,
                                 dtInicio = NULL,
                                 dtFim = NULL,
                                 txTexto = NULL,
                                 txSumario = NULL,
                                 basePesq = "plenario",
                                 CampoOrdenacao = "dtSessao",
                                 PageSize = 50,
                                 page = 1L) {

  message("Getting page ", page)
  search_res <- request("https://www.camara.leg.br/internet/sitaqweb/resultadoPesquisaDiscursos.asp?") |>
    req_url_query(
      CurrentPage = page,
      txOrador = txOrador,
      txPartido = txPartido,
      txUF = txUF,
      dtInicio = dtInicio,
      dtFim = dtFim,
      txTexto = txTexto,
      txSumario = txSumario,
      basePesq = basePesq,
      CampoOrdenacao = CampoOrdenacao,
      PageSize = PageSize, #
      TipoOrdenacao = "DESC",
      btnPesq = "Pesquisar"
    ) |>
    req_perform() |>
    resp_body_html()

  links <- search_res |>
    html_elements("a") |>
    html_attr("href")

  link_titles <-  search_res |>
    html_elements("a") |>
    html_attr("title")

  links_speeches <- links[link_titles == "Íntegra do Discurso" & !is.na(link_titles)] |>
    str_remove_all("\\s")

  if (length(links_speeches) > 0) {
    links_speeches_full <- paste0("https://www.camara.leg.br/internet/sitaqweb/", links_speeches)
    return(links_speeches_full)
  } else {
    return("no results")
  }
}

db_user <- 'Johannes'
db_password <- 'seNNahoj53'
db_name <- 'db_koichi'
db_host <- 'localhost' # for local access
db_port <- 3306

# 3. Read data from db
mydb <-  dbConnect(RMySQL::MySQL(), user = db_user, password = db_password,
                   dbname = db_name, host = db_host, port = db_port)


get_meta<-function(p1){
  h1<-html_node(p1,"body > table") # extract the table
  t1<-rvest::html_table(h1) #
  t1<-t1[3:4,1:3]
  session<-as.character(t1[1,1])
  name<-as.character(t1[2,1])


  date<-as.character(t1[2,3])
  fase<-as.character(t1[1,3])
  hour<-as.character(t1[1,2])

  name<-gsub("Orador: ","",name)
  hour<-gsub("Hora: ","",hour)

  fase<-gsub("Fase: ","",fase)

  date<-as.character(t1[2,3])
  date<-gsub("Data: ","",date)
  date<-as.Date(date,format="%d/%m/%Y")
  sp<-strsplit(name,",")
  if(length(sp[[1]])==2){
    fullname<-sp[[1]][1]
    party<-sp[[1]][2]

  }else{fullname<-name
  party<-name}
  return(data.frame(fullname,party,session,date,hour,fase))
}


main<-dbGetQuery(mydb,"select * from mpsbrazil;")

main<-aggregate(year~party+orador,main,FUN="length")

mps<-main$orador[5:nrow(main),]

for(m in 1:length(mps)){

  s1<-search_speeches_page(mps[m])
  print(mps[m])
  for(j in 1:length(s1)){
    pages<-read_html(s1[[j]])
    meta<-get_meta(pages)
    meta$speeches<-get_text(pages)
    meta$query<-mps[m]
    dbWriteTable(mydb,"speeches",meta,append=T,row.names=F)

  }

  #allspeeches<-rbind(allspeeches,speech_mp)
}
