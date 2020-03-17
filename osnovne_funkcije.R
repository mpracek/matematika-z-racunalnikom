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
porazdelitve <- c(rnorm,rexp,rcauchy,rlnorm,rbeta,rbinom,dgamma,dgeom,dhyper)


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
stevilo <- function(zacetno,st_korakov,st_rojstvo,st_smrt){}
  smrt <- smrti(st_smrti,st_korakov)
  rojstvo <- rojstva(st_rojstvo,st_korakov)
  cumsum(smrt), cumsum(rojstvo)
  
    

#ugotovi kako naredit stacionarnost
