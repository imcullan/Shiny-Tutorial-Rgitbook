library(plotly)

server <- function(input, output, session) {
  
  dat <- reactive(cars[1:input$myslider,])
  
  output$myplot <- renderPlotly({
    pdf(NULL)
    p <- ggplot(dat(), aes(speed, dist)) + geom_point(color="purple")
    p <- ggplotly(p)
    p
  })
}

ui <- basicPage(
  
  h3("Example of plot.ly, the plot is interactive"),
  sliderInput("myslider", "A slider:", min=1, max=50, value=10),
  plotlyOutput("myplot")
  
)

shinyApp(ui = ui, server = server)