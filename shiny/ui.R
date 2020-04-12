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
                            sidebarMenu(id="osnova",
                                        menuItem("Osnove matematike",
                                                 tabName = "osnove", selected = TRUE)),
                                        sidebarMenu(id="igra",
                                        menuItem("Igra življenja",tabName = "igre"),
                            sidebarMenu(id="vrsta",
                                        menuItem("Čakalne vrste",tabName = "vrste"))
))


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "osnove",
            fluidRow(sidebarPanel(
              numericInput("zacetno_animacija",
                          "Velikost zacetne populacije:",
                          min = 0,
                          max = 100,
                          value = 3,
                          step = 1),
              numericInput("st_korakov_animacija",
                          "Koliko korakov želimo, da simulacija naredi:",
                          min = 0,
                          max = 100,
                          value = 10,
                          step = 1),
            numericInput("cas_animacija",
                         "Trajanje procesa:",
                         min = 0,
                         max = 1000,
                         value = 50,
                         step = 1),
            selectInput("st_rojstvo_animacija", 
                        label = "Porazdelitev rojstev v modelu",
                        choices = list("Normalna", 
                                       "Eksponentna",
                                       "Cauchyeva", 
                                       "Lognormalna"),
                        selected = "Normalna"),
            selectInput("st_smrt_animacija", 
                        label = "Porazdelitev smrti v modelu",
                        choices = list("Normalna", 
                                       "Eksponentna",
                                       "Cauchyeva", 
                                       "Lognormalna"),
                        selected = "Normalna")),
            mainPanel( plotlyOutput("animacija"),
                       plotlyOutput("casovna_animacija"))
                )),
    #plotly imam nenavadne povratke
    #pogledati moram, če se da s delati z ggplotlyx
    
    tabItem(tabName = "igre",
            fluidRow(sidebarPanel(
              numericInput("st_korakov_igra",
                           "Koliko korakov bo igra imela:",
                           min = 1,
                           max = 100,
                           value = 10,
                           step = 1),
              numericInput("vrstice_igre",
                           "Koliko vrstic naj bo imela igra:",
                           min = 0,
                           max = 1000,
                           value = 5,
                           step = 1),
              numericInput("stolpci_igre",
                           "Koliko stolpcev naj bo imela igra:",
                           min = 0,
                           max = 1000,
                           value = 5,
                           step = 1))),
            mainPanel( plotOutput("celotna_igra"))),
    #urediti moram še postavitev,
    #Vmesnik mora vrniti ponavljanje, končnost....
    #igra mora pokazati več oken, ne le zadnje
    tabItem(tabName= "vrste")
)
)
            
  
fluidPage(useShinyjs(),
          dashboardPage(
          dashboardHeader(title = "Rojstno smrtni procesi",
          tags$li(class = "dropdown",
          tags$li(class = "dropdown", textOutput("dashboardLoggedUser"), style = "padding-top: 15px; padding-bottom: 15px; color: #fff;"),
          tags$li(class = "dropdown", actionLink("dashboardLogin", textOutput("logintext")))
          )),
          sidebar,
          body,
          skin = "red"),
          theme="bootstrap.css"
)