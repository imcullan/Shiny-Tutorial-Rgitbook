server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    mtcars[1:input$myslider, c("mpg", "cyl", "disp")]
  })
  
  output$mytable <- shiny::renderDataTable(dat())
}

ui <- basicPage(
  h3("Interactive table using the now deprecated Shiny data table renderer"),
  sliderInput("myslider", "Number of rows to display", min=1, max = 32, value = 5),
  shiny::dataTableOutput("mytable")
  
)

shinyApp(ui = ui, server = server)