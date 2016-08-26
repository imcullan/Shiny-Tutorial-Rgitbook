# Layout your app using Bootstrap's grid system manually

If you're new to CSS, creating your layout can be challenging and you will need to familiarize yourself with the [Bootstrap basics](https://getbootstrap.com/examples/grid/) before getting started. When you're comfortable, you can use Bootstrap's grid system directly by specifying rows, columns, and column spans. As a general rule, all Bootstrap layouts are 12 columns across, and these columns can be grouped to make wider columns.

In the example below, we have a layout with 2 rows. One is offset by one column and the other has a button (one column width) and text (6 column width).

### Example app: Manual layout using Bootstrap's grid system
In this app we use Bootstrap elements like rows and columns to manually layout the app.

```r
server <- function(input, output, session) {
  
}

ui <- fluidPage(
  
  fluidRow(
    column(6,
           h1("Title in one row")
    )
  ),
  
  fluidRow(
    column(1,
      actionButton("button", "Click")
    ),
    column(6,
      p("Row 2, Column 2 (button is col 1)")
    )
  )
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:150px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app4'></iframe>