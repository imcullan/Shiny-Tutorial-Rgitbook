# Add widgets to your user interface (text boxes, sliders etc)

At this point, we have scaffolded and added styles to our UI, but have not added any elements that will allow our user interface to be interactive. Shiny has a wide array of input widgets (e.g., pull-down menus, checkboxes) that we can use to add this functionality. Take a look at the [RStudio widget gallery](http://shiny.rstudio.com/gallery/widget-gallery.html) for a complete list.

For this particular example, we'll want a slider range and text input. Note that both of these, and all widgets, have a unique input id (`inputId`). The text is `mytext` and the slider is `myslider`. Be sure to give your inputs a unique id or you'll get the error, `input ids must be unique`.

We're still only focusing on the UI here, so these widgets "work"" but don't actually do anything because we have not included any code in the Shiny server. In this particular example, we are including both a slider and a text input.

### Example app: Allow user input

Simple app with widgets, though the widgets are not connected to the server yet. You can enter text and play with the slider but nothing will happen.

```r
server <- function(input, output, session) {
  
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

<iframe style="width:100%; height:250px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app10'></iframe>