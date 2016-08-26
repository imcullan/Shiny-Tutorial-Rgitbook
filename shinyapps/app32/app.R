library(highcharter)
library(magrittr) # for the pipe %>%

server <- function(input, output, session) {
  
  dat <- reactive(cars[1:input$myslider,])
  
  output$myplot <- renderHighchart({
    highchart() %>% 
      hc_title(text = "Scatter chart") %>% 
      hc_add_serie_scatter(dat()$speed, dat()$dist)
    
    # here is the code if you don't want to use the %>% pipe
    # hc_add_serie_scatter(hc_title(highchart(), 
    # text = "Scatter chart"), dat()$speed, dat()$dist)
  })
}

ui <-  basicPage(
  
  h3("Example of highcharter, the plot is interactive"),
  sliderInput("myslider", "A slider:", min=1, max=50, value=10),
  highchartOutput("myplot")
)

shinyApp(ui = ui, server = server)