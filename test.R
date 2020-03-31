# test funkcij                        115 120

#datoteka namenjena testiranju funkcij. 
#tu je zbran del testa 

n <- 5
m <- 9
dat <- sample(c(0,1), replace=TRUE, size=n^2)
mdat <- matrix(dat,nrow = n, ncol= n)
mdat
celotna_igra(m, mdat)

#barvanje matrik
#to potebujemo za vizualizacijo igre življenja

plot(mdat, col = topo.colors)
plot(mdat)
plot(mdat, col = c("black","blue"))

#risanje grafov za Readme
plot(stevilo(50,100,3,1),
     xlab = "Korak",
     ylab = "Velikost populacije",
     main = "Velikost populacije skozi čas",
     type = "s")

