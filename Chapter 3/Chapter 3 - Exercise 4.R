library(shiny)

ui = fluidPage(
  sliderInput("numberline", "Press Play",
              min = 0, max = 100, value = 0,
              step = 5, animate = TRUE),
  textOutput("number")
  
)

server = function (input, output, session) {
  output$number = renderText({
    input$numberline
  })
  
}

shinyApp(ui = ui, server = server)