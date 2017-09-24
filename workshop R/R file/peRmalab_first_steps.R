# Oficina introdutória de R
## baseado nos workshops de Andrew MacDonald & Alathea Lettuce, Vinicius Neres e mais...

## começando pelo começo!

## realizando operações matemáticas simples
2 + 2
2 * 3
3 ^ 10
4 / 5

## criando objetos
x <- 5
x * 2
x ^ 3

## realizando funções matemáticas de forma simples (usando objeto)
x ^ 10
log(x)
log10(x)
sin(30)

?sin

x > 2
x < 3
x == 5
x <- 1000
x

## hey! segue abaixo primeiro desafio!
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age
mass > age
age < mass


## tipos de dado

# lógico
a <- TRUE
b <- FALSE

# inteiro

c <- 5L # P: por que usei "L"? / R: porque, caso não use, ele será considerado como "double".
        # P: qual a diferença? para análise?/ R: quando se trabalha com muitos dados, reduz o consumo de memória


# double

d <- 5  # "double", assim como inteiro, é considerado "numérico" para o R.
        # Numérico é o modo de entrada (numérico x fator), double ou inteiro é a classe.

# número complexo

e <- 1 + 2i # a+bi, onde a e b são números reais e "i" é a unidade imaginária!
e

# caracter

f <- "categoria"

## qual tipo de dados eu tenho aqui?
typeof(c)
typeof(d)

is.integer(c)
is.double(c)
is.character(c)
is.logical(c)
is.complex(c)


## qual a diferença entre "numeric" e "double"?

x <- c(5, 6, 7, 8)
y <- c(5L, 6L, 7L, 8L)
x
y
is.numeric(x)
is.numeric(y)
typeof(x)
typeof(y)
is.double(x)
is.double(y)



## Estrutura dos dados

# Vetor

vec1 <- vector("character")
vec2 <- vector("character", length = 5)

vec3 <- c(1, 2, 3, 4, 5)
vec3

vec4 <- c(0:100)
vec4

vec5 <- seq(0, 100, by = 0.5)
vec5

vec6 <- c(TRUE, 10L, "cat")
vec6
typeof(vec6)

as.double(vec6)

## Obtendo informação sobre a estrutura de um objeto

x <- 0:10000

length(x)
str(x)  #obtém a estrutura compacta do objeto
head(x) #head informa os 6 primeiros números do vetor
tail(x) #tail informa os últimos 6 números do vetor 


#passo além na criação de vetores
idades <- c(23, 24, 25, 32, 49)
idades

#função "names" define as variáveis
names(idades) <- c("Juliana", "Aline", "Carlos", "Cintia", "Marcos")

idades

typeof(idades)

idades2 <- c(23, 24, 25, 32, 49)
idades2

typeof(idades2)


## Matrizes

x <- matrix(1:10, nrow = 5, ncol = 2)
x
str(x)

#inserir nomes nas colunas e linhas
rownames(x) <- c("a", "b", "c", "d", "e")
colnames(x) <- c("a", "b")
x

#Gerando números aleatórios de uma distribuição normal
x <- matrix(rnorm(18), nrow = 6, ncol = 3)
length(x)
x

# Gerando matrizes de acordo com diferentes parâmetros
x <- matrix(1:50, nrow = 10)
x

# Gerando os dados, mas distribundo os valores por linha (byrow=TRUE)
x <- matrix(1:50, ncol = 5, byrow = TRUE)
x

# TRUE = T...
x <- matrix(1:50, ncol = 5, byrow = T)
x

#... Mas podemos manipular quando a verdade não está clara!!
T <- FALSE
x <- matrix(1:50, ncol = 5, byrow = T)
x

#Tentando alterar TRUE
TRUE <- FALSE
TRUE <- 5


## definir variáveis como Fatores
x <- factor(c("yes", "no", "yes", "yes"))
x
typeof(x)
str(x)

x <- factor(c("case", "control", "control", "case"), levels = c("control", "case"))
x

str(x)

x <- matrix(1:50, nrow = 10)
str(x)

typeof(x)

y <- 1:50
typeof(y)
str(y)

## Listas: contém múltiplos tipos de dados

x <- list(1, "a", TRUE, 5L) # double, caracter, lógico e inteiro
x

xlist <- list(name = "Iris Data", nums = 1:10, data = head(iris)) #usando dados do dataset ïris"
xlist

## Data Frame

df <- data.frame(a = c(1, 2, 3), b = c("a", "b", "c"), c = c(TRUE, FALSE, FALSE))
df

## adicionano linhas e colunas ao data frames

rbind(df, df)
cbind(df, df)

## combinar dois datasets
df1 <- data.frame(firstname = "Manoel",
                  lastname = "Silva",
                  age = 31)

df2 <- data.frame(firstname = "Maria",
                  lastname = "Santos",
                  age = 30)

total <- rbind(df1, df2)
str(total)

