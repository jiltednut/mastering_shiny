library(shiny)
# Each numeric input will get a range slider and each factor input will get a multi-select. 
# i.e. if a data frame has 3 continuous variables and 2 factors, 
# I’ll generate an app with 3 sliders and 2 select boxes.


make_ui <- function(x, var) {
  if(is.numeric(x)) {
    rng <- range(x, na.rm = TRUE)
    sliderInput(var, var, min = rng[1], max = rng[2], value = rng)
  } else if (is.factor(x)){
    levs = levels(x)
    selectInput(var, var, choices = levs, selected = levs, multiple = TRUE)
  } else {
    # not supported
    NULL
  }
}

filter_var <- function(x, val){
  if(is.numeric(x)) {
    !is.na(x) & x >= val[1] & x <= val[2]
  } else if(is.factor(x)){
    print(val)
    x %in% val
  } else {
    # No control so filtering is unnecessary
    TRUE
  }
}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      make_ui(iris$Sepal.Length, "Sepal.Length"),
      make_ui(iris$Sepal.Width, "Sepal.Width"),
      make_ui(iris$Species, "Species")
    ),
    mainPanel(
      tableOutput("data")
    )
  )
)

server <- function(input, output, session) {
  selected <- reactive({
    filter_var(iris$Sepal.Length, input$Sepal.Length) &
      filter_var(iris$Sepal.Width, input$Sepal.Width) &
      filter_var(iris$Species, input$Species)
  })
  
  output$data <- renderTable(head(iris[selected(), ], 12))
}

shinyApp(ui, server)