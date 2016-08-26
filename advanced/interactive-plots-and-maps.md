# Interactive plots and maps

HTML widgets allow you to use JavaScript visualization libraries to create interactive graphics in R, including Shiny web applications. For details on HTML widgets, generally you can visit the [htmlwidgets site](http://www.htmlwidgets.org/). Below we'll do three examples, two examples of interactive plots (`plot.ly` and `highcharts`), and an interactive map with `leaflet` but there are many other widgets available.

### Example app: Use `plot.ly` to make a ggplot interactive

Details on using `plot.ly` can be found on [their site](https://plot.ly/r/shiny-tutorial/). In this example, we use `plot.ly` to make a `ggplot` interactive.

```r
library(plotly)

server <- function(input, output, session) {
  
  dat <- reactive(cars[1:input$myslider,])
  
  output$myplot <- renderPlotly({
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
```

<iframe style="width:100%; height:580px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app31'></iframe>

### Example app: Use `highcharts` to make an interactive plot

Details on using `highcharts` can be found on [this site](http://jkunst.com/highcharter/). In this example, we create a scatter plot from scratch.

```r
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
```

<iframe style="width:100%; height:580px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app32'></iframe>

### Example app: Use `leaflet` for an interactive map

In this app the slider is linked to a map. Details on using `leaflet` in R can be found at [RStudio's GitHub](http://rstudio.github.io/leaflet/shiny.html).

```r
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
```

<iframe style="width:100%; height:750px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app33'></iframe>