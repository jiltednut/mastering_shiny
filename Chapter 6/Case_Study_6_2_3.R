library(shiny)
library(vroom)
library(reactlog)
options(shiny.reactlog = TRUE)


sales = vroom::vroom("./../neiss/data/sales_data_sample.csv")

ui <- fluidPage(
  selectInput("territory", "Select Territory", choices = sales$TERRITORY),
  textOutput("output")
)

server <- function(input, output, session) {
  territory_data <- reactive({
    sales %>% filter(TERRITORY %in% input$territory) %>% select(TERRITORY) %>% 
      distinct() %>% pull(TERRITORY) 
    #browser()
  })
  
  output$output <- renderText(
    territory_data()
  )
  
}

shinyApp(ui, server)