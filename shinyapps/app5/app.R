library(shinythemes)

server <- function(input, output, session) {
  
}

ui <- fluidPage(theme=shinytheme("cosmo"),
                
                titlePanel("Use an existing theme"),
                
                sidebarLayout(
                  
                  sidebarPanel(
                    h3("Note the button is black. This is different from the previous app."),
                    actionButton("button", "A button")
                  ), 
                  
                  mainPanel(
                    tabsetPanel(
                      tabPanel("Plot"), 
                      tabPanel("Summary"), 
                      tabPanel("Table")
                    )
                  )
                )
)

shinyApp(ui = ui, server = server)