# Use an existing "theme"

Bootstrap offers a number of pre-created themes that allow for a complete change of style with limited coding. The `shinythemes` package from RStudio allows you to take advantage of this capability. The only change you need to make to your app is to add a line of code `theme=shinytheme("cosmo")` to your `fluidPage` or `fixedPage` function and the entire look of your app will change (you cannot apply themes to the `basicPage` because `basicPage` is not based on Bootstrap).

In this particular example, you won't see much difference since the app is so simple, but with bigger apps, the changes are significant-- you can see examples in the [Rstudio documentation for shinythemes](http://rstudio.github.io/shinythemes/).

### Example app: Use a pre-existing Bootstrap theme

```r
library(shinythemes)

server <- function(input, output, session) {
  
}

ui <- fluidPage(theme=shinytheme("cosmo"),
  
  titlePanel("Use an existing theme"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Note the button is black. This is different from the previous app."),
      actionButton("button", "A button")
    ), 
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot"), 
        tabPanel("Summary"), 
        tabPanel("Table")
      )
    )
  )
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:310px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app5'></iframe>