server <- function(input, output, session) {
  
  # input$mytext comes from the UI. my_output_text gets
  # sent back
  output$my_output_text <- renderText({
    return(input$mytext)
  })
}

ui <- basicPage(
  h3("The value in the text box gets printed below with the textOutput function."),
  textInput("mytext", "Input goes here"),
  
  # my_output_text comes from the server
  "Your value is:",
  textOutput("my_output_text")
)

shinyApp(ui = ui, server = server)