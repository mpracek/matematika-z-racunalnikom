# test funkcij                        115 120

#datoteka namenjena testiranju funkcij. 
#tu je zbran del testa 

n <- 5
m <- 9
dat <- sample(c(0,1), replace=TRUE, size=n^2)
mdat <- matrix(dat,nrow = n, ncol= n)
X = array(sample(c(0,1), replace=TRUE, size=n^3), dim=c(n,n,n)) 
mdat
celotna_igra(m, mdat)

staticno1<- c(0, 1, 1, 0,
              1, 0, 0, 1,
              0, 1, 1, 0)
staticno2 <- c(0,1,0,1,0,1,1,0,1,0,1,0)
mdat <- matrix(staticno1,nrow = 3, ncol= 4)
mdat2 <- matrix(staticno2,nrow = 3, ncol= 4)

celotna_igra(m, mdat)

blinker <- c(0,1,0, 1, 0, 1)
data <- data.frame(c(0,1,0),c(1,0,1))
mdat <- matrix(blinker,nrow = 2, ncol= 3)
celotna_igra(m, mdat)

narisi_igro(10,mdat)
a<-narisi_igro(10,mdat2)
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

#animacija
rezultat <- stevilo(3,10,1,1)
koraki <- c(1:10)
cas <- c(1:10)
podatki <- data.frame(koraki, rezultat, cas)
fig <- plot_ly(podatki, 
    x = ~koraki, 
    y = ~rezultat,
    frame = ~cas,
    type = 'scatter',
    mode = 'points+line')
fig

animacija_obicajna(10,100,2,1)

#risanje za README
ts.plot(stevilo(10,100,3,1),type = "s",
        xlab = "Korak", ylab = "Velikost populacije",
        main = "Velikost populacije skozi čas")

