#                       115 120
#datoteka, kjer imamo teste za lastnosti;
#-recurrent
#-ergodic
#-null-recurrent

#poleg tega pure death in pure birth process


porazdelitve <- c(rnorm,rexp,rcauchy,rlnorm)

#problem je, ker ne moremo imeti neskončnega vektorja, zato bomo izvedli teste
#razširjen Bertrandov test

rojstva <- function(stevilka_porazdelitve,st_korakov){
  #st_korakov pove, koliko rojstev bomo imeli
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

#enako kot za rojstva
smrti <- function(stevilka_porazdelitve,st_korakov){
  #st_korakov pove, koliko smrti bomo imeli
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

#vrne čas izumrtja
pure_death_homogen <- function(zacetno,st_smrt){
  smrt <- smrti(st_smrt,zacetno)
  return(sum(smrt))
} 

#vrne čas izumrtja pri ne nujno homogenem procesu
pure_death <- function(zacetno){
  smrt <- seq(1:zacetno)
  for(i in 1:zacetno){
    stevilka <- sample(1:length(porazdelitve),1)
    smrt[i] <- abs(porazdelitve[[stevilka]](1))
  }
  return(sum(smrt))
} 

#vrne čas
pure_birth <- function(zacetno,st_rojstvo){
  stevec <- zacetno
  cas <- 0
  while(stevec < zacetno^4){
    stevilka <- sample(1:length(porazdelitve),1)
    cas <- cas + abs(porazdelitve[[stevilka]](1))
    stevec <- stevec + 1
  }
  cas
  stevec
  seznam <- list(cas, stevec)
  return(seznam)
}
