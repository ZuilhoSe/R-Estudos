library(tidyverse)
library(ggplot2)
library(scales)        # additional formatting for scales
library(grid)          # combining plots
library(gridExtra)     # combining plots
library(dplyr)         # tidy data manipulations
library(HistData)
library(ggrepel)
library(lubridate)
library(ggmap)
library(pander)


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
  geom_text_repel(data = Minard.cities, aes(label = city), color = "#DC5B44", family = "Open Sans Condensed Bold")
print(graf)
ggsave(filename = "minard_names_adjusted.png",
       width = 2000,
       height = 800,
       units = c("px"))

plot_troops_cities <- last_plot() #salvando o grafico com nomes pra uso em codigo

#Temperature
#Aqui vamos analisar a temperatura em cada longitude 
#que as tropas passaram.

temp <- ggplot(Minard.temp, aes(long, temp)) +
  geom_path(color="grey", size=1.5) +
  geom_point(size=2) 

print(temp)
ggsave(filename = "minard_temp1.png",
       width = 2000,
       height = 800,
       units = c("px"))

#colocando labels
Minard.temp <- Minard.temp %>%
  mutate(label = paste0(temp, "° ", date))
head(Minard.temp$label)

temp <- ggplot(Minard.temp, aes(long, temp)) +
  geom_path(color="grey", size=1.5) +
  geom_point(size=1) +
  geom_text(aes(label=label), size=2, vjust=-1)
print(temp)
ggsave(filename = "minard_temp2.png",
       width = 2000,
       height = 800,
       units = c("px"))

#ajustando labels
temp <- ggplot(Minard.temp, aes(long, temp)) +
  geom_path(color="grey", size=1.5) +
  geom_point(size=1) +
  geom_text_repel(aes(label=label), size=2.5)
print(temp)
ggsave(filename = "minard_temp2_adjusted.png",
       width = 2000,
       height = 800,
       units = c("px"))

plot_temp <- last_plot() #grafico de temp para uso em codigo

#Para finalizar, vamos juntar os dois graficos feitos
junto <- arrangeGrob(plot_troops_cities, plot_temp)
print(junto)
ggsave(filename = "minard_temp_troops.png", junto,
       width = 2000,
       height = 1600,
       units = c("px"))

#Vamos limpar um pouco o grafico de tropas e de temperatura
plot_troops_cities +
  coord_cartesian(xlim = c(24, 38)) +
  labs(x = NULL, y = NULL) +
  guides(color = FALSE, size = FALSE) +
  theme_void()

plot_troops_cities_fixed <- last_plot()  

plot_temp + 
  coord_cartesian(xlim = c(24, 38)) +
  labs(x = NULL, y="Temperature") + 
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.text.x = element_blank(), axis.ticks = element_blank(),
        panel.border = element_blank())

plot_temp_fixed <- last_plot()

grid.arrange(plot_troops_cities_fixed, plot_temp_fixed, nrow=2, heights=c(3.5, 1.2))
grid.rect(width = .99, height = .99, gp = gpar(lwd = 2, col = "gray", fill = NA))

junto <- arrangeGrob(plot_troops_cities_fixed, plot_temp_fixed)
print(junto)
ggsave(filename = "minard_temp_troops_fixed.png", junto,
       width = 2000,
       height = 1600,
       units = c("px"))

#Modificações para atender ao trabalho.

#Para fazer isso vamos ler um novo banco de dados
troops <- read.table("minard/troops.txt",
                     header = TRUE, stringsAsFactors = FALSE)
cities <- read.table("minard/cities.txt",
                     header = TRUE, stringsAsFactors = FALSE)

troops %>% head() %>% pandoc.table()

#Mapa da Europa
march.1812.europe <- c(left = -13.10, bottom = 35.75, right = 41.04, top = 61.86)
march.1812.europe.map <- get_stamenmap(bbox = march.1812.europe, zoom = 5,
                                       maptype = "terrain", where = "cache")
ggmap(march.1812.europe.map)


#Mapa mais cartonesco
march.1812.europe.map.wc <- get_stamenmap(bbox = march.1812.europe, zoom = 5,
                                          maptype = "watercolor", where = "cache")
ggmap(march.1812.europe.map.wc)

#Sobreposição do mapa com o gráfico de minard
march.1812.ne.europe <- c(left = 23.5, bottom = 53.4, right = 38.1, top = 56.3)

march.1812.ne.europe.map <- get_stamenmap(bbox = march.1812.ne.europe, zoom = 8,
                                          maptype = "terrain-background", where = "cache")

march.1812.plot <- ggmap(march.1812.ne.europe.map) +
  geom_path(data = troops, aes(x = long, y = lat, group = group,
                               color = direction, size = survivors),
            lineend = "round") +
  geom_point(data = cities, aes(x = long, y = lat),
             color = "#DC5B44") +
  geom_text_repel(data = cities, aes(x = long, y = lat, label = city),
                  color = "#DC5B44", family = "Open Sans Condensed Bold") +
  scale_size(range = c(0.5, 10)) +
  scale_colour_manual(values = c("#DFC17E", "#252523")) +
  guides(color = FALSE, size = FALSE) +
  theme_nothing()

march.1812.plot
