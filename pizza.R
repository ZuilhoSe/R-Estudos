library(ggplot2)

#Criando o gráfico 1
pie <- ggplot(mtcars, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) + coord_polar(theta = "y")

print(pie)

ggsave(filename = "pizza1.png",
       width = 2000,
       height = 2000,
       units = c("px"))

#Criando o gráfico 2
cxc <- ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(width = 1, colour = "black") 

print(cxc)

ggsave(filename = "barras2.png",
       width = 2000,
       height = 2000,
       units = c("px"))

#Criando o gráfico 3
cxc2 <- cxc + coord_polar(theta = "y")

print(cxc2)

ggsave(filename = "pizza3.png",
       width = 2000,
       height = 2000,
       units = c("px"))

#Criando o gráfico 4
eye <- pie + coord_polar()

print(eye)

ggsave(filename = "pizza4.png",
       width = 2000,
       height = 2000,
       units = c("px"))

#Criando o gráfico 5
  df <- data.frame(
    variable = c("does not resemble", "resembles"),
    value = c(20, 80))
  pacman <- ggplot(df, aes(x = "", y = value, fill = variable)) +
    geom_col(width = 1) +
    scale_fill_manual(values = c("red", "yellow")) +
    coord_polar("y", start = pi / 3) +
    labs(title = "Pac man")
  print(pacman)

ggsave(filename = "pizza5.png",
       width = 2000,
       height = 2000,
       units = c("px"))

#Criando o gráfico 6
movies$rrating <- cut_interval(movies$rating, length = 1)
movies$budgetq <- cut_number(movies$budget, 4)
  
doh <- ggplot(movies, aes(x = rrating, fill = budgetq))
  
doh1 <- doh + geom_bar(width = 1) + coord_polar()
print(doh1)

ggsave(filename = "pizza6.png",
       width = 2000,
       height = 2000,
       units = c("px"))

doh2 <- doh + geom_bar(width = 0.9, position = "fill") + coord_polar(theta = "y")
print(doh2)

ggsave(filename = "pizza7.png",
       width = 2000,
       height = 2000,
       units = c("px"))

