##              115 120
# datoteka za animacije, vizualizacijo bolj zanimivih stvari
#animacija velikosti populacije
#uredi z ggplot, da bo delalo
#nato naredi isto še za animacijo_do časa


#ne potrebujemo 
# animacija_do_casa <- function(zacetno,st_korakov, cas, st_rojstvo,st_smrt){
#   rezultat <- stevilo_do_casa(zacetno,st_korakov, cas, st_rojstvo,st_smrt)
#   koraki <- c(1:st_korakov)
#   cas <- c(1:st_korakov)
#   podatki <- data.frame(koraki, rezultat,cas)
#   fig <- plot_ly(podatki, 
#                  x = ~koraki, 
#                  y = ~rezultat,
#                  frame = ~cas,
#                  type = 'scatter',
#                  mode = 'points+line')
#   fig  
# }


#narejeno z ggplot
animacija_obicajna <- function(zacetno,st_korakov,st_rojstvo,st_smrt){
  rezultat <- stevilo(zacetno,st_korakov,st_rojstvo,st_smrt)
  koraki <- c(1:st_korakov)
  cas <- c(1:st_korakov)
  podatki <- data.frame(koraki, rezultat,cas)
  fig <- ggplot(podatki, aes(x = koraki,
                             y = rezultat)) +
    ggtitle("Potek rojstno smrtnega procesa") +
    xlab("Korak") + ylab("Osebkov v trenutku") +
    #Dodaj še poimenovanje osi!!
    geom_point(aes(frame=koraki))
  fig <- ggplotly(fig)
  fig
                 
}



#igra življenja
narisi_igro <- function(st_korakov, zacetna_matrika){
  #črni kvadratki so mrtve celice
  #modri kvadratki so žive celice
  rezultat <- celotna_igra(st_korakov, zacetna_matrika)
  p <- plot(rezultat[[st_korakov]], col = c("black","blue"),
       main = sprintf("Igra v %d koraku",st_korakov),
       xlab = "", ylab ="")
  p
}

