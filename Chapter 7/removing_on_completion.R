library(shiny)

ui <- fluidPage(
  tableOutput("data")
)

server = function(input, output, session) {
  options(shiny.maxRequestSize=500*1024^2)
  data <- reactive({
    id <- showNotification("Reading data....", duration = NULL, closeButton = FALSE)
    on.exit(removeNotification(id), add = TRUE)
    
    vroom::vroom("./../neiss/data/injuries.csv")
  })
  
  output$data <- renderTable(head(data()))
}

shinyApp(ui = ui, server = server)
