# 115 120

#V tej datoteki bo sprogramirana igra življenja
#upoštevali bomo pravila, ki jih je določil že Conway

#igra zivljenja je smrtno rojstni proces v zaprtem prostoru, ki ga bo predstavljala matrika



#napisemo pravila za izvedbo igre zivljenja

za_celico <- function(matrika,vrstica,stolpec){
  #za vsako "celico" v matriki določimo, ali bo v prihodnjem koraku "mrtva" ali "ziva"
  #ce je ziva, imamo v celici 1
  #ce je mrtva, imamo v celici 0
  
  #pravila za igro zivljenja
  if(celica = "ziva"){
    return(1)
  }
  else{
    return(0)
  }
}

za_matriko <- function(matrika,st_vrstic,st_stolpcev){
  nova_matrika <- matrika
  for(i in 1:st_vrstic){
    for(j in 1:st_stolpcev){
      nova_matrika <- za_celico(matrika,i,j)
    }
  }
  return(nova_matrika)
}

celotna_igra <- function(st_korakov, zacetna_matrika){
  #st_korakov pove koliko korakov igre naredimo
  zaporedje <- list(c(1:st_korakov))
  zaporedje[[1]] <- zacetna_matrika
  dimenzije <- dim(zacetna_matrika)
  for(i in 2:st_korakov){
    zaporedje[[i]] <- za_matriko(zaporedje[[i-1]],dimenzije[1],dimenzije[2])
  }
}