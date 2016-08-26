server <- function(input, output, session) {
  
  output$my_output_text <- renderText({
    init <- "Your value is: "
    return(paste0(init, input$mytext))
  })
  
  # send plot to the ui as my_output_plot
  output$my_output_plot <- renderPlot({
    plot(1:10, 1:10, pch=16, col=1:10, cex=1:10, main = input$mytext)
  })
  
}

ui <- basicPage(
  
  h3("Now we have both text and plot output"),
  textInput("mytext", "Input goes here"),
  
  # my_output_text comes from the server
  textOutput("my_output_text"),
  # my_output_plot comes from the server
  plotOutput("my_output_plot")
  
)

shinyApp(ui = ui, server = server)