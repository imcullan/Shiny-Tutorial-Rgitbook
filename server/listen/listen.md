# Listen for changes with observe or reactive, the Shiny hearing aids

The values associated with your UI inputs (like the text box, `input$mytext`) are called reactive values. It is tempting to include `input$mytext` directly in the server, but try running the code below in your own console, and you will get an error *operation not allowed without an active reactive context*. This means that to read the reactive value you need to wrap it in a function designed to listen to the reactive elements. Note that if you run this code locally (and get the error) you'll need to click on the "stop" button in the console to stop the app.

### Example app: Careful, you can't include bare reactive values in the server

This will throw an error because the reactive value is not being read by a function designed to handle it! Instead we need to wrap the values in an `observe`, `reactive` or `render` function that is designed to handle reactive content. In the console, you will see the error.

```r
server <- function(input, output, session) {
  # this will NOT work!!
  print(input$mytext)
}

ui <- basicPage(
  
  h3("A couple of simple widgets that don't do anything yet"),
  # a slider
  sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
              max = 100, value = c(40, 60)),
  # a text input box
  textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:250px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app11'></iframe>