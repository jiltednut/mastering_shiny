library(shiny)

animals = c("dog", "cat", "mouse", "bird", "other", "None")

ui = fluidPage(
  selectInput("state", "What's your favourite state?",  choices = c("Outside US", state.name), multiple = TRUE),
  radioButtons("animal", "What's your favourite animal?", choices = animals),
  checkboxGroupInput("animal2", "What's your favourite animal?", choices = animals),
  checkboxInput("cleanup", "Clean Up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?")
)
server = function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)