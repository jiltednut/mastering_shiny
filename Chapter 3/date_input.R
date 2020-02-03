library(shiny)

ui = fluidPage(
  dateInput("dob", "Enter Date of Birth:", format = "dd/mm/yyyy"),
  dateRangeInput("holiday", "Enter Planned Vacation start and end dates:", format = "dd/mm/yyyy")

)
?dateInput
server = function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)