### filtrar subconjunto (subsetting)
#### selecionar partes específicas de um grupo de dados

#criar o grupo de dados "x"
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x
typeof(x)
is.double(x)
is.numeric(x)

x[1]
x
x[3]

c(3, 5)
x[c(3, 5)]

x[2:4]

x[c(1, 1, 1, 4)]
x[10]

x[5:1]

## retirar elementos
x[-1]
x[-c(2, 4)]
x[c(-2, -4)]

-c(2,4)

## diferentes formas de entrar com a mesma informação
# Selecionar apenas:
# b   c   d 
# 6.2 7.1 4.8 

x[2:4]
x[c(2,3,4)]
x[-c(1, 5)]
x[c("b", "c", "d")]
x[c(FALSE, TRUE, TRUE, TRUE, FALSE)]

## subgrupo por nome
x["a"]

is_it_b <- names(x) == "b"
x[is_it_b]

## vamos explorar infos específicas
#lógica baseadas nas ocorrências dos dados especificados
names(x) %in% c("b", "c", "d")

names(x)

#informação completa do grupo de dados especificado
x[names(x) %in% c("b", "c", "d")]

### condicionantes múltiplas
a <- 1:10
a
a > 7 #informação lógica

#informação numérica
a[a > 7]
a[a < 7]
a[a <= 7]

TRUE & TRUE
FALSE & FALSE
TRUE & FALSE

c(TRUE, FALSE) | c(FALSE, TRUE)

#operação com intervalhos
1:5 * 2
1:5 * 1:5



###### Desafio 1

x
## escreva um comando que faça retornar valores contido em x que sejam maiores que 4 e menores que 7

x[x > 4 & x < 7]
a <- x > 4
b <- x < 7
a
b
a & b
x[a & b]
as.character(100)

#as.numeric(FALSE)
#as.numeric(TRUE)

#as.logical(0)
#as.logical(200000)

## quantas variável em x são maiores que 6???
as.numeric(x > 6)

sum(x > 6)
x & FALSE

## matrices
#set.seed define previamente a uma função que você quer números aleatórios gerados apenas uma vez.
set.seed(1)

m <- matrix(rnorm(6*4), ncol = 4, nrow = 6)
m

## primeiras 3 linhas
## colunas 2 e 3
m[1:3, c(2, 3)]
m[,3]
m[3, ]
m[1:2,]
m

## subsetting lists
xlist <- list(a = "workshop", b = 1:10, c = head(iris))
xlist

xlist[1]
xlist["a"]
xlist$a
xlist[[1]]
xlist[["a"]]

uni1 <- xlist[1] 
uni2 <- xlist[[1]] #converte em caracter
uni1
uni2
typeof(uni1)
typeof(uni2)

newobj <- xlist[["b"]]
newobj[2]
xlist[["b"]][2]

## importar dados
gapminder <- read.csv("gapminder.csv")

#resumão dos dados
str(gapminder)

#listar dados completos
gapminder[ ,"pop"]
gapminder$pop
gapminder[["pop"]]

#listar apenas as linhas 1 e 2
gapminder[1:2, ]

#criar objeto contendo apenas dados do Brasil
BRASIL <- gapminder$country == "Brazil"

#
gapminder[BRASIL,]


## "plotar" gráficos
library(ggplot2)

## Expectativa de vida e PIB (GDP)
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) + geom_point()

## PIB ao longo do tempo
ggplot(data = gapminder, aes(x = year, y = gdpPercap)) + geom_point()

## definir cor por país 
ggplot(data = gapminder,
       aes(x = lifeExp,
           y = gdpPercap,
           color = country)) +
  geom_point()

## gráfico de linha
ggplot(data = gapminder,
       aes(x = year,
           y = lifeExp,
           color = country)) +
  geom_line() +
  geom_point()

## gráfico de linha com algumas modificações
ggplot(data = gapminder,
       aes(x = year, y = lifeExp)) +
  geom_line(aes(colour = country)) + 
  geom_point(color = "blue")

## trocar ordem das cores
ggplot(data = gapminder,
       aes(x = year, y = lifeExp))  + 
  geom_point(color = "blue") +
  geom_line(aes(colour = country))

## tranformações e estatística

#Modelo Linear de PIB e expect. de vida total
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() +
  scale_y_log10() + 
  stat_smooth(method = "lm")

#Modelo Linear do PIB e exp. de vida entre continentes
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent)) +
  geom_point() +
  scale_y_log10() + 
  stat_smooth(method = "lm")

#selecionar apenas dados acima de 1990
gm90 <- gapminder[gapminder$year > 1990, ]
head(gm90)

# LM da expectativa de vida e PIB
ggplot(gm90, aes(x = lifeExp, y = gdpPercap)) + 
  geom_point() +
  scale_y_log10() +
  geom_smooth(method = "lm") +
  facet_grid(continent~year)

