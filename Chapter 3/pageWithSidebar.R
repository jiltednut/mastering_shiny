library(shiny)

ui = fluidPage(
  
  titlePanel(
    # App title / description
    "Central Limit Theorem"
  ),
  
  sidebarLayout(
    sidebarPanel(
      # Inputs
      sliderInput("m", "Number of samples",
                  min = 0, max = 100, value = 0, step = 5, 
                  animate = TRUE)
    ),
  
    mainPanel(
      # Outputs
      plotOutput("hist")
    )
  )
)

server = function(input, output, session) {
  output$hist = renderPlot({
    means = replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  })
  
}

shinyApp(ui = ui, server = server)
