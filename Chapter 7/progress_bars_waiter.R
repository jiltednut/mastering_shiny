library(shiny)
library(waiter)

ui <- fluidPage(
  waiter::use_waitress(),
  numericInput("steps", "How many steps?", value = 10),
  actionButton("go", "Go!"),
  textOutput("result")
)

server <- function(input, output, session) {
  
  data <- reactive({
    req(input$go)
    waitress <- waiter::Waitress$new(max = input$steps, theme = "overlay-radius")
    on.exit(waitress$close())
    
    for(i in seq_len(input$steps)) {
      Sys.sleep(0.5)
      waitress$inc(1)
    }
    runif(1)
  })
  
    output$result <- renderText(round(data(), 2))
}

shinyApp(ui, server)

?waiter::Waitress
