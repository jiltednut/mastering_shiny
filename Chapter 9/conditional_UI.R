library(shiny)

parameter_tabs <- tagList(
  tags$style("#params {display:none;}"),
  tabsetPanel(
    id = "params", 
    tabPanel("normal", 
             numericInput("mean", "mean", min = 0, value = 1),
             numericInput("sd", "standard deviation", min = 0, value = 1)
    ),
    tabPanel("uniform", 
             numericInput("min", "min", min = 0, value = 0),
             numericInput("max", "max", min = 1, value = 1)
    ),
    tabPanel("exponential", 
             numericInput("rate", "rate", min = 0, value = 1))
  )
)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("dist", "Distribution", choices = c("normal", "uniform", "exponential")),
      numericInput("n", "No. of Samples: ", min = 0, max = 1000, value = 100),
      parameter_tabs
    ),
    mainPanel(
      plotOutput("hist")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$dist, {
    updateTabsetPanel(session, "params", selected = input$dist)
  })
  
  sample <- reactive({
    switch(input$dist, 
           normal = rnorm(input$n, input$mean, input$sd),
           uniform = runif(input$n, input$min, input$max),
           exponential = rexp(input$n, input$rate)
    )
  })
  output$hist <- renderPlot(hist(sample()))
}

shinyApp(ui, server)