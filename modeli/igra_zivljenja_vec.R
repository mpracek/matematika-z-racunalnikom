# ###      115 120
# #igra življenja v več dimenzijah
# #najprej primer v 3D, nato bom pogladal možnosti naprej
# #"matriko" v več dimenzijah pripravimo z ukazom array
# # X = array(0, dim=c(100,12,12)) 
# 
# #sicer potrebujemo podobne funkcije kot v datoteki igra_zivljenja.R
# 
# #zaradi nejasnosti pri vizalizaciji bo tu poudarek na matematičnih in statističnih lasnostih
# 
# # 115 120
# 
# #V tej datoteki bo sprogramirana igra življenja
# #upoštevali bomo pravila, ki jih je določil že Conway
# 
# 
# #igra zivljenja je smrtno rojstni proces v zaprtem prostoru, ki ga bo predstavljala matrika
# 
# 
# #napisemo pravila za izvedbo igre zivljenja
# #Any live cell with two or three neighbors survives.
# #Any dead cell with three live neighbors becomes a live cell.
# #All other live cells die in the next generation. Similarly, all other dead cells stay dead.
# 
# 
# 
# #tu moram preveriti za vse sosede
# za_celico_3D <- function(matrika,vrstica,stolpec, globina){
#   #matrika je tu 3D, torej imamo še globino
#   #za vsako "celico" v naboru določimo, ali bo v prihodnjem koraku "mrtva" ali "ziva"
#   #ce je ziva, imamo v celici 1
#   #ce je mrtva, imamo v celici 0
#   dimenzije <- dim(matrika)
#   konec_vrstic <- dimenzije[1]
#   konec_stolpcev <- dimenzije[2]
#   konec_globine <- dimenzije[3]
#   #dimenzije potrebujemo za robne primere, tam moramo  paziti kako definiramo
#   #posebej pogledamo vse kote matrike ter preostale robove
#   
#   vrednost <- 0
#   #vrednost pove stevilo zivih sosedov vsake celice
#   
#   if(vrstica == 1 && stolpec == 1 && globina == 1){
#     vrednost <- matrika[1,2]+matrika[2,1]+matrika[2,2]
#     vrednost
#   }
#   else if(vrstica == 1 && stolpec == konec_stolpcev){
#     vrednost <- matrika[1,konec_stolpcev-1]+
#       matrika[2,konec_stolpcev-1]+matrika[2,konec_stolpcev-2]
#     vrednost
#   }
#   else if(vrstica == konec_vrstic && stolpec == 1){
#     vrednost <- matrika[konec_vrstic-1,1]+
#       matrika[konec_vrstic-1,2]+matrika[konec_vrstic,2]
#     vrednost
#   }
#   else if(vrstica == konec_vrstic && stolpec == konec_stolpcev){
#     vrednost <- matrika[konec_vrstic,konec_stolpcev-1] +
#       matrika[konec_vrstic-1,konec_stolpcev] + matrika[konec_vrstic-1,konec_stolpcev-1]
#     vrednost
#   }
#   else if(vrstica == 1){
#     vrednost <- matrika[vrstica,stolpec-1] + matrika[vrstica,stolpec+1] +
#       matrika[vrstica + 1,stolpec+1]+matrika[vrstica + 1,stolpec]+matrika[vrstica + 1,stolpec-1]
#     vrednost
#   }
#   else if(vrstica == konec_vrstic){
#     vrednost <- matrika[vrstica,stolpec-1] + matrika[vrstica,stolpec+1] +
#       matrika[vrstica-1,stolpec+1]+matrika[vrstica-1,stolpec]+matrika[vrstica-1,stolpec-1]
#     vrednost
#   }
#   else if(stolpec == 1){
#     vrednost <- matrika[vrstica - 1,stolpec] + matrika[vrstica + 1,stolpec] +
#       matrika[vrstica-1,stolpec+1]+matrika[vrstica-1,stolpec + 1]+matrika[vrstica-1,stolpec + 1]
#     vrednost
#   }
#   else if(stolpec == konec_stolpcev){
#     vrednost <- matrika[vrstica - 1,stolpec] + matrika[vrstica + 1,stolpec] +
#       matrika[vrstica-1,stolpec-1] + matrika[vrstica,stolpec - 1] + matrika[vrstica + 1,stolpec-1]
#     vrednost
#   }
#   else{
#     vrednost <- matrika[vrstica + 1, stolpec - 1] + matrika[vrstica + 1, stolpec] +
#       matrika[vrstica + 1, stolpec + 1] + matrika[vrstica, stolpec - 1] +
#       matrika[vrstica, stolpec + 1] + matrika[vrstica -1 , stolpec - 1] + 
#       matrika[vrstica - 1, stolpec] + matrika[vrstica - 1, stolpec + 1]
#     vrednost 
#   }
#   
#   
#   vrednost
#   
#   if(matrika[vrstica,stolpec] == 1 && vrednost %in% c(2,3)){
#     #živa celica z dvemi ali tremi živimi sosedi ostane živa
#     return(1)
#   }
#   else if(matrika[vrstica,stolpec] == 0 && vrednost == 3){
#     #mrtva celica z tremi živimi sosedi postane živa
#     return(1)
#   }
#   else{
#     #v naslednjem koraku bo ta celica mrtva, saj je ali:
#     #-okolica preveč nasičena
#     #-v okolici premalo ali nič življenja
#     return(0)
#   }
# }
# 
# za_matriko_3D <- function(matrika){
#   #za dano matriko dimenzij st_vrstic, st_stolpcev
#   #dolocimo naslednika
#   dimenzije <- dim(matrika)
#   konec_vrstic <- dimenzije[1]
#   konec_stolpcev <- dimenzije[2]
#   konec_globine <- dimenzije[3]
#   nova_matrika <- matrika
#   for(i in 1:konec_vrstic){
#     for(j in 1:konec_stolpcev){
#       for(k in 1:konec_globine){
#       nova_matrika[i,j] <- za_celico_3D(matrika,i,j)
#       }
#     }
#   }
#   return(nova_matrika)
# }
# 
# celotna_igra_3D <- function(st_korakov, zacetna_matrika){
#   #st_korakov pove koliko korakov igre naredimo
#   #funkcija nam da zaporedje matrik igre življenja
#   zaporedje <- list()
#   #dobimo seznam, ki nam da matriko v vsakem koraku
#   zaporedje[[1]] <- zacetna_matrika
#   dimenzije <- dim(zacetna_matrika)
#   #vse matrike morajo biti enakih velikosti
#   for(i in 2:st_korakov){
#     zaporedje[[i]] <- za_matriko_3D(zaporedje[[i-1]])
#     #na i-to v seznamu shranimo i-to matriko
#   }
#   return(zaporedje)
# } 
# 
# 
# ## Pri igri življenja nas zanima tudi, ali je sistem v ravnotežju, se ponavlja, umre,...
# 
# 
# #zakljucek igre
# 
# konec <- function(st_korakov, zacetna_matrika){
#   rezultat <- celotna_igra_3D(st_korakov, zacetna_matrika)
#   for(i in 1:st_korakov){
#     if(all(rezultat[[i]] == 0)){
#       return(print(sprintf("Ta igra sezaključi v %d. korakih.",i)))
#     }
#   }
#   return(print(sprintf("Ta igra se v %d. korakih ne zaključi.",st_korakov)))
# }
# 
# 
# # Ponavljanje
# 
# ponavljanje <- function(st_korakov, zacetna_matrika){
#   rezultat <- celotna_igra_3D(st_korakov, zacetna_matrika)
#   for(i in 1:(st_korakov-1)){
#     pregled <- rezultat[[i]]
#     for(j in (i+1) :st_korakov){
#       if(all(pregled == rezultat[[j]])){
#         return(print(sprintf("Ta igra se zacne ponavljati v %d. koraku in perioda je dolga %d.",i,j-i)))
#       } 
#     }
#   }
#   return(print("Ta igra se ne ponavlja"))
# }
# 
# 
# 
# 
# #v ui bomo morali določiti tudi začetno matriko
# 
# #poizkusi narediti, da lahko določimo sami
# 
# doloci_random_matriko_3D <- function(vrstice,stolpci,globina){
#   dat <- sample(c(0,1), replace=TRUE, size=vrstice*stolpci*globina)
#   mdat <- array(dat,dim = c(vrstice,stolpci,globina))
#   return(mdat)
# }
# 
# doloci_deter_matriko_3D <- function(vrstice,stolpci,globina,zaporedje){
#   #vrstice povedo št vrstice
#   #stolpci povedo število stolpcev
#   #zaporedje je podan vektor 0 in 1, ki opiše začetno stanje
#   if(vrstice*stolpci*globina != length(zaporedje)){
#     return(print("Zaporedje ni prave dolžine."))
#   }
#   else if(sum(zaporedje==1) + sum(zaporedje==0) != length(zaporedje)){
#     return(print("Zaporedje vsebuje nepravilne znake"))
#   }
#   else{
#     mdat <- array(dat,dim = c(vrstice,stolpci,globina))
#     return(mdat)
#   }
# }
