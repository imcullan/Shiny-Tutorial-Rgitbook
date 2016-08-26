# You need a UI that reads the HTML template

Your server and UI will be very similar to an all-R app except that the UI needs to read the HTML template and feed the template whatever Shiny components you want on the page. This is done with the `htmlTemplate` function.

So in the current example, we read the `template.html` file in the same directory as app.R and and also use the `htmlTemplate` function to feed two objects: `shinycontrols` which is a block of Shiny controls, and `justslider` which is a simple slider to the `template.html`.

```r
# here are some elements I want to include as a block
block_of_stuff <- list(
  selectInput("my_select", "Select something please", c("A", "B", "C"), selected="B"),
  textInput("my_text", "A text box", value = "initial value")
)

# user interface
ui <- fluidPage(
  htmlTemplate("template.html",
               shinycontrols =  block_of_stuff,
               justslider = sliderInput("my_slider", "A slider from the Shiny UI", 0, 10, 5)
  )
)
```

### Example app: An app using HTML templates

This app reads the file, `template.html` and then feeds it a block of controls called `shinycontrols` and a slider called `justslider`.

```r
server <- function(input, output, session) {
  
}

# here are some elements I want to include as a block
block_of_stuff <- list(
  selectInput("my_select", "Select something please", c("A", "B", "C"), selected="B"),
  textInput("my_text", "A text box", value = "initial value")
)

# user interface
ui <- htmlTemplate("template.html",
                   shinycontrols =  block_of_stuff,
                   justslider = sliderInput("my_slider", "A slider from the Shiny UI", 0, 10, 5)
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:850px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app36'></iframe>