library(ggplot2)
pesq_prof <- read.csv("pesq_prof.csv")

ggplot(pesq_prof, aes(x=Area)) + geom_histogram(stat='count')
graf <- ggplot(pesq_prof, aes(x=Área)) + geom_histogram(stat='count')

print(graf)

graf2 <- graf + geom_histogram(data=subset(pesq_prof,Área=="Geometria"),
                               stat="count", fill="darkblue")

print(graf2)

ggsave("fig3-1.png",device="png",dpi = 300)
ggsave("fig3-1.pdf",device="pdf", width = 10, height = 8)

#Organização por camadas do R
ggplot(pesq_prof, aes(Peso, Altura)) + geom_point()
ggplot(pesq_prof, aes(Peso, Altura, colour=Sexo)) + geom_point()
ggplot(pesq_prof, aes(Peso, Altura, colour=Sexo, size=Peso)) + geom_point()
graf_disp <- ggplot(pesq_prof, aes(Peso, Altura, colour=Sexo)) + geom_point() + geom_smooth(method = lm)
print(graf_disp)
graf + xlab("legenda em x - Peso") + ylab("legenda em y - Altura") + xlim(0,110) + ylim(0, 200)

#Facetamento
ggplot(pesq_prof, aes(Peso, Altura, colour=Sexo, size=Peso)) + geom_point() + facet_wrap(~Área)
