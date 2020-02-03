library(shiny)

ui = fluidPage(
  plotOutput("plot", width = "700px")
  
)

server = function(input, output, session) {
  output$plot = renderPlot({
    plot(1:5)
  })
}

shinyApp(ui = ui, server = server)
