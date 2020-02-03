library(shiny)
library(tidyverse)
library(gapminder)
continent_levels <- c("All", levels(unique(gapminder$continent)))

ui <- fluidPage(
  selectInput("continent", "Continent", choices = continent_levels), 
  selectInput("country", "Country", choices = NULL),
  tableOutput("data")
)

server <- function(input, output, session) {
  continents <- reactive({
    if(input$continent == "All"){
      gapminder
    } else {
      gapminder %>% filter(continent == input$continent)
    }
  })
  observeEvent(continents(), {
    countries <- continents() %>% 
      select(country)
    current_continent <- input$continent
    updateSelectInput(session, "country", choices = countries)
    updateSelectInput(session, "continent", selected = current_continent, choices =  continent_levels)
  }) 
  output$data <- renderTable({
    req(input$country)
    continents() %>% filter(country == input$country)
  })
}

shinyApp(ui, server)

?selectInput
