library(shiny)

ui = fluidPage (
  fluidRow(
    column(6, 
           # something)
    ),
    column(6, 
           # something
    )
  ),
  fluidRow(
    column(8, 
           # something
    ),
    column(4,
           # something
    )
  )
  
  
)

server = function(input, output, session) {
  
  
  
}


shinyApp(ui = ui, server = server)
