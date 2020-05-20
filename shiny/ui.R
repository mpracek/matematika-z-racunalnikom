#Datoteka za uporabniski umesnik    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.R")
source("../osnova/osnovne_funkcije.r")
source("../modeli/igra_zivljenja.r")
source("../modeli/igra_zivljenja_vec.r")
source("../modeli/cakalne_vrste.r")
source("../vizualizacija/animacija.r")
source("../modeli/posebne_matrike.r")



sidebar <- dashboardSidebar(hr(),
#tukaj je opisan stranski meni, ki se lahko spravi
                            sidebarMenu(id = "zacetek",
                                        menuItem("Uvod",
                                                 tabName = "zacetek", selected = TRUE,
                                                 icon = tags$i(class="fas fa-play-circle"))),
                            sidebarMenu(id="osnova",
                                        menuItem("Rojstno-smrtni procesi",
                                                 tabName = "osnove",
                                                 icon = tags$i("fas fa-skull-crossbones"))),
                            sidebarMenu(id="igra",
                                        menuItem("Igra življenja",tabName = "igre",
                                                 icon = tags$i(class="fas fa-heartbeat"))),
                            sidebarMenu(id="vrsta",
                                        menuItem("Posebni primeri",tabName = "vrste",
                                                 icon = tags$i(class="fas fa-surprise")))
)


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
            #problemi, ki jih imam tukaj so prikaz unused arguments v shiny vmesniku
            fluidRow(sidebarPanel(
              p("Tu izberemo parametre rojstno smrtnega procesa"),
              numericInput("zacetno2",
                           "Velikost zacetne populacije:",
                           min = 0,
                           max = 100,
                           value = 3,
                           step = 1),
              p("Velikost začetne populacije vpliva na hitrost izumrtja."),
              numericInput("st_korakov2",
                           "Koliko korakov želimo, da simulacija naredi:",
                           min = 0,
                           max = 100,
                           value = 10,
                           step = 1),
              p("Število korakov nam bo povedalo, kako daleč v prihodnost vidimo."),
              selectInput("st_rojstvo2", 
                          label = "Porazdelitev rojstev v modelu",
                          c("Normalna" = 1, 
                            "Eksponentna" = 2,
                            "Cauchyeva" = 3, 
                            "Lognormalna" = 4)),
              p("Izberemo porazdelitev rojstev."),
              selectInput("st_smrt2", 
                          label = "Porazdelitev smrti v modelu",
                          c("Normalna" = 1, 
                            "Eksponentna" = 2,
                            "Cauchyeva" = 3, 
                            "Lognormalna" = 4)),
              p("Izberemo porazdelitev smrti."),
              actionButton("go2", "Poglejmo si prikaz")),
            mainPanel( p("Da bomo razumeli delovanje igre življenja, moramo najprej razumeti rojstno smrtne procese.
                         Vsak si lahko tu sam izbere, kakšen proces bo začel. 
                         Izberi si porazdelitev smrti in porazdelitev rojstev in opazuj spremembe,
                         ki jih graf prikaže. Vidimo, da so porazdelitve zelo pomembne, 
                         prav tako pa vpliva velikost začetne populacije."),
              plotOutput("animacija")))
            ),
    tabItem(tabName = "igre",
            fluidRow(mainPanel(p("Ideja Johna Conwaya je bila prikazati, kako v zaprtem prostoru deluje 
                        delitev celic. Navadno nas zanima kako se igra ponavlja oziroma kako se konča.
                        Zato bomo pogledali kako se naša matrika obnaša na korakih, ki smo jih pogledali."),
                      p("Naravna vprašanja življenja so kdaj se bo le to končalo, in ali se bo kaj ponovilo.
                        No v tem primeru lahko hitro vidimo, da ponavljanje pomeni, da se igra ne bo končala.
                        Imamo namreč determinističen model, ki ne bo nikoli spremenil svojih pravil. Tako bomo
                         iz iste začetne matrike vedno dobili enak rezultat. Če se igra konča pa je resnica drugačna.
                        V tem primeru bo namreč veljalo, da se v vsakem naslednjem krogu igra ponavlja in sicer s
                         s periodo 1. Lahko bi torej rekli, da ponavljanje negira zaključek, zaključek pa
                         implicira ponavljanje."),
                      actionButton("go", "Poglejmo si igro"),
              textOutput("konec"),
              textOutput("ponovno"),
              plotOutput("celotna_igra")),
              sidebarPanel(
                numericInput("st_korakov_igra",
                             "Koliko korakov bo igra imela:",
                             min = 1,
                             max = 10000,
                             value = 10,
                             step = 1),
                p("Tukaj določimo število korakov"),
                numericInput("vrstice_igre",
                             "Koliko vrstic naj bo imela igra:",
                             min = 1,
                             max = 10000,
                             value = 5,
                             step = 1),
                numericInput("stolpci_igre",
                             "Koliko stolpcev naj bo imela igra:",
                             min = 1,
                             max = 10000,
                             value = 5,
                             step = 1),
                p("S stolpci in vrsticami določimo dimenzijo igre.")))),
    #vse problemi, dogovori se s profesorjem/asistentom.
    
    #urediti moram še postavitev,
    #Vmesnik mora vrniti ponavljanje, končnost....
    #igra mora pokazati več oken, ne le zadnje
    
    tabItem(tabName = "vrste",
            mainPanel(
            tabsetPanel(
              tabPanel("Drsalec",
                       sidebarPanel(numericInput("koraki_drsi",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_drsi"),
                                 textOutput("ponovno_drsi"),
                                 plotOutput("drsi")
                                 )),
              tabPanel("Gosper",
                       sidebarPanel(numericInput("koraki_gosi",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_gosi"),
                                 textOutput("ponovno_gosi"),
                                 plotOutput("gosi")
                       )),
              tabPanel("Krastača",
                       sidebarPanel(numericInput("koraki_zaba",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_toad"),
                                 textOutput("ponovno_toad"),
                                 plotOutput("zabica")
                       )),
              tabPanel("Ladja",
                       sidebarPanel(numericInput("koraki_morje",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_ladjon"),
                                 textOutput("ponovno_ladjon"),
                                 plotOutput("ladjica")
                       )),
              tabPanel("Neomejeno",
                       sidebarPanel(numericInput("koraki_rast",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_rast"),
                                 textOutput("ponovno_rast"),
                                 plotOutput("rastica")
                       )),
              tabPanel("Motor",
                       sidebarPanel(numericInput("koraki_brum",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_brum"),
                                 textOutput("ponovno_brum"),
                                 plotOutput("motorcek")
                       )),
              tabPanel("Pištola",
                       sidebarPanel(numericInput("koraki_bum",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_bum"),
                                 textOutput("ponovno_bum"),
                                 plotOutput("pistolica")
                       )),
              tabPanel("Pentomino",
                       sidebarPanel(numericInput("koraki_pet",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_pet"),
                                 textOutput("ponovno_pet"),
                                 plotOutput("petica")
                       )),
              tabPanel("Pulsar",
                       sidebarPanel(numericInput("koraki_pulz",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_pulz"),
                                 textOutput("ponovno_pulz"),
                                 plotOutput("pulzek")
                       )),
              tabPanel("Statično",
                       sidebarPanel(numericInput("koraki_statika1",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1),
                                    numericInput("koraki_statika2",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1),
                                    numericInput("koraki_statika3",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_statika1"),
                                 textOutput("ponovno_statika1"),
                                 plotOutput("staticnost1a"),
                                 textOutput("stetje_statika2"),
                                 textOutput("ponovno_statika2"),
                                 plotOutput("staticnost2a"),
                                 textOutput("stetje_statika3"),
                                 textOutput("ponovno_statika3"),
                                 plotOutput("staticnost3a")
                       )),
              tabPanel("Svetilnik",
                       sidebarPanel(numericInput("koraki_luc",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_luc"),
                                 textOutput("ponovno_luc"),
                                 plotOutput("lucka")
                       )),
                       #tukaj bo več plotov, več napisano),
              tabPanel("Umri pokončno",
                       sidebarPanel(numericInput("koraki_DH",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_DH"),
                                 textOutput("ponovno_DH"),
                                 plotOutput("DH1")
                       )),
              tabPanel("Utripajoča lučka",
                       sidebarPanel(numericInput("koraki_blip",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_blip"),
                                 textOutput("ponovno_blip"),
                                 plotOutput("blip")
                       )),
              tabPanel("Vesoljska ladja",
                       sidebarPanel(numericInput("koraki_vroom",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_vroom"),
                                 textOutput("ponovno_vroom"),
                                 plotOutput("vroom_vroom")
                       )),
              tabPanel("Želod",icon = tags$i(class="fas fa-acorn"),
                       sidebarPanel(numericInput("koraki_hrast",
                                                 "Koliko korakov bo igra imela:",
                                                 min = 1,
                                                 max = 10000,
                                                 value = 10,
                                                 step = 1)),
                       mainPanel(textOutput("stetje_hrast"),
                                 textOutput("ponovno_hrast"),
                                 plotOutput("hrastek")
                       ))
            )
            ))
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