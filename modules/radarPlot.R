radarPlotUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        4,
        helper(
          h1("Radar Plot"),
          type = "markdown",
          content = "radarPlot",
          size = "l"
        ),
        wellPanel(
          h4(tagList(icon("upload"), "Unggah Data")),
          radioButtons(
            inputId = ns("sumber_data"),
            label = "Pilih data:",
            choices = c(
              "Gunakan contoh data" = "contoh",
              "Unggah data" = "unggah"
            )
          ),
          conditionalPanel(
            condition = "input.sumber_data == 'contoh'",
            ns = ns,
            helpText(tags$small("Contoh menggunakan data QDA dari panelis konsumen. Pengaturan parameter adalah sebagai berikut: Panelis = 'consumer', Sampel = 'product', Atribut Utama= 'intensity' - 'green', dan tidak ada Atribut Tambahan."))
          ),
          conditionalPanel(
            condition = "input.sumber_data == 'unggah'",
            ns = ns,
            tipify(
              fileInput(
                inputId = ns("data"),
                label = "",
                multiple = FALSE,
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv"
                ),
                buttonLabel = "Pilih",
                placeholder = "Tidak ada dokumen"
              ),
              title = "format file *.csv",
              placement = "top"
            )
          ),
          actionButton(
            inputId = ns("unggah"),
            label = "Gunakan data"
          ),
          conditionalPanel(
            condition = "input.unggah",
            ns = ns,
            br(),
            h4(tagList(icon("sliders"), "Pengaturan Parameter")),
            pickerInput(
              inputId = ns("sampel"),
              label = "Sampel",
              choices = NULL,
              options = list(
                title = "Pilih kolom",
                size = 8
              )
            ),
            pickerInput(
              inputId = ns("atribut"),
              label = "Atribut Sensoris",
              choices = NULL,
              multiple = TRUE,
              options = list(
                "actions-box" = TRUE,
                title = "Pilih kolom",
                "deselect-all-text" = "Hapus semua",
                "select-all-text" = "Pilih semua",
                size = 8
              )
            ),
            actionButton(
              inputId = ns("terapkan"),
              label = "Terapkan"
            )
          )
        )
      ),
      column(
        8,
        panel(
          heading = h4(tagList(icon("table"), "Data")),
          status = "primary",
          withSpinner(DT::dataTableOutput(ns("tabel_data")))
        ),
        panel(
          heading = h4(tagList(icon("image"), "Radar Plot")),
          status = "primary",
          fluidRow(
            column(
              1,
              dropdownButton(
                circle = TRUE,
                status = "primary",
                icon = icon("gear"),
                width = "300px",
                tooltip = tooltipOptions(title = "Pengaturan"),
                selectInput(
                  inputId = ns("grafikGlobal_opsi"),
                  label = "Pilihan Grafik",
                  choices = c("Sampel", "Atribut"),
                  selected = "Sampel"
                ),
                numericInput(
                  inputId = ns("grafikGlobal_sumbu_x"),
                  label = "Dimensi Sumbu X",
                  min = 1,
                  max = 4,
                  value = 1
                ),
                numericInput(
                  inputId = ns("grafikGlobal_sumbu_y"),
                  label = "Dimensi Sumbu Y",
                  min = 2,
                  max = 5,
                  value = 2
                ),
                textInput(
                  inputId = ns("grafikGlobal_judul"),
                  label = "Judul Grafik",
                  value = ""
                ),
                sliderInput(
                  inputId = ns("grafikGlobal_cex"),
                  label = "Ukuran Label",
                  min = 2,
                  max = 8,
                  value = 4,
                  step = 1
                )
              )
            ),
            column(11,
                   align = "center",
                   withSpinner(plotOutput(ns("grafikGlobal"))),
                   uiOutput(ns("opsi_unduh_grafikGlobal"))
            )
          )
        )
      )
    )
  )
}