#Datoteka za server    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.r")
source("../osnova/osnovne_funkcije.r")
source("../modeli/igra_zivljenja.r")
source("../modeli/igra_zivljenja_vec.r")
source("../modeli/cakalne_vrste.r")
source("../vizualizacija/animacija.r")
source("../modeli/posebne_matrike.r")

#vse kar moramo narediti je še urediti razpored grafov v ui

server <- function(input, output) {

  
obicanja_animacija <- eventReactive(input$go2,{
  p <- animacija_obicajna(zacetno = input$zacetno2,
                          st_korakov = input$st_korakov2,
                          st_rojstvo = input$st_rojstvo2,
                          st_smrt = input$st_smrt2)
  p
  })
output$animacija2 <- renderPlotly(obicanja_animacija()) 
output$animacija <-renderUI({plotlyOutput("animacija2")})

doloci_matriko <- eventReactive(input$matrika,{
  matrika <- doloci_random_matriko(vrstice = input$vrstice_igre,
                                   stolpci = input$stolpci_igre)
  return(matrika)
})

narisi_zacetno2 <- reactive({
   p <- plot(doloci_matriko(), col = c("black","blue"),
             main = sprintf("Začetna matrika"),
             xlab = "", ylab ="")
   p
 })

output$narisi_zacetno <- renderPlot(narisi_zacetno2())


risanje_igre <- reactive({#input$go,{
  matrika <- doloci_matriko()
  p <- narisi_igro(st_korakov = input$st_korakov_igra,
                     zacetna_matrika =  matrika)
  p
})
output$celotna_igra <- renderPlot(risanje_igre())


zakljucek <- eventReactive(input$go,{
  zacetna_matrika <- doloci_random_matriko(vrstice = input$vrstice_igre,
                                          stolpci = input$stolpci_igre)
  rezultat <- konec(st_korakov = input$st_korakov_igra, zacetna_matrika = zacetna_matrika)
  return(rezultat)
})
output$stetje <- renderText(zakljucek())
ponovitev <-eventReactive(input$go,{
  zacetna_matrika <- doloci_random_matriko(vrstice = input$vrstice_igre,
                                           stolpci = input$stolpci_igre)
  rezultat <- ponavljanje(st_korakov = input$st_korakov_igra, zacetna_matrika = zacetna_matrika)
  return(rezultat)
})
output$ponovno <- renderText(ponovitev())


# tabPanel("Drsalec"),
drsalo <- reactive({
  rezultat <- narisi_igro(input$koraki_drsi,drsalec)
  return(rezultat)
})
drsalo2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_drsi, zacetna_matrika = drsalec)
  return(rezultat)
})

drsalo3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_drsi, zacetna_matrika = drsalec)
  return(rezultat)
})
output$ponovno_drsi <- renderText(drsalo3())

output$drsi <- renderPlot(drsalo())
output$stetje_drsi <- renderText(drsalo2())


narisi_zacetno_drsi_2 <- reactive({
  p <- plot(drsalec, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_drsi <- renderPlot(narisi_zacetno_drsi_2())


# tabPanel("Gosper"),
gos <- reactive({
  rezultat <- narisi_igro(input$koraki_gosi,gosper1)
  return(rezultat)
})
gos2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_gosi, zacetna_matrika = gosper1)
  return(rezultat)
})
gos3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_gosi, zacetna_matrika = gosper1)
  return(rezultat)
})
output$ponovno_gosi <- renderText(gos3())
output$stetje_gosi <- renderText(gos2())
output$gosi <- renderPlot(gos())

narisi_zacetno_gos_2 <- reactive({
  p <- plot(gosper1, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_gos <- renderPlot(narisi_zacetno_gos_2())


# tabPanel("Krastača"),
toad1 <- reactive({
  rezultat <- narisi_igro(input$koraki_zaba,krastaca)
  return(rezultat)
})
output$zabica <- renderPlot(toad1())

toad2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_zaba, zacetna_matrika = krastaca)
  return(rezultat)
})
output$stetje_toad <- renderText(toad2())

toad3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_zaba, zacetna_matrika = krastaca)
  return(rezultat)
})
output$ponovno_toad <- renderText(toad3())

narisi_zacetno_toad_2 <- reactive({
  p <- plot(krastaca, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_toad <- renderPlot(narisi_zacetno_toad_2())


# tabPanel("Ladja"),
ladjon <- reactive({
  rezultat <- narisi_igro(input$koraki_morje,ladja)
  return(rezultat)
})
ladjon2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_morje, zacetna_matrika = ladja)
  return(rezultat)
})
output$stetje_ladjon <- renderText(ladjon2())
output$ladjica <- renderPlot(ladjon())

