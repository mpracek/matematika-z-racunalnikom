#Datoteka za uporabniski umesnik    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.r")
source("../osnovne_funkcije.r")
source("../igra_zivljenja.r")
source("../cakalne_vrste.r")


sidebar <- dashboardSidebar(hr(),
                            sidebarMenu(id="osnova",
                                        menuItem("Osnove matematike", tabName = "osnove", selected = TRUE)),
                            sidebarMenu(id="igra",
                                        menuItem("Igra življenja",tabName = "igre"),
                            sidebarMenu(id="vrsta",
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