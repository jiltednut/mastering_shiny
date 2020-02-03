library(shiny)
options(shiny.maxRequestSize = 10 * 1024^2)
ui <- fluidPage(
  fileInput("upload", "Upload a file:", buttonLabel = "Upload...", multiple = TRUE),
  tableOutput("files")
)

server <- function(input, output, session) {
  output$files <- renderTable(input$upload)
}

shinyApp(ui, server)