ladjon3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_morje, zacetna_matrika = ladja)
  return(rezultat)
})
output$ponovno_ladjon <- renderText(ladjon3())

narisi_zacetno_ladja_2 <- reactive({
  p <- plot(ladja, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_ladja <- renderPlot(narisi_zacetno_ladja_2())

# tabPanel("Neomejeno"),
rast <- reactive({
  rezultat <- narisi_igro(input$koraki_rast,neomejeno)
  return(rezultat)
})

rast2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_rast, zacetna_matrika = neomejeno)
  return(rezultat)
})
output$stetje_rast <- renderText(rast2())
output$rastica <- renderPlot(rast())

rast3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_rast, zacetna_matrika = neomejeno)
  return(rezultat)
})
output$ponovno_rast <- renderText(rast3())

narisi_zacetno_rast_2 <- reactive({
  p <- plot(neomejeno, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_rast <- renderPlot(narisi_zacetno_rast_2())


#tabPanel("Motor"),
brum <- reactive({
  rezultat <- narisi_igro(input$koraki_brum,motor)
  return(rezultat)
})
output$motorcek <- renderPlot(brum())

brum2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_brum, zacetna_matrika = motor)
  return(rezultat)
})
output$stetje_brum <- renderText(brum2())


brum3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_brum, zacetna_matrika = motor)
  return(rezultat)
})
output$ponovno_brum <- renderText(brum3())

narisi_zacetno_brum_2 <- reactive({
  p <- plot(motor, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_brum <- renderPlot(narisi_zacetno_brum_2())


# tabPanel("Pištola"),
bum <- reactive({
  rezultat <- narisi_igro(input$koraki_bum,pistola)
  return(rezultat)
})
output$pistolica <- renderPlot(bum())

bum2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_bum, zacetna_matrika = pistola)
  return(rezultat)
})
output$stetje_bum <- renderText(bum2())

bum3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_bum, zacetna_matrika = pistola)
  return(rezultat)
})
output$ponovno_bum <- renderText(bum3())

narisi_zacetno_bum_2 <- reactive({
  p <- plot(pistola, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_bum <- renderPlot(narisi_zacetno_bum_2())


# tabPanel("Pentomino"),
pet <- reactive({
  rezultat <- narisi_igro(input$koraki_pet,pent)
  return(rezultat)
})
output$petica <- renderPlot(pet())

pet2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_pet, zacetna_matrika = pent)
  return(rezultat)
})
output$stetje_pet <- renderText(pet2())

pet3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_pet, zacetna_matrika = pent)
  return(rezultat)
})
output$ponovno_pet <- renderText(pet3())

narisi_zacetno_pet_2 <- reactive({
  p <- plot(pent, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_pet <- renderPlot(narisi_zacetno_pet_2())


# tabPanel("Pulsar"),
pulz <- reactive({
  rezultat <- narisi_igro(input$koraki_pulz,pulzor)
  return(rezultat)
})
output$pulzek <- renderPlot(pulz())

pulz2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_pulz, zacetna_matrika = pulzor)
  return(rezultat)
})
output$stetje_pulz <- renderText(pulz2())

pulz3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_pulz, zacetna_matrika = pulzor)
  return(rezultat)
})
output$ponovno_pulz <- renderText(pulz3())

narisi_zacetno_pulz_2 <- reactive({
  p <- plot(pulzor, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_pulz <- renderPlot(narisi_zacetno_pulz_2())


# tabPanel("Statično"),
statika1 <- reactive({
  rezultat <- narisi_igro(input$koraki_statika1,staticno1a)
  return(rezultat)
})
output$staticnost1 <- renderPlot(statika1())

statika2 <- reactive({
  rezultat <- narisi_igro(input$koraki_statika2,staticno2a)
  return(rezultat)
})
output$staticnost2 <- renderPlot(statika2())

statika3 <- reactive({
  rezultat <- narisi_igro(input$koraki_statika3,staticno3a)
  return(rezultat)
})
output$staticnost3 <- renderPlot(statika3())

statika1a <- reactive({
  rezultat <- konec(st_korakov = input$koraki_statika1, zacetna_matrika = staticno1a)
  return(rezultat)
})
output$stetje_statika1 <- renderText(statika1a())

statika2a <- reactive({
  rezultat <- konec(st_korakov = input$koraki_statika2, zacetna_matrika = staticno2a)
  return(rezultat)
})
output$stetje_statika2 <- renderText(statika2a())

statika3a <- reactive({
  rezultat <- konec(st_korakov = input$koraki_statika3, zacetna_matrika = staticno3a)
  return(rezultat)
})
output$stetje_statika3 <- renderText(statika3a())

statika1b <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_statika1, zacetna_matrika = staticno1a)
  return(rezultat)
})
output$ponovno_statika1 <- renderText(statika1b())

