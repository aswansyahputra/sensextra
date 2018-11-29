ui <- tagList(
  tags$head(
    tags$style(type = "text/css", "body {padding-top: 70px;}")
  ),
  navbarPage(
    "SenseXtra",
    position = "fixed-top",
    theme = shinytheme("flatly"),
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
      icon = icon("address-card"),
      radarPlotUI("radar")
    )
  )
)
