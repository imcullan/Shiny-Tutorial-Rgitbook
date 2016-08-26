# Dynamic UI with renderUI and outputUI

If you want to return a block of UI elements, say a paragraph, then a text box and a selector, you would use `renderUI` and `outputUI`, and instead of returning one object, you return a `list` or `tagList` of objects (these functions can be used interchangeably).

### Example app: Dynamic user interface

Instead of returning a single object, we are returning a list of objects. Specifically, our `my_output_UI` output is a list of an `h4` header and a `selector`. The selector gets updated when the user clicks on the button (note `observeEvent`). Each time the user clicks the button the `selections` gets updated.

```r
server <- function(input, output, session) {
  
  # return a list of UI elements
  output$my_output_UI <- renderUI({
    
    list(
      h4(style = "color:blue;", "My selection list"),
      selectInput(inputId = "myselect", label="", choices = selections)
    )
  })
  
  # initial selections
  selections <- c("New York", "Philadelphia")
  
  # use observe event to notice when the user clicks the button
  # update the selection list. Note the double assignment <<-
  observeEvent(input$mybutton,{
    selections <<- c(input$mytext, selections)
    updateSelectInput(session, "myselect", choices = selections, selected = selections[1])
  })

}

ui <- basicPage(
  
    h3("Using renderUI and uiOutput"),
    uiOutput("my_output_UI"),
    textInput("mytext", ""),
    actionButton("mybutton", "Click to add to selections")

)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:300px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app25'></iframe>