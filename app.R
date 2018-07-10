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

  
}

shinyApp(ui = ui, server = server)
