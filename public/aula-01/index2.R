
# adição
1 + 1 

# subtração
4 - 2


2 * 3 # multiplicação


5 / 2 # divisão


4 ^ 2 # potência


# criar vetores
x <- c(1, 2, 3, 4)
y <- c(2, 3, 5, 6)


x


y


# colocar em data frame
x + y


## Instalar pacote
# install.packages("tidyverse")


## Instalar o pacote devtools
# install.packages("devtools")

## Carregar o pacote devtools
# devtools::install_github("hadley/tidyverse")

## Carregar pacote
# library(devtools)

## Usar função
# install_github("hadley/tidyverse")


# 1. Importar os dados no R
df <- read.csv("dados/aula01.csv", stringsAsFactors = FALSE)


# 3. Visualizar o começo dos dados
head(df)


# 4. Visualizar o fim dos dados
tail(df)


head(df, n = 2)


tail(df, n = 2)


# desmarque a linha abaixo para rodar o comando
# head(df, 3)


# 2. Verificar a estrutura dos dados
str(df)


is.na(head(df))


# guardas as primeiras seis linhas
linhas <- head(df)
# visualizar
linhas

# investigar presença de NAs
is.na(linhas)


colSums(is.na(df))


library(dplyr) # para manipular os dados
library(ggplot2) # para visualizar os dados


names(df)


df %>% count(Raca)


df %>%
  # contar as categorias
  count(Raca) %>%
  # calcular a frequência relativa
  mutate(prop = prop.table(n))


# calcular as frequências
freq <- df %>%
  count(Raca) %>%
  mutate(prop = prop.table(n))
# visualizar
freq


ggplot(freq, aes(x = Raca, y = prop)) + # cria o canvas e define estética
  geom_bar(stat = "identity") # coloca o gráfico de barras


ggplot(freq, aes(x = Raca, y = prop, label = round(prop, 4))) + # cria o canvas
  geom_bar(stat = "identity") + # coloca o gráfico de barras
  geom_label() # coloca o rótulo


summary(df$NumPessoasFam)


# calcular as frequẽncias
freq <- df %>%
  # contar os valores
  count(NumPessoasFam) %>%
  # calcular a frequência relativa
  mutate(prop = prop.table(n))

# plotar o gráfico
ggplot(freq, aes(x = NumPessoasFam, y = prop)) +
  geom_bar(stat = "identity")


summary(df$RendTrabPrinc)


ggplot(df, aes(x = RendTrabPrinc)) +
  geom_histogram()


ggplot(df, aes(x = RendTrabPrinc)) +
  geom_histogram(bins = 25)  +
  scale_x_continuous(limits = c(0, 10000))


ggplot(df, aes(y = RendTrabPrinc)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 10000))


ggplot(df, aes(x = IdadeAnos, y = ..prop.., group = Sexo, fill = Sexo)) +
         geom_bar(position = "dodge")


ggplot(df, aes(x = IdadeAnos, fill = Sexo)) +
         geom_bar(position = "dodge")

