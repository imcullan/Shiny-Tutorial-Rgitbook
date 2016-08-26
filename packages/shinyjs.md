# shinyjs

The `shinyjs` package, created by [Dean Attali](http://deanattali.com/), allows you to use common JavaScript operations in your Shiny applications such as hiding an element, delaying code, etc. The package provides more than a dozen useful functions that are described in a [page on GitHub](https://github.com/daattali/shinyjs). His talk on the package at the 2016 Shiny Developers Conference is also worth watching and will be posted by RStudio in the near future.

To use the functions, you need to load the package and then activate it in the UI with the `useShinyjs` function.

### Example app: `shinyjs` in action, try the toggle

This is just a tiny example of using the package to run JavaScript code.

```r
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
```

<iframe style="width:100%; height:200px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app27'></iframe>