# Introduce the update functions

In the previous code (which doesn't work) you'll notice that we used a `print` statement in the server. This keeps things simple in the example apps but if you're not running these mini-apps locally, you won't see what's going on because `print` simply prints to the console, and you can't see the result in the online app. Since we want to see reactions even if we're not running the apps locally, we need to introduce one concept a little out of order.

In particular, we'll introduce the suite of `update` functions that are designed to allow you to update existing Shiny widgets, for example, update a text box or the list of items in a pulldown menu. In the next few apps we will be using a function called `updateTextInput`. Instead of print, we will use a text box as a console and print results to the text box with `updateTextInput`. Here is an example:

### Example app: Using `updateTextInput` as a "console""

In the app below you can see that we're printing the text typed into `mytext` to `myresults` with the function `updateTextInput`.

```r
server <- function(input, output, session) {
  
  observe({
    txt <- paste("Value above is:", input$mytext)
    
    # here I'm essentially writing a result to the text box
    # called myresults
    updateTextInput(session, "myresults", value=txt)
  })
  
}

ui <-   basicPage(
  h3("An example of an `update` function"),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:220px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app12'></iframe>