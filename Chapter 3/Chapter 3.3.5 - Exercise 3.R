library(shiny)

ui = fluidPage (
  dataTableOutput("table")
  
)

server = function(input, output, session) {
  output$table = renderDataTable(mtcars,
                                 options = list(
                                   pageLength = 5,
                                   searching = FALSE,
                                   ordering = FALSE,
                                   lengthChange = FALSE, 
                                   scrollY = "300px",
                                   paging = FALSE,
                                   scrollCollapse = TRUE)
  )
  
}

shinyApp(ui = ui, server = server)

?renderDataTable
