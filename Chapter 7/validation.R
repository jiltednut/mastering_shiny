library(shiny)
library(shinyFeedback)
library(waiter)
# remotes::install_github("JohnCoene/waiter")
# remotes::install_github("merlinoa/shinyFeedback")

ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  numericInput("n", "n", value = 10),
  textOutput("half")
)

# server <- function(input, output, session) {
#   
#   observeEvent(input$n,
#                shinyFeedback::feedbackWarning(
#                  "n", 
#                  input$n %% 2 != 0,
#                  "Please select an even number."
#                )
#   )
#   
#   output$half <- renderText(input$n / 2)
# }

server <- function(input, output, session) {
  half <- reactive({
    even <- input$n %% 2 == 0
    shinyFeedback::feedbackWarning("n", 
                                   !even, 
                                   "Please select an even number.")
    req(even)
    input$n / 2
  }) 
  
  output$half <- renderText(half())
}

shinyApp(ui, server)