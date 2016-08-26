# observeEvent: use observeEvent to prevent unwanted reactions

As mentioned previously, the code in an `observe` will run if **any** of the reactives inside change. So in the following code the results text box will update if the user interacts with the input text box **or** with the slider. Even though the slider reactive `input$myslider` is not actually being used in any way. Any reactive value in the observe function will trigger all the code in the observe function to run.

### Example app: All the reactive values in `observe` will trigger the code to run (even if that's not what you want)

Since `input$myslider` and `input$mytext` are in the observer, when the user makes a change to **either**, the observer code will run.

**Note that in the next couple of apps, a random number is pasted to the text to make it easier to see updates.**

```r
server <- function(input, output, session) {
  
  observe({
    # even though the slider is not involved in a calculation, if
    # you change the slider it will run all this code and update the text box
    # changes to the mytext box also will trigger the code to run
    input$myslider
    txt <- paste(input$mytext, sample(1:10000, 1))
    updateTextInput(session, inputId = "myresults", value = txt)  
  })
}

ui <- basicPage(
  h3("The results text box gets updated if you change the other text box OR the slider."),
  sliderInput("myslider", "A slider:", min=0, max=1000, value=500),
  textInput("mytext", "Input goes here", value = "Initial value"),
  textInput("myresults", "Results will be printed here")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:340px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app14'></iframe>

The `observeEvent` function is designed to address this issue. With `observeEvent` the code inside will only run if the specified reactive values change. So in the following code, the update will only execute if the user makes changes to the text box.

### Example app: Only specified reactive(s) trigger the code to run using `observeEvent`.

Using `observeEvent` instead of `observe` allows you to specify the reactive values to listen for and react to. In this case, we're only listening for one reactive (`input$mytext`), but you can include more than one.

```r
server <- function(input, output, session) {
  
  # Using observeEvent we're telling Shiny only to run this code
  # if mytext gets updated.
  observeEvent(input$mytext, {
    
    # myslider is a reactive but it does not trigger the code to 
    # run here because we're using observeEvent and only specified
    # input$mytext
    input$myslider
    txt <- paste(input$mytext, sample(1:10000, 1))
    updateTextInput(session, inputId = "myresults", value = txt)  
    
  })
}

ui <- basicPage(
  
  h3("The results text box only updates when you change the top text box (slider interactions do not trigger an update)."),
  sliderInput("myslider", "A slider:", min=0, max=1000, value=500),
  textInput("mytext", "Input goes here", value = "Initial value"),
  textInput("myresults", "Results will be printed here")
  
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:340px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app15'></iframe>