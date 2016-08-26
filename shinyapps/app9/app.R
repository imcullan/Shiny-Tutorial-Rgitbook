library(shinyjs)

server <- function(input, output, session) {
  
}

ui <- fluidPage(
  
  # This adds the CSS to the file
  shinyjs::inlineCSS(list(body = "color:DarkBlue")),
  titlePanel("Use the shinyjs package to add styles"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Sidebar title")
    ), 
    
    mainPanel(
      "Body text"
    )
  )
)

shinyApp(ui = ui, server = server)