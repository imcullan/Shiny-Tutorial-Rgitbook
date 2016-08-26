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