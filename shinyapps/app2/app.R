#### server
server <- function(input, output, session) {
  
}

#### user interface
ui <- fluidPage(
  
  titlePanel("App with simple layout"),
  
  sidebarLayout(
    
    sidebarPanel(
      "Sidebar"
    ), #endsidebarpanel
    
    mainPanel(
      "This is the main panel"
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)