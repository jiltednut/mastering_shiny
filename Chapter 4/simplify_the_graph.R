library(shiny)
library(ggplot2)


histogram = function(x1, x2, binwidth = 0.1, xlim = c(-3, 3)) {
  df = data.frame(
    x = c(x1, x2),
    g = c(rep("x1", length(x1)), rep("x2", length(x2)))
  )
  
  ggplot(df, aes(x, fill = g)) +
    geom_histogram(binwidth = binwidth) +
    coord_cartesian(xlim = xlim)
}

t_test = function(x1, x2) {
  test = t.test(x1, x2)
  
  sprintf(
    "p value: %0.3f\n[%0.2f, %0.2f]",
    test$p.value, test$conf.int[1], test$conf.int[2]
  )
}

x1 <- rnorm(100, mean = 0, sd = 0.5)
x2 <- rnorm(200, mean = 0.15, sd = 0.9)

histogram(x1, x2)
cat(t_test(x1, x2))
#> p value: 0.560
#> [-0.21, 0.11]


ui = fluidPage (
  fluidRow(
    column(4, 
           "Distribution 1",
           numericInput("n1", label = "n", value = 1000, min = 1),
           numericInput("mean1", label = "mu", value = 0, step = 0.1),
           numericInput("sd1", label = "sigma", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4,
           "Distribution 2",
           numericInput("n2", label = "n", value = 1000, min = 1),
           numericInput("mean2", label = "mu", value = 0, step = 0.1),
           numericInput("sd2", label = "sigma", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4,
           "Histogram",
           numericInput("binwidth", label = "Bin Width", value = 0.1, step = 0.1),
           sliderInput("range", label = "Range", value = c(-3, 3), min = -5, max = 5)
    )
  ),
  fluidRow (
    
    column(9, plotOutput("hist")),
    column(3, verbatimTextOutput("ttest"))
  )
)


server = function(input, output, session) {
  
  x1 = reactive(rnorm(input$n1, input$mean1, input$sd1))
  x2 = reactive(rnorm(input$n2, input$mean2, input$sd2))
  
  
  output$hist = renderPlot({
    histogram(x1(), x2(), binwidth = input$binwidth, xlim = input$range)
  })
  
  output$ttest = renderText({
    t_test(x1(), x2())
  })
  
}


shinyApp(ui = ui, server = server)