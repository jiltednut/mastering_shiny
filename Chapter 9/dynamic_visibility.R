library(shiny)

ui <- fluidPage(
  tags$style("#switcher { display:none; }"),
  sidebarLayout(
    sidebarPanel(
      selectInput("controller", "Show", choices = paste0("panel", 1:3))
    ),
    mainPanel(
      tabsetPanel(
        id = "switcher",
        tabPanel("panel1", "Panel 1 Content"),
        tabPanel("panel2", "Panel 2 Content"),
        tabPanel("panel3", "Panel 3 Content")
      )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$controller, {
    updateTabsetPanel(session, "switcher", selected = input$controller)
  })
}

shinyApp(ui, server)