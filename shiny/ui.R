#Datoteka za uporabniski umesnik    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.R")
source("../osnova/osnovne_funkcije.r")
source("../modeli/igra_zivljenja.r")
source("../modeli/igra_zivljenja_vec.r")
source("../modeli/cakalne_vrste.r")
source("../vizualizacija/animacija.r")


sidebar <- dashboardSidebar(hr(),
#tukaj je opisan stranski meni, ki se lahko spravi
                            sidebarMenu(id = "zacetek",
                                        menuItem("Domača stran",
                                                 tabName = "zacetek", selected = TRUE)),
                            sidebarMenu(id="osnova",
                                        menuItem("Razumevanje rojstno-smrtnih procesov",
                                                 tabName = "osnove")),
                            sidebarMenu(id="igra",
                                        menuItem("Igra življenja",tabName = "igre"),
                            sidebarMenu(id="vrsta",
                                        menuItem("Posebni primeri",tabName = "vrste"))
))


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "zacetek",
            mainPanel(
              h1("Igra življenja"),
              img(src = "https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/game_of_life.jpg"),
              p("Igra življenja je eden izmed najbolj zanimivih matematičnih modelov.
                Z njim lahko predstavimo kako se spreminja število živih celic v zaprtem prostoru.")
            )
    ),
    tabItem(tabName = "osnove",
            fluidRow(sidebarPanel(
              p("Tu izberemo parametre rojstno smrtnega procesa"),
              numericInput("zacetno",
                          "Velikost zacetne populacije:",
                          min = 0,
                          max = 100,
                          value = 3,
                          step = 1),
              p("Velikost začetne populacije vpliva na hitrost izumrtja."),
              numericInput("st_korakov",
                          "Koliko korakov želimo, da simulacija naredi:",
                          min = 0,
                          max = 100,
                          value = 10,
                          step = 1),
              p("Število korakov nam bo povedalo, kako daleč v prihodnost vidimo."),
            selectInput("st_rojstvo", 
                        label = "Porazdelitev rojstev v modelu",
                        choices = list("Normalna", 
                                       "Eksponentna",
                                       "Cauchyeva", 
                                       "Lognormalna"),
                        selected = "Normalna"),
            p("Izberemo porazdelitev rojstev."),
            selectInput("st_smrt", 
                        label = "Porazdelitev smrti v modelu",
                        choices = list("Normalna", 
                                       "Eksponentna",
                                       "Cauchyeva", 
                                       "Lognormalna"),
                        selected = "Normalna"),
            p("Izberemo porazdelitev smrti.")),
            mainPanel( p("Da bomo razumeli delovanje igre življenja, moramo najprej razumeti rojstno smrtne procese.
                         Vsak si lahko tu sam izbere, kakšen proces bo začel. 
                         Izberi si porazdelitev smrti in porazdelitev rojstev in opazuj spremembe,
                         ki jih graf prikaže. Vidimo, da so porazdelitve zelo pomembne, 
                         prav tako pa vpliva velikost začetne populacije."),
              plotOutput("animacija"))
                )),
    tabItem(tabName = "igre",
            fluidRow(sidebarPanel(
              numericInput("st_korakov_igra",
                           "Koliko korakov bo igra imela:",
                           min = 1,
                           max = 10000,
                           value = 10,
                           step = 1),
              p("Tukaj določimo število korakov"),
              numericInput("vrstice_igre",
                           "Koliko vrstic naj bo imela igra:",
                           min = 0,
                           max = 10000,
                           value = 5,
                           step = 1),
              numericInput("stolpci_igre",
                           "Koliko stolpcev naj bo imela igra:",
                           min = 0,
                           max = 10000,
                           value = 5,
                           step = 1),
              p("S stolpci in vrsticami določimo dimenzijo igre.")
              )),
            mainPanel(p("Ideja Johna Conwaya je bila prikazati, kako v zaprtem prostoru deluje 
                        delitev celic. Navadno nas zanima kako se igra ponavlja oziroma kako se konča.
                        Zato bomo pogledali kako se naša matrika obnaša na korakih, ki smo jih pogledali."),
                      textOutput("konec"),
                      textOutput("ponovno"),
                      
              plotOutput("celotna_igra"))),
    #vse problemi, dogovori se s profesorjem/asistentom.
    
    #urediti moram še postavitev,
    #Vmesnik mora vrniti ponavljanje, končnost....
    #igra mora pokazati več oken, ne le zadnje
    
    tabItem(tabName = "vrste"
            #tukaj bodo opisani in prikazani posebni primeri iger življenja
            #eksponentna rast
            #ohranjanje števila
            #pulsar
            #....
            )
)
)
            
  
fluidPage(useShinyjs(),
          dashboardPage(
          dashboardHeader(title = "Igra življenja",
          tags$li(class = "dropdown",
          tags$li(class = "dropdown", textOutput("dashboardLoggedUser"), style = "padding-top: 15px; padding-bottom: 15px; color: #fff;"),
          tags$li(class = "dropdown", actionLink("dashboardLogin", textOutput("logintext")))
          )),
          sidebar,
          body,
          skin = "red"),
          theme="bootstrap.css"
)