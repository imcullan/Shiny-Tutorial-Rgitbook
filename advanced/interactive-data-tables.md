# Interactive data tables

Adding interactive tables to your Shiny app is easier than you think. The original version of the shiny package included a `renderDataTable` function, but this is slowly being deprecated in favor of a new `renderDataTable` function from the package `DT`. For the purposes of simply showing a table, the two options are very similar, but DT extends the styling and interaction capabilities. The `DT` package, created by Yihui Xie, has some pretty amazing functionality, take a look at the [documentation](https://rstudio.github.io/DT/shiny.html).

Keep in mind that the original `renderDataTable` function and the version in the package `DT` have slightly different syntax which can be confusing when you're looking for example code. I recommend you only use code where `DT` is explicitly loaded (after the `shiny` package) or you see the syntax `DT::renderDataTable` which specifies which version of the function to use.

### Example app: Using the `shiny` package for an interactive table

This app uses the `renderDataTable` function from Shiny.

```r
server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    mtcars[1:input$myslider, c("mpg", "cyl", "disp")]
  })
  
  output$mytable <- shiny::renderDataTable(dat())
}

ui <- basicPage(
  h3("Interactive table using the now deprecated Shiny data table renderer"),
  sliderInput("myslider", "Number of rows to display", min=1, max = 32, value = 5),
  shiny::dataTableOutput("mytable")
  
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:620px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app29'></iframe>

### Example app: Using the `DT` package for an interactive table

This app uses the `renderDataTable` function from `DT`.

```r
server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    mtcars[1:input$myslider,c("mpg", "cyl", "disp")]
    
  })
  
  # I'm setting paging = FALSE so all rows are shown all the time
  # scrollX adds a scrollbar, filter allows column filtering
  output$mytable <- DT::renderDataTable(dat(), 
                                        options = list(paging=FALSE, scrollX = TRUE), 
                                        rownames=TRUE, 
                                        filter = "top")
}

ui <- basicPage(
  
    h3("Interactive table using the DT data table renderer"),
    sliderInput("myslider", "Number of rows to display", min=1, max = 32, value = 5),
    DT::dataTableOutput("mytable")

) 

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:700px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app30'></iframe>