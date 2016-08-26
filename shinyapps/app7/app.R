server <- function(input, output, session) {
  
}

ui <- basicPage(
  
  includeCSS("style.css"),
  
  h2("CSS by reading an external page"),
  p("Some important text")
  
)

shinyApp(ui = ui, server = server)