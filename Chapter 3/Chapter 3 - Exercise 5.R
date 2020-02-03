library(shiny)

ui = fluidPage(
  numericInput("number", "Select a value", 
                min = 0, max = 150, value = 150, step = 50),
  textOutput("numberout")
  
)

server = function(input, output, session) {
  output$numberout = renderText({
    input$number
  })
  
}

shinyApp(ui = ui, server = server)