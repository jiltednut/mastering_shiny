library(shiny)
library(lubridate)

ui <- fluidPage(
  numericInput("year", "year", value = 2020),
  dateInput("date", "date")
)

# Add code to change the date input to current year but retain the date currently selected

server <- function(input, output, session) {
  observeEvent(input$year, {
    req(input$date)
    year <- input$year
    d = format(as.Date(input$date, format = "%Y-%m-%d"), "%d")
    m = format(as.Date(input$date, format = "%Y-%m-%d"), "%m")
    new = as.Date(paste(year, m, d, sep = "-", collapse = ""))
    start = as.Date(paste0(year, "-01-01"), format = "%Y-%m-%d")
    end = as.Date(paste0(year, "-12-31"), format = "%Y-%m-%d")
    updateDateInput(session, "date", value = new, min = start, max = end)
  })
}

shinyApp(ui, server)
