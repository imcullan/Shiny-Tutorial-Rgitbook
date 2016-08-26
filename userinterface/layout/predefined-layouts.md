# Using predefined layout functions

As mentioned above, you will choose a layout function depending on the type of app you want. For this example, we will take advantage of a Shiny template using the function `sidebarLayout` which creates a page with a sidebar and a main panel. You can review other layout options in the [RStudio layout guide](http://shiny.rstudio.com/articles/layout-guide.html). In this example we're creating a `sidebarPanel` and `mainPanel` and not much else.

**Note that in a fluid design your sidebar and other elements may "collapse" if your browser view is not wide enough.**

### Example app: Basic user interface
```r
#### server
server <- function(input, output, session) {
  
}

#### user interface
ui <- fluidPage(
  
  titlePanel("App with simple layout"),
  
  sidebarLayout(
    
    sidebarPanel(
      "Sidebar"
    ), #endsidebarpanel
    
    mainPanel(
      "This is the main panel"
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:188px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app2'></iframe>