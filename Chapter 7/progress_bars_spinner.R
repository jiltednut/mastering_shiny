library(shiny)
library(waiter)

ui <- fluidPage(
  waiter::use_waiter(), 
  actionButton("go", "go"),
  textOutput("result"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  data <- reactive({
    req(input$go)
    waiter <- waiter::Waiter$new(id = "plot", html = spin_ripple())$show()
    on.exit(waiter$hide())
    
    Sys.sleep(sample(5, 1))
    data.frame(x = runif(50), y = runif(50))
  })
  
  output$result <- renderText(nrow(data()))
  output$plot <- renderPlot(plot(data()))
}

shinyApp(ui, server)

?waiter::spinners
