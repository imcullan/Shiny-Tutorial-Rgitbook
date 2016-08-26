# reactive: use a reactive function to isolate code and generate output with no side effects

A `reactive` function is used in the same way you would use an R function, except that it is triggered by a reactive element. Because using `reactive` creates a function and returns results, you generally save a reactive as an object and use it elsewhere in your server, as you would use any R function. However, there is one major distinction from a function. The function can only be executed within a **reactive context** (so in another `reactive`, `observe`, or `render` function). The reactives are **NOT** supposed to generate side effects, they should be self-contained.

So in the example below, we use `reactive` to create a self-contained function called `myresults`. Since we want to print the results to the console (a side effect), I run the reactive function from within an observer. Note that since it's a function, we're using `myresults()` rather than just `myresults`.

### Example app: Using `reactive` to generate output

In this app, we use `reactive` to create a function that listens for the `input$mytext` reactive value. When it hears a change it generates a string as output.

```r
server <- function(input, output, session) {
  
  # this is my reactive function -- I'm using it to
  # isolate reactions related to the text box
  mystring <- reactive({
    paste(input$mytext, " is what the user types")
  })
  
  observe({
    # The reactive will run each time the textbox changes and
    # print results to the console.
    txt <- mystring()
    updateTextInput(session, inputId = "myresults", value = txt) 
  })
  
}

ui <- basicPage(
  
    h3("The reactive generates a string output which is added to the results text box"),
    textInput("mytext", "Input goes here"),
    textInput("myresults", "Results will be printed here", "")
    
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:250px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app18'></iframe>