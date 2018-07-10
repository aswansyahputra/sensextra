library(shiny)
library(shinythemes)
library(shinycssloaders)
library(tidyverse)
library(ggradar)
library(DT)

ui <- tagList(
  tags$head(
    tags$style(type = "text/css", "body {padding-top: 70px;}")
  ),
  navbarPage(
    "SenseXtra",
    position = "fixed-top",
    theme = shinytheme("sandstone"),
    tabPanel(
      "Konversi Tabulasi Data",
      fluidRow(
        column(
          4,
          wellPanel(
            "Sidebar"
          )
        ),
        column(
          8,
          "Main Panel"
        )
      )
    ),
    tabPanel(
      "Radar Plot",
      fluidRow(
        column(
          4,
          wellPanel(
            "Sidebar"
          )
        ),
        column(
          8,
          "Main Panel"
        )
      )
    )
  )
)

server <- function(input, output, session) {
  # Konversi Tabulasi Data
  
  # Radar Plot
  nilai_atributUtama() %>% 
    mutate_if(is.numeric, scales::rescale) %>% 
    ggradar(axis.label.size = 3, label.gridline.min = FALSE, label.gridline.mid = FALSE, label.gridline.max = FALSE, group.point.size = 3)

  
}

shinyApp(ui = ui, server = server)
