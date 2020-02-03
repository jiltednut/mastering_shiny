library(shiny)

ui = fluidPage(
  titlePanel("Hello Layouts!"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Observations: ", 
                  min = 0, max = 1000, value = 500)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
  
)

server = function(input, output, session) {
  
  
}

shinyApp(ui = ui, server = server)
