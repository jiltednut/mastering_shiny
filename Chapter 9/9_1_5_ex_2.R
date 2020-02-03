library(shiny)
library(tidyverse)
library(openintro)
#> Please visit openintro.org for free statistics materials
#> 
#> Attaching package: 'openintro'
#> The following objects are masked from 'package:datasets':
#> 
#>     cars, trees
states <- unique(county$state)

ui <- fluidPage(
  selectInput("state", "State", choices = states),
  selectInput("county", "County", choices = NULL)
)
server <- function(input, output, session) {
  counties <- reactive({
    req(input$state)
    county <- county %>% filter(state == input$state) %>% pull(name) %>% unique()
    print(county)
  })
  observeEvent(counties(), {
    print(counties)
    updateSelectInput(session, "county", choices = counties())
    if(input$state == "Louisiana") {
      updateSliderInput(session, "county", label = "Parish")
    }
    if(input$state == "Alaska") {
      updateSliderInput(session, "county", label = "Borrough")
    }
  })
  
} 
head(county)
shinyApp(ui, server)