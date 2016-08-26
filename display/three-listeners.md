# Putting the three listeners, reactive, observer and render together in your server

In the example below we're including one typical-use case for each of the three listeners. In a later example, we will link them together in a more meaningful way, but there is one more topic to cover before we do that.

### Example app: `observe`, `reactive` and `render` in one app

The `reactive` function generates data (an output but no UI side effects). The `observe` is designed to update the text box (a side effect, but does not produce output). The `renderTable` function returns the table to the UI.

```r
server <- function(input, output, session) {
  
  # when the slider changes update the text box
  observe({
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  # when the slider changes update the dataset
  dat <- reactive({
    input$myslider
    cars[1:input$myslider,]
    
  })
  
  # Since dat() is generated from a reactive that 
  # is triggered by input$myslider this table will update
  # any time that input$myslider updates
  output$mytable <- renderTable({
    dat()
  })
  
}

ui <- fluidPage(
  
  titlePanel("An app using an observe, reactive and render"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("myslider", "Number of rows to display", min=1, max=50, value=5),
      textInput(inputId = "mytext", label = "Slider value")
    ), # end sidebar panel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Table", tableOutput("mytable"))
      )
    ) # end main panel
  )
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:560px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app26'></iframe>