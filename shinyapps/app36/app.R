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