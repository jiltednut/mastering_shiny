library(shiny)

ui = fluidPage(
  textInput("name", label = NULL, placeholder = "your name")
)

server = function(input, output, session) {
  
}
shinyApp(ui = ui, server = server)