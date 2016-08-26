# observe: Featuring observe to generate side effects and no output

Observers will be triggered in response to reactive values. They were designed to listen to reactive elements and respond by causing side effects, like updates to text boxes or pull-downs. Unlike the `reactive` function, which we cover next, they should not be used to return data or values.

There are two flavors of `observe`. With `observe`, the code inside will be triggered when any of the reactive values inside change. With `observeEvent`, code will only be triggered by specified reactive values. It is suggested that you use `observeEvent` whenever possible because `observeEvent` forces you to think through and specify the reactions you want to see.

So, back to the example from above. Instead of including `input$mytext` alone in the server (which causes an error) we can put the `input$mytext` in an observer and use it to update `myresults`. Any time the user makes a change to `mytext`, the observer code will run, and `myresults` will be updated.

### Example app: Use `observe` to react and cause side effects

We use the `observe` function to listen for changes to the reactive value associated with the input text box (`input$mytext`). When `input$mytext` changes, the observer code runs and updates `myresults`.

```r
server <- function(input, output, session) {
  # this will work, the reactive element is wrapped in an observer
  # it prints the value to the to the results text box
  observe({
    updateTextInput(session, inputId = "myresults", value = input$mytext) 
    
  })
}

ui <-   basicPage(
  h3("The value in the text box gets printed to the results text box."),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:220px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app13'></iframe>