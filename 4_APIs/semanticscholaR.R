# documentation: https://api.semanticscholar.org/api-docs/graph#tag/Author-Data/operation/get_graph_get_author
library(httr2)
library(tidyverse)
find_scholar <- function(query) {
  resp <- request("https://api.semanticscholar.org/graph/v1/author/search") |>
    req_url_query(query = query) |>
    req_url_query(fields = "name,papers.title,papers.fieldsOfStudy") |>
    req_perform() |>
    resp_body_json()
  data <- pluck(resp, "data")
  tibble(name = map_chr(data, "name"),
         author_Id = map_chr(data, "authorId"),
         papers =  map(data, "papers"))
}
out <- find_scholar("Marius Sältzer") |>
  unnest(papers) |>
  unnest_wider(papers) |>
  unnest(fieldsOfStudy) |>
  unnest(fieldsOfStudy) |>
  filter(fieldsOfStudy == "Political Science")
find_scholar("Johannes Gruber")
find_scholar("te5t")


out$papers

x <- find_scholar("Marius Sältzer")
x$papers
json$data
pluck(resp, "data")
map_chr(data, "authorId")

json$data <- NULL
json["test"][[1]]$authorId
map_chr(json, "data", 1, "authorId")

get_info <- function(author_id) {
  request("https://api.semanticscholar.org/graph/v1/author/") |>
    req_url_path_append(author_id) |>
    req_url_path_append("?fields=authorId,externalIds,url,name,aliases,affiliations,homepage,paperCount,citationCount,hIndex") |>
    req_perform() |>
    resp_body_json()
}
x <- get_info(2004428566)

get_papers <- function(author_id) {
  request("https://api.semanticscholar.org/graph/v1/author/") |>
    req_url_path_append(author_id) |>
    req_url_path_append("papers") |>
    req_url_query(fields = "externalIds,url,citationCount,citations,references") |>
    req_perform() |>
    resp_body_json()
}
y <- get_papers(2004428566)


example <- list(
  movies = c("A New Hope", "The Empire Strikes Back",
    "Return of the Jedi"    ,  "Phantom Menace"         ,
    "Attack of the Clones"  ,  "Revenge of the Sith"    ,
    "The Force Awakens"     ,  "The Last Jedi"          ,
    "Rise of Skywalker"  )    ,
  years = c(1977, 1980, 1983, 1999, 2002,2005, 2015, 2017, 2019),
  preferences = c(2, 8, 1, 7, 4 ,5 ,6 ,9))
example
example[[1]]
pluck(example, 1)

pluck(example, 4)
example[[4]]
