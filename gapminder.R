library("gapminder")
library("ggplot2")

#aprendendo com a documentação do gapminder
graf <- ggplot(gapminder, aes(x = continent, y = lifeExp)) + geom_boxplot(outlier.colour = "hotpink")+geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)
print(graf)

#Cap 3 - Finalizado
p <- ggplot(data=gapminder, mapping = aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) + 
  geom_point() + 
  coord_cartesian() + 
  scale_x_log10() + 
  labs(x = "log GDP", y = "Life Expectancy", title = "A Gapminder Plot")
print(p)

#Criando camadas
g <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
g <- g + geom_point() + geom_smooth(method = "lm")
print(g)

#Criando camadas 2
g <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
g <- g + geom_point() + geom_smooth(method = "gam") + scale_x_log10()
print(g)

#Criando camadas 3
g <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
g <- g + geom_point() + 
  geom_smooth(method = "gam") + 
  scale_x_log10(labels = scales::dollar)
print(g)

#Mapping Aesthetics vs Setting them
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = "purple"))
h <- h + geom_point() + geom_smooth(method = "loess") + scale_x_log10()
print(h)

#Mapping Aesthetics vs Setting them 2
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
h <- h + geom_point( color = "purple") + geom_smooth(method = "loess") + scale_x_log10()
print(h)

#Mapping Aesthetics vs Setting them 3
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
h <- h + geom_point(alpha = 0.3) + 
  geom_smooth(color = "orange", se = FALSE, size = 8, method = "lm") + 
  scale_x_log10()
print(h)

#Mapping Aesthetics vs Setting them 4
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
h <- h + geom_point(alpha = 0.3) + 
  geom_smooth(method = "gam") + 
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectany in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")
print(h)

#Mapping Aesthetics vs Setting them 5
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent))
h <- h + geom_point() + 
  geom_smooth(method = "loess") + 
  scale_x_log10()
print(h)

#Mapping Aesthetics vs Setting them 6
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent, fill = continent))
h <- h + geom_point() + 
  geom_smooth(method = "loess") + 
  scale_x_log10()
print(h)

#Mapping Aesthetics in geom
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
h <- h + geom_point(mapping = aes(color = continent)) + 
  geom_smooth(method = "loess") + 
  scale_x_log10()
print(h)

#Mapping Aesthetics in geom
h <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
h <- h + geom_point(mapping = aes(color = log(pop))) + 
  scale_x_log10()
print(h)

#Saving files
knitr::opts_chunk$set(fig.width = 8, fig.height = 5)
ggsave(filename = "saved.png")
