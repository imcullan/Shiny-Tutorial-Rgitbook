# isolate: An alternative to observeEvent or eventReactive

Above, you saw that `observeEvent` and `eventReactive` can limit reactions to specified reactive values. An alternative to using those functions is to use `isolate` in `observe`, `reactive`, or `render`. Generally, it's better to use `observeEvent` and `eventReactive` because `isolate` will be harder to find in your code, but there are times when `isolate` can be useful.

### Example app: Use `isolate` to avoid triggering reactions

In this example, we have two text boxes that update with the input text. One updates constantly, and in the other we've used `isolate` to ensure it only gets triggered with a button click.

```r
server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "text_output1", value = input$text_input)
  })
  
  # instead of observe and isolate, you could instead use observeEvent
  observe({
    input$updateButton
    updateTextInput(session, "text_output2", value = isolate(input$text_input))
  })
  
}

ui <- basicPage(
  
    h3("The value in the text box gets printed to the results text box."),
    textInput("text_input", "Type here"),
    textInput("text_output1", "This box is constantly updating"),
    
    textInput("text_output2", "Updates only with action button click"),
    actionButton("updateButton", "Update list")
 
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:340px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app22'></iframe>