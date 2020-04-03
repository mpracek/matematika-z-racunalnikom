#cakalne vrste              115 120
#v tej datoteki je matematika za cakalne vrste


#Tukaj bo le groba predstavitev, saj ima Andraž Pirnovar bolj natnačno zastavljeno temo
#čakalnih vrst, in  bom zato sam le malo opisal povezavo.

#pokazal bom le vizualizacijo in osnovo matematike za mm1

#stevilo ljudi v cakalnih vrstah?
#tuki zelim animacijo ljudi v cakalnici, cakalnih vrstah

#funkcije bodo podobne kot pri osnovnih, a malo prirejene

#pri čakalnih vrstah so pomembna vrednosti:
#-št oken
#-hitrost na vsakem oknu
#-hitrost prihoda ljudi

porazdelitve <- c(rnorm,rexp,rcauchy,rlnorm) #,rbeta,rbinom,dgamma,dgeom,dhyper)

prihodi <- function(stevilka_porazdelitve,st_korakov){
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

odhodi <- function(stevilka_porazdelitve,st_korakov){
  rezultat <- abs(porazdelitve[[stevilka_porazdelitve]](st_korakov))
  return(rezultat)
}

# mm1 <- function(zacetno,st_korakov,cas,st_prihod,st_odhod){
#   #zacetno je tu lahko 0, gibanje se tudi ne konca, ko dosezemo 0
#   #tukaj bolj primerno da gledamo obravnave, odvisne od časa.
#   
#   #cas je naceloma primeren, npr 100
#   
#   #st_korakov je tu neka poljubna visoka stevilka, npr. 1000
#   gibanje <- rep(zacetno,2*st_korakov)
#   prihod <- rep(0,st_korakov)
#   odhod <- rep(0,st_korakov)
#   cas_prihoda <- cumsum(prihodi(st_prihod,st_korakov))
#   cas_odhoda <- cumsum(odhodi(st_odhod,st_korakov))
#   cas <- 0
#   
#   }


#tukaj bomo delali s knjižnjico queueing

#primer iz PDF o knjjiznjici
#za mm1
#i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0) postavimo parametre
#o_mm1 <- QueueingModel(i_mm1) zgradimo nov model
#L(o_mm1) povprečje vseh ljudi 
#Lq(o_mm1) povprečje čakajočih v nekem trenutku
#Lqq(o_mm1) povprečje čakajočih ko kdo čaka
#Pn(o_mm1) verjetnost, da vidimo n čakajočih
#Qn(o_mm1) nov prihod vidi pred sabo n čakajočih
#Report(o_mm1) poročilo o rezultatih mm1
#RO(o_mm1) poročilo o porabi serverja
#VN(o_mm1) varianca ljudi
#VN(o_mm1) vairanca čakajočih v nekem trenutku
#VT(o_mm1) varianca časa poteka modela
#VTq(o_mm1) varianca časa čakanja v vrsti
#W(o_mm1) povprečje časa poteka modela
#Wq(o_mm1) povprečje časa čakanja v vrsti


#https://cran.r-project.org/web/packages/queueing/queueing.pdf

i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)
o_mm1 <- QueueingModel(i_mm1)