statika1b <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_statika1, zacetna_matrika = staticno1a)
  return(rezultat)
})
output$ponovno_statika1 <- renderText(statika1b())

statika2b <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_statika2, zacetna_matrika = staticno2a)
  return(rezultat)
})
output$ponovno_statika2 <- renderText(statika2b())

statika3b <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_statika3, zacetna_matrika = staticno3a)
  return(rezultat)
})
output$ponovno_statika3 <- renderText(statika3b())


narisi_zacetno_staticno_1 <- reactive({
  p <- plot(staticno1a, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_1 <- renderPlot(narisi_zacetno_staticno_1())

narisi_zacetno_staticno_2 <- reactive({
  p <- plot(staticno2a, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_2 <- renderPlot(narisi_zacetno_staticno_2())

narisi_zacetno_staticno_3 <- reactive({
  p <- plot(staticno1a, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_3 <- renderPlot(narisi_zacetno_staticno_3())
# tabPanel("Svetilnik"),
luc <- reactive({
  rezultat <- narisi_igro(input$koraki_luc,svetilka)
  return(rezultat)
})
output$lucka <- renderPlot(luc())

luc2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_luc, zacetna_matrika = svetilka)
  return(rezultat)
})
output$stetje_luc <- renderText(luc2())

luc3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_luc, zacetna_matrika = svetilka)
  return(rezultat)
})
output$ponovno_luc <- renderText(luc3())

narisi_zacetno_luc_2 <- reactive({
  p <- plot(svetilka, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_luc <- renderPlot(narisi_zacetno_luc_2())


# tabPanel("Umri pokončno"),
DH <- reactive({
  rezultat <- narisi_igro(input$koraki_DH,bruce_willis)
  return(rezultat)
})
output$DH1 <- renderPlot(DH())

DH2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_DH, zacetna_matrika = bruce_willis)
  return(rezultat)
})
output$stetje_DH <- renderText(DH2())

DH3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_DH, zacetna_matrika = bruce_willis)
  return(rezultat)
})
output$ponovno_DH <- renderText(DH3())

narisi_zacetno_DH_2 <- reactive({
  p <- plot(bruce_willis, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_DH <- renderPlot(narisi_zacetno_DH_2())


# tabPanel("Utripajoča lučka"),
blipblip <- reactive({
  rezultat <- narisi_igro(input$koraki_blip,rotacija)
  return(rezultat)
})
output$blip <- renderPlot(blipblip())

blip2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_blip, zacetna_matrika = rotacija)
  return(rezultat)
})
output$stetje_blip <- renderText(blip2())

blip3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_blip, zacetna_matrika = rotacija)
  return(rezultat)
})
output$ponovno_blip <- renderText(blip3())

narisi_zacetno_blip_2 <- reactive({
  p <- plot(rotacija, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_blip <- renderPlot(narisi_zacetno_blip_2())


# tabPanel("Vesoljska ladja"),
vroom <- reactive({
  rezultat <- narisi_igro(input$koraki_vroom,vesolje)
  return(rezultat)
})
output$vroom_vroom <- renderPlot(vroom())

vroom2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_vroom, zacetna_matrika = vesolje)
  return(rezultat)
})
output$stetje_vroom <- renderText(vroom2())

vroom3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_vroom, zacetna_matrika = vesolje)
  return(rezultat)
})
output$ponovno_vroom <- renderText(vroom3())

narisi_zacetno_vroom_2 <- reactive({
  p <- plot(vesolje, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_vroom <- renderPlot(narisi_zacetno_vroom_2())


# tabPanel("Želod")
hrast <- reactive({
  rezultat <- narisi_igro(input$koraki_hrast,zelod)
  return(rezultat)
})
output$hrastek <- renderPlot(hrast())

hrast2 <- reactive({
  rezultat <- konec(st_korakov = input$koraki_hrast, zacetna_matrika = zelod)
  return(rezultat)
})
output$stetje_hrast <- renderText(hrast2())

hrast3 <- reactive({
  rezultat <- ponavljanje(st_korakov = input$koraki_hrast, zacetna_matrika = zelod)
  return(rezultat)
})
output$ponovno_hrast <- renderText(hrast3())

narisi_zacetno_hrast_2 <- reactive({
  p <- plot(zelod, col = c("black","blue"),
            main = sprintf("Začetna matrika"),
            xlab = "", ylab ="")
  p
})

output$narisi_zacetno_hrast <- renderPlot(narisi_zacetno_hrast_2())




}