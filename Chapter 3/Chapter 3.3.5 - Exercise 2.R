library(shiny)

ui = fluidPage(
  fluidRow(
    # 
    # column(6, plotOutput("plot1", width = "100%")),
    # column(6, plotOutput("plot2", width = "100%"))
    
    splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
    plotOutput("plot1"),
    plotOutput("plot2")
    
    )
                
  )
  
)

?column

server = function(input, output, session) {
  output$plot1 = renderPlot({
    plot(1:5)
  })
  output$plot2 = renderPlot({
    plot(5:1)
  })
}

shinyApp(ui = ui, server = server)

?plotOutput
