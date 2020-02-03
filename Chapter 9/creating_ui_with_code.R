library(shiny)

ui <- fluidPage(
  textInput("label", "label"),
  selectInput("type", "type", choices = c("slider", "numeric")),
  uiOutput("dynamic")
)

server <- function(input, output, session) {
  output$dynamic <- renderUI({
    if(input$type == "slider") {
      # val = input$dynamic
      # sliderInput("dynamic", input$label, value = val, min = 0, max = 10)
      sliderInput("dynamic", input$label, value = isolate(input$dynamic), min = 0, max = 10)
    }
    else {
      # val = input$dynamic
      # numericInput("dynamic", input$label, value = val, min = 0, max = 10)
      numericInput("dynamic", input$label, value = isolate(input$dynamic), min = 0, max = 10)
    }
  })
}

shinyApp(ui, server)