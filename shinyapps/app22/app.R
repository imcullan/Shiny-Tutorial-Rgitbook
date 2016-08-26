server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "text_output1", value = input$text_input)
  })
  
  # instead of observe and isolate, you could instead use observeEvent
  observe({
    input$updateButton
    updateTextInput(session, "text_output2", value = isolate(input$text_input))
  })
  
}

ui <- basicPage(
  
  h3("The value in the text box gets printed to the results text box."),
  textInput("text_input", "Type here"),
  textInput("text_output1", "This box is constantly updating"),
  
  textInput("text_output2", "Updates only with action button click"),
  actionButton("updateButton", "Update list")
  
)

shinyApp(ui = ui, server = server)