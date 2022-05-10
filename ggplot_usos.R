library(ggplot2)
pesq_prof <- read.csv("pesq_prof.csv")

ggplot(pesq_prof, aes(x=Área)) + geom_histogram(stat='count')
graf <- ggplot(pesq_prof, aes(x=Área)) + geom_histogram(stat='count')

print(graf)

graf2 <- graf + geom_histogram(data=subset(pesq_prof,Área=="Geometria"),
                              stat="count", fill="darkblue")

print(graf2)

ggsave("fig3-1.png",device="png",dpi = 300)
ggsave("fig3-1.pdf",device="pdf", width = 10, height = 8)