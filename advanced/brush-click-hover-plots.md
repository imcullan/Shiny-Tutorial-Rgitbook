# Brush, click and hover on plots

In mid-2015, RStudio added plot interactivity to Shiny's arsenal. This is a little different, though, than the HTML widgets mentioned above. This interactivity allows users to interact with "regular" base plots and ggplot2 plots. Specifically, these functions allow your users to click, hover or brush a base or ggplot to get context on the elements clicked. Adding this type of functionality can be done simply by adding an argument to the `plotOutput` function and using that output in your server.

### Example app: Brush and click on a ggplot

As an example of interactive plots, consider this reasonably simple app. You'll notice that in the `plotOutput` function we add two arguments, one for click and one for brush. And then in the reactive we use both of these. The actual resulting input variables (`input$user_brush` and `input$user_click`) provide details like the x and y coordinates clicked. To use this information to filter your table, you can use the corresponding `brushedPoints` and `nearPoints` functions.

A note about this particular example: remember that any reactives in your reactive function will trigger the code to run. As a result, if the user either brushes or clicks, the `dat` reactive will run. But, it won't know which reactive variable triggered the code to run. To get around this, we create a global variable called `interaction_type` that stores the current type of interaction (i.e., brush or click). There are two `observeEvent` functions that will listen and update as needed. Pay special attention to the double assignment operator (<<-), this is needed to change the global variable.

```r
library(ggplot2)

server <- function(input, output, session) {
  
  # global variable, what type of plot interaction
  interaction_type <- "click"
  
  # observe for user interaction and change the global interaction_type
  # variable
  observeEvent(input$user_click, interaction_type <<- "click")
  observeEvent(input$user_brush, interaction_type <<- "brush")
  
  output$plot <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  # generate the data to put in the table
  dat <- reactive({
    
    user_brush <- input$user_brush
    user_click <- input$user_click
    
    if(interaction_type == "brush") res <- brushedPoints(mtcars, user_brush)
    if(interaction_type == "click") res <- nearPoints(mtcars, user_click, threshold = 10, maxpoints = 1)
    
    return(res)
    
  })
  
  output$table <- DT::renderDataTable(DT::datatable(dat()[,c("mpg", "cyl", "disp")]))
  
}

ui <- fluidPage(
  
  h3("Click or brush the plot and it will filter the table"),
  plotOutput("plot", click = "user_click", brush = "user_brush"),
  DT::dataTableOutput("table")
  
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:700px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app37'></iframe>

### Example app: Brush with map and plot

This app is a slightly more complex version of the brush functionality. In this example, the user selections update in both a plot and on a leaflet map. The approach is very similar, though, to the previous app. We include a brush argument in the `plotOutput`, and we use a brush to select points with the brushedPoints function.

```r
library(leaflet)
library(ggplot2)


#### server
server <- function(input, output, session) {
  
  dat<-reactive({
    long <- runif(input$myslider, -121, -77 )
    lat <- runif(input$myslider, 33, 48)
    val1 <- runif(input$myslider, 1, 50)
    val2 <- rnorm(input$myslider, 1, 50)
    data.frame(latitude = lat, longitude = long, val1, val2)
  })
  
  br <- reactive({
    brushedPoints(dat(), input$plot_brush)
  })
  
  output$plot <- renderPlot({
    ggplot(dat(), aes(val1, val2, color=val2)) + geom_point() +
      ggtitle("Select points by brushing graph")
  })

  output$mymap <- renderLeaflet({

   # if nothing has been selected use the data itself, otherwise
   # use a brushed version
   ifelse(is.null(input$plot_brush), dat <- dat(), dat <- br() )

    leaflet(data = dat) %>%
      addProviderTiles("CartoDB.Positron",
                       options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(~longitude, ~latitude) %>%
      setView(-98, 38.6, zoom=3)
  })
  
  output$table_brushedpoints <- renderTable({
    br()[,c("val1", "val2")]
  })
}

#### user interface
ui <- fluidPage(
  
  titlePanel("Example of leaflet interactive map using brushing"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Slider changes number of points"),
      sliderInput(inputId = "myslider", "Number of points:",
                  min = 5, max = 20, value = 10, step = 1),
      plotOutput("plot", height = 250,
                 brush = brushOpts(id = "plot_brush", resetOnNew = TRUE,
                                   fill = "red", stroke = "#036", opacity = 0.3)),
      h4("Brushed points appear here"),
      tableOutput("table_brushedpoints")
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

<iframe style="width:100%; height:1100px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app38'></iframe>