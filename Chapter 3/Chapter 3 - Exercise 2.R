library(shiny)


ui = fluidPage(
  sliderInput("date_range", 
              "Select date range",
              value = c(as.Date("2018/01/10"), as.Date("2018/01/20")),
              min = as.Date("2018/01/01"),
              max = as.Date("2018/01/31"),
              format = "dd/mm/yyyy")  
)

server = function(input, output, session) {
  
  
}

shinyApp(ui = ui, server = server)

?sliderInput
