# 115 120
# v tej datoteki bodo funkcije, ki bodo določile razmnoževanje
# zanima nas hitrost rojstev, zanima nas torej kako hitro se bo nek posameznik delil


#porazdelitvena je porazdelitvena fukcija, ki nam pove kako hitri so "prihodi",
#torej kako hitro se posameznik deli
#rezultat, ki ga porazdelitvena da, bo čas, po katerem se posameznik deli
#parameter1, parametra2, parametra3 so možni parametri porazdelitvene funkcije
#zaenkrat imamo le homogene procese (torej so časi enako porazdeljeni)

#porazdelitve bodo lahko izbrane iz spodenjega seznama, potrebujemo pa obliko rxxxx, 
#kjer xxxx označuje neko porazdelitev

#porazdelitve so lahko zvezne ali diksretne, zanima nas le, čez koliko časa bo delitev
#cas rojstva in smrti moramo steti neodvisno drug od drugega;
#gledamo delne vsote 

#najprej generiramo vektor
porazdelitve <- c(rnorm,rexp,rcauchy,rlnorm) #,rbeta,rbinom,dgamma,dgeom,dhyper)


#uredi, da bo lahko več parametrov
rojstva <- function(stevilka_porazdelitve,st_korakov){
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

#enako kot za rojstva
smrti <- function(stevilka_porazdelitve,st_korakov){
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

#stevilo osebkov
#stevilo osebkov je odvisno od začetnega stevila osebkov, porazdelitev rojstev in smrti
#zacetno stevilo je koncno stevilo ob prejsnjem casu
#prejsnji cas je cas prejsnje smrti/rojstva
#gledamo delne vsote casov; ce je vsota casov rojstev do cetrtega manjsa od casa prve smrti,
#bomo torej imeli zacetno stanje + 4, nato se -1 (po smrti)


#cumsum za delne vsote
#zanima nas le gibanje do stevila korakov, ker bomo tako dobili resnično gibanje
#ko dobimo 0 je populacija izumrla
stevilo <- function(zacetno,st_korakov,st_rojstvo,st_smrt){
  vektor_gibanja <- rep(0,100)
  vektor_gibanja[1] <- zacetno
  smrt <- cumsum(smrti(st_smrt,st_korakov))
  rojstvo <- cumsum(rojstva(st_rojstvo,st_korakov))
  zadnje_rojstvo <- 1
  zadnja_smrt <- 1
  st_osebkov <- zacetno
  for(i in 2:st_korakov){
    if(smrt[zadnja_smrt]<rojstvo[zadnje_rojstvo]){
      vektor_gibanja[i] <- vektor_gibanja[i-1] - 1
      zadnja_smrt <- zadnja_smrt + 1}
    else{
      vektor_gibanja[i] <- vektor_gibanja[i-1] + 1
      zadnje_rojstvo <- zadnje_rojstvo + 1}
    }
  return(vektor_gibanja)
} 
 
#ta funkcija nam da delitev, ko imamo izumrtje 
#dobimo tudi čas izumrtja
izumrtje <- function(zacetno,st_korakov,st_rojstvo,st_smrt){
  if(0 %in% stevilo(zacetno,st_korakov,st_rojstvo,st_smrt) == TRUE){
    koncni_indeks <- which(stevilo(zacetno,st_korakov,st_rojstvo,st_smrt) == 0)[1]}
  else{
    koncni_indeks <- st_korakov}
  if(is.na(koncni_indeks) == TRUE){
    koncni_indeks <- st_korakov
  }
  koncni_cas <- cumsum(smrti(st_smrt,st_korakov))[koncni_indeks]
  povratek <- list("korak_konca" = koncni_indeks, "cas_konca" = koncni_cas )
  return(povratek)
}    

#porazdelitev izumrtja
#generiramo veliko število procesov

generacija <- function(zacetno,st_korakov,st_rojstvo,st_smrt){
  n <- 10000
  casi <- rep(0,n)
  indeksi <- rep(0,n)
  for(i in 1:n){
    casi[i] <- izumrtje(zacetno,st_korakov,st_rojstvo,st_smrt)$cas_konca
    indeksi[i] <- izumrtje(zacetno,st_korakov,st_rojstvo,st_smrt)$korak_konca
  }
  hist(casi, breaks = 1000)
  hist(indeksi, breaks = 100)
  casi
}
