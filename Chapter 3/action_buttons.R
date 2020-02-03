library(shiny)

ui = fluidPage(
  actionButton("click", "Click Me"),
  actionButton("drink", "Drink Me", icon = icon("cocktail"))
  
)

server = function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)