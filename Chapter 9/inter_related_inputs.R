library(shiny)

ui <- fluidPage(
  numericInput("temp_c", "Celsius", NA),
  numericInput("temp_f", "Fahrenheit", NA)
)

server <- function(input, output, session){
  observeEvent(input$temp_f, {
    c <- round((input$temp_f - 32) * 5 / 9)
    updateNumericInput(session, "temp_c", value = c)
  })
  
  observeEvent(input$temp_c, {
    f <- round((input$temp_c * 9 / 5) + 32)
    updateNumericInput(session, "temp_f", value = f)
  })
  
}

shinyApp(ui, server)