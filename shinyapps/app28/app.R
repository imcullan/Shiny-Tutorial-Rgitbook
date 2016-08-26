server <- function(input, output, session) {
  
  # A function to create a block of UI elements this 
  # function can be re-used to create similar blocks
  # of ui elements in different places
  createSelectRadio <- function(id, title){
    
    selectID <- paste0("myselect", id)
    radioID <- paste0("myradio", id)
    checkID <- paste0("mycheck", id)
    
    res <- list(
      h2(title),
      selectInput(inputId = selectID, label="", choices = sample(LETTERS, 3)),
      radioButtons(inputId = radioID, label="", choices = sample(letters,3)),
      checkboxInput(inputId = checkID, label="", value=TRUE)
    )
    
    return(res)
  }
  
  # here we create our blocks of UI elements by running the function
  output$forPlot    <- renderUI({createSelectRadio(1, "In plot tab")})
  output$forSummary <- renderUI({createSelectRadio(2, "In summary tab")})
  output$forTable   <- renderUI({createSelectRadio(3, "In table tab")})
  
}

ui <- basicPage(
  
  h3("All tabs have the same set of components created with a function."),
  
  tabsetPanel(
    tabPanel("Summary", uiOutput("forSummary")), 
    tabPanel("Plot",    uiOutput("forPlot")), 
    tabPanel("Table",    uiOutput("forTable"))
  )
  
)

shinyApp(ui = ui, server = server)