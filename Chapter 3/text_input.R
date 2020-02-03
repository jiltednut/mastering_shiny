library(shiny)

ui = fluidPage(
  sliderInput("min", 
              label = "Limit (Minimum)", 
              value = 50,
              min = 0, 
              max = 100),
  textInput("name", "Enter your name:"),
  passwordInput("password", "Enter your password:"),
  textAreaInput("story", "Tell me about yourself", rows = 3)
)

server = function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)