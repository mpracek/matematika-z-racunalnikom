#Datoteka za server    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.r")
source("../razumevanje/osnovne_funkcije.r")
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
  input$zacetno_animacija
  animacija <- reactive({
    p <- animacija_obicajna(zacetno_animacija, st_korakov_animacija,
                            st_rojstvo_animacija, st_smrt_animacija)
  })
  output$animacija <- renderPlot({print(p)}) 
  }