mtcars

print(names(mtcars))
print(nrow(mtcars))
print(ncol(mtcars))
print(dim(mtcars))

summary(mtcars$disp)
plot(mtcars$wt, mtcars$disp)

#trabalhando com uma fatia
reduzida <- mtcars[1:10, 3:7]
print(reduzida)

#lendo arquivos csv
pesq_prof <- read.csv("pesq_prof.csv")
names(pesq_prof)
summary(pesq_prof$Alunos)
