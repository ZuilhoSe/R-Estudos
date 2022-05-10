#combine() -> c()
v0 <- c(1,2,3)
print(v0)

#criação de sequencias
v1 <- 2:6
print(v1)

#replicate() -> rep()
v2 <- rep(0:3, times=3)
print(v2)

#aleatorios uniformes
v3 <- runif(10, 0, 10)
print(v3)

#ordenando
v4 <- sort(v3)
print(v4)

#criação de vetor com 20 valores e histograma
x <- 1:20
v5 <- sample(x, 50, replace=TRUE)
hist(v5)

media <- mean(v5)
print(media)
mediana <- median(v5)
print(mediana)
desvpad <- sd(v5)
print(desvpad)
quartis <- summary(v5)
print(quartis)
boxplot(v5)

