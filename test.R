# test funkcij                        115 120

#datoteka namenjena testiranju funkcij. 
#tu je zbran del testa 

n <- 5
m <- 9
dat <- sample(c(0,1), replace=TRUE, size=n^2)
mdat <- matrix(dat,nrow = n, ncol= n)
mdat
celotna_igra(m, mdat)
