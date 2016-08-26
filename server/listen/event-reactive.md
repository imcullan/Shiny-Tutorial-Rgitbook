# eventReactive: used to prevent unwanted reactions in a reactive function

Similar to the function `observeEvent`, which allows you to specify which reactive values trigger a code run, `eventReactive` can do the same for reactive functions.

### Example app: Using `eventReactive` to prevent unwanted reactions

Sometimes you only want your reactive function to listen for specific reactive values, and this is when you use `eventReactive` or `observeEvent`. In this app, we have a `reactive` function that responds to both reactive values and an `eventReactive` that only reacts to changes in `input$mytext`.

```r
server <- function(input, output, session) {
  
  # since both mytext and myslider are in the reactive
  # they both trigger the code to run
  myresults <- reactive({
    paste(input$mytext, input$myslider)
  })
  
  # eventReactive here tells Shiny only to trigger this code
  # when mytext changes
  myresults_lim <- eventReactive(input$mytext, {
    paste(input$mytext, input$myslider)
  })
  
  observe(updateTextInput(session, "myresults", value = myresults()))
  observe(updateTextInput(session, "myresults_lim", value = myresults_lim()))

}

ui <- basicPage(
  
    h3("Using eventReactive to limit reactions."),
    sliderInput("myslider", "", min=0, max=1000, value=500),
    textInput("mytext", "Input goes here"),
    textInput("myresults", "Text box + slider (updates when either changes)", "Initial value"),
    textInput("myresults_lim", "Text box + slider (updates when text box changes)", "Initial value")
    
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:430px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app19'></iframe>