ui <- fluidPage(
  numericInput("steps", "How many steps?", 10),
  actionButton("go", "go"),
  textOutput("result")
)

server <- function(input, output, session) {
  data <- reactive({
    req(input$go)
    
    progress <- Progress$new(max = input$steps)
    on.exit(progress$close())
    
    progress$set(message = "Computing random number")
    for (i in seq_len(input$steps)) {
      Sys.sleep(0.5)
      progress$inc(1)
    }
    runif(1)
  })
  
  output$result <- renderText(round(data(), 2))
}

shinyApp(ui = ui, server = server)