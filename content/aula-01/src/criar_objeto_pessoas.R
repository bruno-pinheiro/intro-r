# Criar variável nome
nome <- sample(x = babynames::babynames$name,
               size = 30, replace = TRUE)
# Criar variável nome
sexo <- sample(x = c("Homem", "Mulher"),
               size = 30, replace = TRUE)
# Criar variável sexo
raça <- sample(x = c("Preta", "Branca", "Índio", "Amarela"),
               size = 30, replace = TRUE, prob = c(.50, .40, .06, .04))
# Criar variável idade
idade <- sample(x = 18:29, size = 30, replace = TRUE)
# Criar variável nota
nota_governo <- sample(x = 0:10, size = 30, replace = TRUE)

# Juntar tudo em um data frame
pessoas <- data.frame(nome, sexo, raça, idade, nota_governo)

# Excluir variáveis isoladas
rm(nome, sexo, raça, idade, nota_governo)

library(ggplot2)
qplot(data = pessoas, idade, geom = "bar", position = "count")

write.csv(pessoas, "content/aula-01/dados/pessoas.csv", row.names = FALSE)

df <- read.csv("content/aula-01/dados/selecionadas.csv", stringsAsFactors = FALSE)

length(unique(df$AreaPonderacao))

df <- df %>%
  filter(AreaPonderacao %in% sample(df$AreaPonderacao, size = 5)) %>%
  select(Raca, Sexo, EstadoCivil, NumPessoasFam, IdadeAnos,
         RendTrabPrinc, RendTrabDemais, RendOutrasFontes)

write.csv(df, "content/aula-01/dados/aula01.csv", row.names = FALSE)
names(df)


ggplot(df, aes(x = IdadeAnos, y = RendTrabPrinc + RendTrabDemais)) +
  geom_count(aes(col = Sexo), alpha = .4) +
  facet_wrap(~ Sexo, ncol = 2)

ggplot(df, aes(x = NumPessoasFam, y = RendTrabPrinc + RendTrabDemais)) +
  geom_count()

df %>% slice(1:10)

df %>%
  group_by(NumPessoasFam) %>%
  summarise(media = mean(RendTrabPrinc + RendTrabDemais, na.rm = T)) %>%
  ggplot() +
  geom_bar(aes(x = NumPessoasFam, y = media), stat = "identity")

df %>%
  count(Raca) %>%
  ggplot() +
  geom_bar(aes(x = Raca, y = n), stat = "identity")

df %>%
  count(Sexo) %>%
  mutate(prop = prop.table(n)) %>%
  ggplot() +
  geom_bar(aes(x = Sexo, y = prop), stat = "identity")


df <- df %>%
  mutate(DecRendMensalTotal = recode(DecRendMensalTotal,
                                    "D1" = "D01", "D2" = "D02",
                                    "D3" = "D03", "D4" = "D04",
                                    "D5" = "D05", "D6" = "D06",
                                    "D7" = "D07", "D8" = "D08",
                                    "D9" = "D09"))



df %>%
  group_by(DecRendMensalTotal) %>%
  count(Sexo) %>%
  mutate(prop = prop.table(n)) %>%
  ggplot() +
  geom_bar(aes(x = DecRendMensalTotal, y = prop, fill = Sexo), stat = "identity")

df %>%
  group_by(DecRendMensalTotal) %>%
  count(Sexo) %>%
  mutate(n = prop.table(n))

df %>%
  group_by(DecRendMensalTotal) %>%
  summarise(max = max(RendTrabPrinc))


df <- df %>% 
