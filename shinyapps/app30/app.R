server <- function(input, output, session) {
  
  observe({
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    mtcars[1:input$myslider,c("mpg", "cyl", "disp")]
    
  })
  
  # I'm setting paging = FALSE so all rows are shown all the time
  # scrollX adds a scrollbar, filter allows column filtering
  output$mytable <- DT::renderDataTable(dat(), 
                                        options = list(paging=FALSE, scrollX = TRUE), 
                                        rownames=TRUE, 
                                        filter = "top")
}

ui <- basicPage(
  
  h3("Interactive table using the DT data table renderer"),
  sliderInput("myslider", "Number of rows to display", min=1, max = 32, value = 5),
  DT::dataTableOutput("mytable")
  
) 

shinyApp(ui = ui, server = server)