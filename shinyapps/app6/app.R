server <- function(input, output, session) {
  
}

ui <- basicPage(
  # this is your web page header information
  tags$head(
    # here you include your inline styles
    tags$style(HTML("
                    
                    body {
                    background-color: cornflowerblue;
                    color: #6B1413;
                    }
                    
                    "))
    ),
  
  h3("CSS using the HTML tag"),
  p("Some important text")
  
    )

shinyApp(ui = ui, server = server)