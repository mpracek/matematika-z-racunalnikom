#Datoteka za uporabniski umesnik    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.R")
source("../razumevanje/osnovne_funkcije.r")
source("../modeli/igra_zivljenja.r")
source("../modeli/igra_zivljenja_vec.r")
source("../modeli/cakalne_vrste.r")


sidebar <- dashboardSidebar(hr(),
                            sidebarMenu(id="osnova",
                                        
                                        #prikazani grafi 
                                        #zapisana osnovna matematična dejstva
                                        #več podmenijev; -matematika
                                        #                -narisano
                                        
                                        
                                        menuItem("Osnove matematike", tabName = "osnove", selected = TRUE)),
                            sidebarMenu(id="igra",
                                        
                                        
                                        #podmeniji, ali matriko določim sam ali je random
                                        #nato se odpre okno z matriko, in kaže napredek po korakih
                                        
                                        
                                        menuItem("Igra življenja",tabName = "igre"),
                            sidebarMenu(id="vrsta",
                                        #podmeniji
                                        #mm1
                                        #mmn
                                        #...
                                        menuItem("Čakalne vrste",tabName = "vrste"))
))


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "osnove",
            fluidRow(sidebarPanel(
              sliderInput("min_max",
                          "Velikost zacetne populacije:",
                          min = 0,
                          max = 100,
                          value = c(0,100),
                          step = 1,
                          post = "",
                          sep = ".")),
            mainPanel()
            #sem gre koda iz osnovnih_funkcij
            )),
    tabItem(tabName = "igre"
            #sem gre koda iz igre_zivljenja
            ),
    tabItem(tabName= "vrste"
            #sem gre koda iz cakalne_vrste
            )
))

  
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