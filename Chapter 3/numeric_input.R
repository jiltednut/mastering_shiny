library(shiny)

ui = fluidPage(
  numericInput("num", 
               label = "Number One",
               value = 0, 
               min = 0, 
               max = 100),
  sliderInput("num2", 
              label = "Number 2", 
              value = 50,
              min = 0, 
              max = 100),
  sliderInput("num3", 
              label = "Range", 
              value = c(10,50),
              min = 0, 
              max = 100)
)

server = function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)