library(ggplot2)


server <- function(input, output, session) {
  
  # global variable, what type of plot interaction
  interaction_type <- "click"
  
  # observe for user interaction and change the global interaction_type
  # variable
  observeEvent(input$user_click, interaction_type <<- "click")
  observeEvent(input$user_brush, interaction_type <<- "brush")
  
  output$plot <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  # generate the data to put in the table
  dat <- reactive({
    
    user_brush <- input$user_brush
    user_click <- input$user_click
    
    if(interaction_type == "brush") res <- brushedPoints(mtcars, user_brush)
    if(interaction_type == "click") res <- nearPoints(mtcars, user_click, threshold = 10, maxpoints = 1)
    
    return(res)
    
  })
  
  output$table <- DT::renderDataTable(DT::datatable(dat()[,c("mpg", "cyl", "disp")]))
  
}


ui <- fluidPage(
  
  h3("Click or brush the plot and it will filter the table"),
  plotOutput("plot", click = "user_click", brush = "user_brush"),
  DT::dataTableOutput("table")
  
)

shinyApp(ui = ui, server = server)