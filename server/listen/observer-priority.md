# Observer priority: which observers run first

With bigger apps, you may have situations where you want one observer to run before others. You can use an observe function `priority` argument to do this. The default priority is 0, and higher numbers mean higher priority (and you can use negative numbers).

### Example app: No priority specified
The order of execution is not always predictable in Shiny apps. In this example we have two observers and they **both write to the same output text box**. This app uses default priorities. The second observer will run second and, therefore, write over the updates from the first observer.

```r
server <- function(input, output, session) {
  
  # With no priority specified the second observer will
  # run second and overwrite the first observer
  observe({
    txtA <- paste("First observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtA)
  })
  
  observe({
    txtB <- paste("Second observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtB)
  })
  
}

ui <- basicPage(
  h3("Second observer runs second so it overwrites the first observer"),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:220px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app16'></iframe>

### Example app: Prioritize to control order of execution

Instead of default priorities we will force the first observer to run second so that it writes over the updates from the second observer. To do this we have a higher `priority` for the second observer so that it runs first.

```r
server <- function(input, output, session) {
  
  # first observer has lower priority so it runs second and will
  # overwrite the other observer
  observe({
    txtA <- paste("First observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtA)
  }, priority = 1)
  
  # second observer has higher priority so it will run first and
  # then be overwritten
  observe({
    txtB <- paste("Second observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtB)
  }, priority = 2)
  
}

ui <- basicPage(
  
  h3("Priority is higher for second observer so it runs first and then gets written over by the first observer"),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:250px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app17'></iframe>