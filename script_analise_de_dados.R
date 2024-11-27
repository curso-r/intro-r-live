# meu primeiro comando: leitura de arquivos

tabela = read.csv("https://raw.githubusercontent.com/curso-r/main-r4ds-1/refs/heads/master/dados/imdb.csv")

# outros comandos uteis: contas matemáticas

1+1
2+2
3/2
4*2

# tem um "padrao" pra selecionar coluna de tabelas lidas com read.csv

tabela$orcamento

# suponha que a gente quer passar o orcamento para milhoes de dolares

tabela$orcamento/1000000

# e se eu quiser criar uma coluna?
# voce pode! do mesmo jeito

tabela$orcamento_milhoes = tabela$orcamento/1000000

# outros comandos uteis: aqueles que pegam colunas e devolvem numeros, sumarios e tal

#media
mean(tabela$orcamento_milhoes)
# mean se tiver dado faltante nao retorna nada, retorna "NA"

# para desconsiderar os faltantes
mean(tabela$orcamento_milhoes, na.rm = TRUE)

# poderiamos guardar esse numero pra usar depois (em contas)
# ou pra salvar o resultado fora do R (tipo numa tabela)

orcamentoMedio = mean(tabela$orcamento_milhoes, na.rm = TRUE)
# novamente criamos um objeto!
# toda vez que a gente escreve "=" o R entende que deve "guardar pra depois"
# o conteudo do comando à direita do "="

#mediana
orcamentoMediano = median(tabela$orcamento_milhoes, na.rm = TRUE)

#maximo
orcamentoMaximo = max(tabela$orcamento_milhoes, na.rm = TRUE)

#minimo
orcamentoMinimo = min(tabela$orcamento_milhoes, na.rm = TRUE)

# aprendemos:
# como ler uma tabela: "read.csv"
# como mandar o R "guardar" o resultado de um comando em um "objeto":
# NOME = comando
# a pegar colunas de tabelas:
# tabela$nome_da_coluna
# aprendemos a fazer mean, median, max, min

# o R traz erros!

orcamentoMedio+1
# isso aqui está certo

"orcamentoMedio"+1
# isso aqui dá erro!

# contas (+, -, /, *, ^ etc) nunca podem envolver textos
# textos sao coisas que eu escrevo no script entre ""
"a"
'b'

# posso salvar textos em objetos sem problema

texto_exemplo = "a"
texto_exemplo2 = 'b'

# o ideal é colocar entre "" apenas conteudos que a gente quer armazenar
# no R literalmente

# no R todos os objetos tem tipo
# em particuar, as colunas (que moram dentro de tabelas)
# tem tipos. Texto é um deles

# nova ideia
# todo objeto dentro do R tem tipo:

# tipos mais comuns, iniciais:

# chr, ou character que é um texto literal entre aspas (" ou ')
# int, ou integer que é um número inteiro, sem vírgula
# num, ou numeric que é um número quebrado, com vírgula

# criando objetos texto

meu_texto = "a"

# criar objetos inteiros

meu_inteiro = 1L

# criar objetos numero quebrado

meu_quebrado = 1.12

# R pode dar erros as vezes:

meu_texto = "a"
# isso poderia dar erro!

# voce dar um nome invalido pro teu objeto

# quais saos os nomes invalidos mais serios:

1texto = "a"
# se a linha do comando começa com um numero o R entende
# que vc vai querer fazer conta com ele, então nao pode usar nomear objeto

texto1 = "a"
# isso aqui pode, o contrário que nao (numero antes de texto)

_texto = "a"
# nao pode

texto_legal = "a"
# isso pode!

# Observação importante
# se o nome de um objeto (que sou eu que dou)
# for formado por várias palavras, eu vou separa-las
# por "_"

orcamentoMedio
# nao esta usando a convenção

# se usasse, seria mais facil de ler:
orcamento_medio
# estamos acostumados a ter espaço entre palavras

#usar "-" ou "+" ou "/" etc nos nomes

orcamento-medio = 12
# erro comum: tentar usar underline e nao apertar shift
# erro chato: "orcamento" not found é porque o R
# achou que vc queria falar de um objeto chamado "orcamento"
# foi no environment (prateleira dos objetos)
# nao achou
# e te devolve o erro "nao achei"
# o R acha que vc quer
# orcamento (objeto) MENOS (-) medio (objeto)
# nenhum dos dois existe
# por isso nao funciona

# coisas que pode "a vontade", mas tenta nao abusar

MaXiMo = 10

MaXi_Mo_1 = 20

# EU:

# evito maisculas
# uso sempre _
# gosto de nomes grandes

# perguntas sobre tipos de objetos

# como eu faço para descobrir um tipo?

# usamos o comando class

class(meu_texto)
# devole o tipo

class(meu_inteiro)

class(texto_exemplo)

# até tabelas tem tipo...
class(tabela)

# data.frame é o "tipo" das nossas tabelas

class(tabela$id_filme)
class(tabela$ano)

# é possivel que dentro de uma coluna tenha entradas com tipos diferentes?
# tipo no Excel

# resposta é NAO!!!!

# porque colunas de tabelas (tabela$NOME) sao sempre vetores
# no R, e vetores no R exigem que os elemetos tenham o mesmo

# Vetores

numeros = c(2, 3, 4, 6, 5, 1)
# esse é o esquema de criação de uma coluna no R
# as colunas das tabelas foram criadas assim
# pelo comando read.csv

class(numeros)

# agora vem o pulo do gato, como o read.csv usou c
# se no arquivo bruto (.csv) tiver celular de tipo diferente
# o R vai dar o jeito dele

coluna = c(1, 2, 3, 4, "a")
# vai dar erro???
# nao

class(coluna)

# o R "força" que todas as colunas das tabelas que a gente
# le tenham entradas do mesmo tipo

# se tiver pelo menos um texto, tudo vira texto
# se tiver só numero, ai a coluna é numero
# se tiver pelo menos um quebrado, ai nao pode ser inteiro etc

# como eu faço para arrumar um tipo incorreto?

coluna_numero <- as.numeric(coluna)
