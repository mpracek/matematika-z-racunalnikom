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
    geom_point(aes(frame=koraki))
  fig <- ggplotly(fig)
  fig
                 
}



#igra življenja
#risanje igre
narisi_igro <- function(st_korakov, zacetna_matrika){
  #črni kvadratki so mrtve celice
  #modri kvadratki so žive celice
  plot_list <- list()
  rezultat <- celotna_igra(st_korakov, zacetna_matrika)
  for(i in 1:length(rezultat)){
    p <- plot(rezultat[[i]], col = c("blue","black"),
         main = sprintf("Igra v %d koraku",i),
         xlab = "", ylab ="")
    plot_list[[i]] <- p
  }
  print(plot_list)
  # grid.arrange(
  #   for(i in 1:length(rezultat)){
  #     plot_list[[i]]
  # }
  #)
  return(plot_list)
}


