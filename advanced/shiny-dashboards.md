# Shiny dashboards

With an R backend for processing and strong plotting capabilities, Shiny is well-suited to creating dashboards. Dashboards can be created manually using the techniques discussed above, but creating them is simpler with the Rstudio package `shinydashboard`. To create a dashboard, you need a header, sidebar and body. Within the body you create a series `tabItems` and fill them with the controls you want to see included. For more detail you should refer directly to the [shiny dashboard page on GitHub](https://rstudio.github.io/shinydashboard).

### Example app: A simple dashboard

```r
library(ggplot2)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
     sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          box(plotOutput("plot2", height = 250)),

          box(
            title = "Controls",
            sliderInput("myslider", "Number of observations:", 1, 50, 15)
          )
        )
      ),

      # Second tab content
      tabItem(tabName = "widgets",
        h2("Widgets tab content")
      )
    )
  )
)

server <- function(input, output) {
  histdata <- rnorm(500)

  output$plot1 <- renderPlot({
    dat <- mtcars[1:input$myslider,]
    ggplot(dat, aes(mpg)) + geom_histogram(fill="cadetblue")
  })
   output$plot2 <- renderPlot({
    dat <- mtcars[1:input$myslider,]
    ggplot(dat, aes(mpg, wt)) + geom_point() + stat_smooth()
  })
}

shinyApp(ui, server)
```

<iframe style="width:100%; height:900px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app40'></iframe>