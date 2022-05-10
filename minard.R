library(tidyverse)
library(ggplot2)
library(scales)        # additional formatting for scales
library(grid)          # combining plots
library(gridExtra)     # combining plots
library(dplyr)         # tidy data manipulations
library(HistData)
library(ggrepel)

data(Minard.troops, package="HistData")
str(Minard.troops)

data(Minard.cities, package="HistData")
str(Minard.cities)

data(Minard.temp, package="HistData")
str(Minard.temp)

#Tentativa 1
minard <- ggplot(Minard.troops, aes(long, lat)) + 
  geom_path(aes(size = survivors))

print(minard)

ggsave(filename = "minard_1.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Tentativa 2
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group)) +
  coord_fixed()

print(minard)

ggsave(filename = "minard_2.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Desafios do site euclid - Only path
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path() +
  coord_fixed()

print(minard)

ggsave(filename = "minard_path.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Desafios do site euclid - Using geom point
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path() +
  coord_fixed() + 
  geom_point(aes(size=survivors))

print(minard)

ggsave(filename = "minard_geompoint.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Desafios do site euclid - Using geom point + color
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path() +
  coord_fixed() + 
  geom_point(aes(size=survivors, color=direction))

print(minard)

ggsave(filename = "minard_geompoint_color.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Minard Version
breaks <- c(1, 2, 3) * 10^5 
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group),
            lineend="round") +
  scale_size("Sobreviventes", range = c(1,10), #c(0.5, 15),
             breaks=breaks, labels=scales::comma(breaks)) +
  scale_color_manual("Direção", 
                     values = c("#e6cbad", "#1f1a1b"), 
                     labels = c("Avanço", "Retirada")) 
print(minard)
plot_troops <- last_plot()
ggsave(filename = "minard_3.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Mudando o tema
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group),
            lineend="round") +
  scale_size("Sobreviventes", range = c(1,10), #c(0.5, 15),
             breaks=breaks, labels=scales::comma(breaks)) +
  scale_color_manual("Direção", 
                     values = c("#e6cbad", "#1f1a1b"), 
                     labels = c("Avanço", "Retirada")) + theme_bw()
print(minard)
ggsave(filename = "minard_4.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Mudando a escala
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group),
            lineend="round") +
  scale_size("Sobreviventes", range = c(1,10), #c(0.5, 15),
             breaks=breaks, labels=scales::comma(breaks)) +
  scale_color_manual("Direção", 
                     values = c("#e6cbad", "#1f1a1b"), 
                     labels = c("Avanço", "Retirada")) + labs(x = NULL, y = NULL)
print(minard)
ggsave(filename = "minard_5.png",
       width = 2000,
       height = 800,
       units = c("px"))

#Tirando as legendas
minard <- ggplot(Minard.troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group),
            lineend="round") +
  scale_size("Sobreviventes", range = c(1,10), #c(0.5, 15),
             breaks=breaks, labels=scales::comma(breaks)) +
  scale_color_manual("Direção", 
                     values = c("#e6cbad", "#1f1a1b"), 
                     labels = c("Avanço", "Retirada")) + labs(x = NULL, y = NULL) + 
  guides(color = "none", size = "none") + theme_bw()
print(minard)
ggsave(filename = "minard_6.png",
       width = 2000,
       height = 800,
       units = c("px"))


#Cities
#colocando nomes
graf <- plot_troops + geom_text(data = Minard.cities, aes(label = city), size = 3)
print(graf)

#colocando pontos
graf <- plot_troops + geom_point(data = Minard.cities)
print(graf)

#colocando pontos e nomes
graf <- plot_troops + 
  geom_text(data = Minard.cities, aes(label = city), size = 3) +
  geom_point(data = Minard.cities)
print(graf)
ggsave(filename = "minard_names.png",
       width = 2000,
       height = 800,
       units = c("px"))

#É preciso ajustar a superposição
graf <- plot_troops +   
  geom_point(data = Minard.cities) +
  geom_text_repel(data = Minard.cities, aes(label = city))
print(graf)
ggsave(filename = "minard_names_adjusted.png",
       width = 2000,
       height = 800,
       units = c("px"))

plot_troops_cities <- last_plot() #salvando o grafico com nomes pra uso em codigo
