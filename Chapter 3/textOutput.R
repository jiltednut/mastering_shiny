library(shiny)

ui = fluidPage(
  textOutput("text"), 
  verbatimTextOutput("code")

)

server = function(input, output, session) {
  output$text = renderText({
    summary(0:10)
  })
  output$code = renderPrint({
    summary(0:10)
  })
  
}

shinyApp(ui = ui, server = server)