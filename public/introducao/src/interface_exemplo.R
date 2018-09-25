# Criar variáveis numéricas
x <- rnorm(n = 100, mean = 0, sd = 1)
y <- rnorm(n = 100, mean = 3, sd = 1.2)

# Criar variável categórica
z <- sample(c("Bonito", "Feio"),
            size = 100, replace = TRUE,
            prob = c(.2, .8))

# Unir em data frame
df <- data.frame(x, y, z)

# Plotar com a base do R
plot(df$x, df$y, col = df$z, pch = 20)
legend(0, 8, legend=c("Bonito", "Feito"),
       col=c("black", "red"), pch=20, cex=0.8,
       box.lty = 0, horiz = TRUE)

# Plotar com ggplot
library(ggplot2)
qplot(data = df, x, y, col = z)
