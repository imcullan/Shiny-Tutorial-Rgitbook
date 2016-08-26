server <- function(input, output, session) {
  
  # With no priority specified the second observer will
  # run second and overwrite the first observer
  observe({
    txtA <- paste("First observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtA)
  })
  
  observe({
    txtB <- paste("Second observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtB)
  })
  
}

ui <- basicPage(
  h3("Second observer runs second so it overwrites the first observer"),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)