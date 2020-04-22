#Datoteka za server    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.r")
source("../osnova/osnovne_funkcije.r")
source("../modeli/igra_zivljenja.r")
source("../modeli/igra_zivljenja_vec.r")
source("../modeli/cakalne_vrste.r")
source("../vizualizacija/animacija.r")


#ugotoviti moram, kako bomo prikazali animacijo v ui
#animacije niso običajni ploti
#za vsako izmed stvari, igra življenja, osnovne funkcije,... moram pripraviti inpute
#za vsako izmed slik/animacij ugotoviti kako jo spraviti v ui
#


server <- function(input, output) {
#animacije so zgrajene z plotly!
obicanja_animacija <- reactive({
  p <- animacija_obicajna(zacetno_animacija = input$zacetno,
                          st_korakov_animacija = input$st_korakov,
                          st_rojstvo_animacija = input$st_korakov,
                          st_smrt_animacija = input$st_smrt)
  p
  })
output$animacija <- renderPlot(obicanja_animacija()) 

risanje_igre <- reactive({
  p <- narisi_igro(st_korakov = input$st_korakov_igra,
                   zacetna_matrika = doloci_random_matriko(vrstice = input$vrstice_igre,
                                                           stolpci = input$stolpci_igre))
  p
})
output$celotna_igra <- renderPlot(risanje_igre())
zakljucek <- reactive({
  zacetna_matrika <- doloci_random_matriko(vrstice = input$vrstice_igre,
                                          stolpci = input$stolpci_igre)
  rezultat <- konec(st_korakov = input$st_korakov_igra, zacetna_matrika = zacetna_matrika)
  return(rezultat)
})
output$stetje <- renderText(zakljucek())
ponovitev <- reactive({
  zacetna_matrika <- doloci_random_matriko(vrstice = input$vrstice_igre,
                                           stolpci = input$stolpci_igre)
  rezultat <- ponavljanje(st_korakov = input$st_korakov_igra, zacetna_matrika = zacetna_matrika)
  return(rezultat)
})
output$ponovno <- renderText(ponovitev())
}