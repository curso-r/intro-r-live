library(dplyr)

imdb = read.csv("imdb.csv")

imdb_filtrado = filter(imdb, ano > 2000, duracao < 60, orcamento < 10000000)

write.csv(imdb, "imdb_filtrado.csv")
