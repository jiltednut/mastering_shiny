library(shiny)
library(tidyverse)
library(gapminder)
continents <- unique(gapminder$continent)


ui <- fluidPage(
  selectInput("continent", "Continent", choices = continents), 
  selectInput("country", "Country", choices = NULL),
  tableOutput("data")
)

server <- function(input, output, session) {
  continents <- reactive({
    gapminder %>% filter(continent == input$continent)
  })
  observeEvent(continents(), {
    countries <- continents() %>% 
      filter(continent == input$continent) %>% 
      select(country)
    updateSelectInput(session, "country", choices = countries)
  }) 
  output$data <- renderTable({
    req(input$country)
    continents() %>% filter(country == input$country)
  })
}

shinyApp(ui, server)

head(gapminder)
