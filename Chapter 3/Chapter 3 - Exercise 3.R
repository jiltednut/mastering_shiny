library(shiny)

ui = fluidPage(
  selectInput("state", "Choose a state:",
              list('East' = list("NY", "NJ", "CT"),
                   "West" = list("WA", "OR", "CA"),
                   "MW" = list("MN", "WI", "IA"))),
  textOutput("result")
)

server = function(input, output, session) {
  output$result = renderText({
    paste("You chose ", input$state)
  })
}

shinyApp(ui = ui, server = server)