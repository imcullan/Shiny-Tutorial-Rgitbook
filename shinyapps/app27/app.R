library(shinyjs)

server <- function(input, output, session) {
  
  observeEvent(input$button, {
    toggle("myslider")
  })
  
}

ui <- fluidPage(
  
  useShinyjs(),
  h3("A quick demonstration of shinyjs functionality"),
  actionButton("button", "Toggle slider"),
  sliderInput("myslider", "A slider:", min=0, max=1000, value=500)
)

shinyApp(ui = ui, server = server)