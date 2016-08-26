library(leaflet)
#### server
server <- function(input, output, session) {
  
  
  # create random points in the US
  dat <- reactive({
    long <- runif(input$myslider,-121, -77 )
    lat <- runif(input$myslider,33, 48)
    vals <- rpois(input$myslider, 5)
    data.frame(latitude = lat, longitude = long, vals)
  })
  
  output$mymap <- renderLeaflet({
    leaflet() %>% addProviderTiles("Stamen.TonerLite") %>%  
      addCircleMarkers(data = dat(), radius = ~vals ) %>% 
      setView(-98, 38.6, zoom=3)
  })
}

#### user interface
ui <- fluidPage(
  
  titlePanel("Example of leaflet interactive map"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Slider changes number of map points"),
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 50, value = c(10))
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Map", leafletOutput("mymap"))
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)