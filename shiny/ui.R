#Datoteka za uporabniski umesnik    115 120

#zazenemo potrebne datoteke
source("../libraries/lib.r")


sidebar <- dashboardSidebar(hr(),
    sidebarMenu(id = "osnova",menuItem("Osnove matematike", tabName = "osnove", selected = TRUE)),
    sidebarMenu(id = "cakalna",menuItem("Čakalne vrste", tabName = "cakalne")),
    sidebarMenu(id = "igraa",menuItem("Igra življenja", tabName = "igre")),
)

body <- dashboardBody(tabItems(
  tabItem(tabName = "osnove",
          fluidRow(),
          mainPanel(
            titlePanel("Osnove matematike")
          ))))

fluidPage(useShinyjs(),
          titlePanel("Rojstno smrtni procesi"),
          theme="bootstrap.css"
)