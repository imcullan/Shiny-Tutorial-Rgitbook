# App Server

Similar to the app UI, you include any non-module related processing in your app server, and then include the module server with the function `callModule`. You feed `callModule` the name of the module server function, the prefix you're using and any additional arguments to your module server.

```r
server <- function(input, output,session){
  callModule(scatter, "prefix", "purple")
}
```

### Example app: simple module example

This example demonstrates the code needed to use a module, but is not a very practical example since the purpose of using modules would be to re-use code. See the next example for a more realistic example.

```r
library(ggplot2)
# module UI
scatterUI <- function(id) {
  ns <- NS(id)
  list(
    plotOutput(ns("plot1"))
  )
}

# module server
scatter <- function(input, output, session, my_color) {
  output$plot1 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point(color=my_color, size=2)
  })
}

# app ui
ui <- fluidPage(
  h3("This is not part of the module but the plot below was created with a module"),
  scatterUI("prefix")
)

# app server
server <- function(input, output,session){
  callModule(scatter, "prefix", "purple")
}

shinyApp(ui, server)
```

<iframe style="width:100%; height:500px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app34'></iframe>

### Example app: more practical module example

This app is a little harder to follow but a better example of how modules can be useful. In this app the module creates a slider and two plots. As input, the module function takes the name of the `data.frame` as well as several plot-related variables. This way you can create side-by-side plots with a slider using multiple datasets with slight alterations to the app server.

```r
library(ggplot2)

# MODULE UI
scatterUI <- function(id) {
  ns <- NS(id)
  list(
    div(sliderInput(ns("slider1"), label = "Limit points", min = 0, max = 32, value = 15)),
    div(style="display: inline-block; height:220px;", plotOutput(ns("plot1"))),
    div(style="display: inline-block; height:220px;", plotOutput(ns("plot2")))
  )
}

# MODULE Server
scatter <- function(input, output, session, datname, var1, var2, ptshape, col1, col2) {
  dat <- eval(as.name(datname))
  dat <- dat[order(dat[[var1]]),]
  
  resultdata <- reactive({
    dat[1:input$slider1,]
  })
  
  output$plot1 <- renderPlot({
    plot(1:10)
    ggplot(resultdata(), aes_string(var1, var2)) + geom_point(color=col1, shape=ptshape, size=3)+
      ggtitle(paste("Using the", datname, "data.frame"))
  }, width=200, height=200)
  
  output$plot2 <- renderPlot({
    plot(1:10)
    ggplot(resultdata(), aes_string(var1, var2)) + geom_point(color=col2, shape=ptshape, size=3) +
      ggtitle(paste("Using the", datname, "data.frame"))
  }, width=200, height=200)
}


# App ui
ui <- fluidPage(
  h3("The module creates two plots and a slider and is called twice below"),
  scatterUI("prefix"),
  scatterUI("prefix2")
)

# App server
server <- function(input, output,session){
  callModule(scatter, "prefix", "cars", "speed", "dist",  1, "red", "blue")
  callModule(scatter, "prefix2", "mtcars", "mpg", "hp", 17, "forestgreen", "purple")
}

shinyApp(ui, server)
```

<iframe style="width:100%; height:730px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app35'></iframe>