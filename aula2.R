imdb = read.csv("/Users/fernandopoliano/projetos.R/intro-r-live/imdb.csv")
# esse negocio aqui usou caminho absoluto!

mean(imdb$nota_imdb)
# $ pega colunas de tabelas
# mean faz a média de tabelas

# caminho absoluto é um que parte da raiz do seu computador
# No mac /
# No Windows o usual é ser U:/Usarios/Fernando/Documents/..
# No Linux /home/users/...

# O legal é usar caminho relativo
# O R é adaptado pra usar caminhos relativos...

imdb2 = read.csv("imdb.csv")

# como pode?
# o R trabalha com um diretorio de referencia!
# O R sempre tem um diretorio de referencia
# voce descobre com o comando getwd()
getwd()

# read.csv("imdb.csv")
# o R entende na verdade getwd + "imdb.csv"
# /Users/fernandopoliano/projetos.R/intro-r-live/imdb.csv

# como eu faço para usar um diretorio de referencia "meu"

# Funcoes para mexer com tabelas ------------------------------------------

# primeiro
# read.csv(arquivo)

# segundos
# vimos que todo domando
# blablalba = ????
# coloca o conteudo de ????? dentro de um objeto blablabla, que fica
# exibido no canto superior direito

imdb2$ano

class(imdb2$ano)

vetor = c(1,2,3)

# vimos funcoes para mexer com colunas
# mean
# max
# median
# min

# mean(imdb2$nota_imdb)

## na vida as vezes queremos mexer com a tabela inteira

# para isso vamos trazer comandos novos que nao aparecem no R
# basico já carregado do 0

# precisamos saber o nome da biblioteca de comando que queremos trazer e depois
# mandamos o R instalar (baixar da internet)

install.packages("dplyr")
# o comando install packages recebe o nome de um pacote em texto (por isso as ")

library(dplyr)

# mutate
# serve para criar colunas

imdb_limpo = mutate(imdb2,
                    orcamento_milhoes = orcamento/10^6,
                    receita_milhoes = receita/10^6,
                    duracao_horas = duracao/60,
                    .after = receita_eua)



# filter
# serve pra escolher certas linhas, filtrar linhas

imdb_2020 = filter(imdb_limpo, ano == 2020)
# um igual (=) é o sinal de "guardar num potinho"
# sinal de criar variavel
# == é o sinal parecido com o "=", mas pra comparacao
# ano == 2022 é na verdade uma pergunta, pro R,
# ano é igual a 2022?

# qual foi a nota media dos filmes em 2020?
mean(imdb_2020$nota_imdb)

# qual foi a nota media dos filmes em 1970

imdb_1970 = filter(imdb_limpo, ano == 1970)
mean(imdb_1970$nota_imdb)

imdb_decada_de_70 = filter(imdb_limpo, 1970 <= ano, ano <= 1979)
# alem do sinal de comparacao "==" que vimos antes agora temos o sinal
# de comparacao "<="

# o que filter é
# 1. uma tabela (primeiro parametro da funcao)
# 2. condicoes sobre as colunas
# na pratica, o R vai olhar parametro por parametro, depois da tabela,
# vai entender que eu quero manter na filtragem só
# linhas que passarem pelo criterio que eu defini
# duas definicoes "<=" ou "=="

# tem !=, tem >=, >, <

imdb_nao_infles = filter(imdb_limpo, idioma != "English")
# != quer dizer diferente

imdb_longos_ultimos_20_anos = filter(imdb_limpo, duracao > 190, ano >= 1950)
imdb_longos_ultimos_20_anos_lucro = mutate(imdb_longos_ultimos_20_anos, lucro = receita-orcamento)
