# Since reactive values trigger reactive functions, you should keep reactive values separated whenever possible

As we discussed above, because any reactive value in a reactive function will trigger code to run, you want to be careful to modularize your code as much as possible. In other words, keep calculations separated as much as possible. Reactive functions are a good way to do this. You can use reactive functions to isolate code and only run that code when necessary. Take, for example, the following app. We include the reactive associated with both the slider and the text input in the same observer. As a result, even if the user only changes the slider, **all the code in the observer will run**, even the pieces associated with the text box.

### Example app: Reactive values are not kept separate (less good)

Both reactive values (`input$mytext` and `input$myslider`) are in the same observer, meaning that all the code in that observer runs when either changes.

```r
#### server
server <- function(input, output, session) {
  
  # Notice that even if you only change the text box that the 
  # slider code also runs and gets changed. The reverse is also
  # true. You might want to isolate these pieces.
  observe({
    txt <- paste(input$mytext, sample(1:100, 1))
    val <- paste(input$myslider,  sample(1:100, 1), sep="-")
    
    res <- paste0(txt, " | Slider ", val)
    updateTextInput(session, "myresults", value = res)
  })
}

ui <- basicPage(
  
  h3("Change to text OR slider changes both parts of results text box"),
  sliderInput("myslider", "A slider:", min=0, max=1000, value=500),
  textInput("mytext", "Input goes here", "Text"),
  textInput("myresults", "Results will be printed here", "Initial value")
  
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:320px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app20'></iframe>

### Example app: Reactive values are kept separate (better)

Here, we refactor the code above so that the slider and text reactive values are in separate reactive functions. This way if the text reactive changes, only the relevant code gets run. Likewise for the slider.

```r
server <- function(input, output, session) {
  
  # Now if you change the slider only the slider result changes
  # and the text box result stays the same. This is because
  # we isolated the reactive values in their own reactive function
  
  txt <- reactive({paste(input$mytext, sample(1:100, 1))})
  val <- reactive({paste(input$myslider, sample(1:100, 1), sep="-")})
  
  observe({
    res <- paste0(txt(), " | Slider ", val())
    updateTextInput(session, "myresults", value = res)
  })  
  
}

ui <- basicPage(
  
    h3("Changes to the text box and slider are separated so that a change to the text box will not affect the slider part of the results textbox"),
    sliderInput("myslider", "A slider:", min=0, max=1000, value=500),
    textInput("mytext", "Input goes here", "Text"),
    textInput("myresults", "Results will be printed here", "Initial value")

)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:340px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app21'></iframe>