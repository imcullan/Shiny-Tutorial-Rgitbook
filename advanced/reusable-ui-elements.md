# Create re-useable UI elements

What if you have an app that puts the same element in multiple tabs? Perhaps you have a variable select box that needs to be on 10 different tabs? Well, you can create it once and then copy and paste it onto the other tabs, but this presents several issues:

1. What if you want to make changes? You'd need to make 10 changes.
2. Shiny requires that your elements all have unique IDs so you'd need to come up with a naming scheme. Perhaps select1, select2, etc.
3. Copy-paste is a pain and prone to error!

As an alternative, you can create a function that outputs the UI elements you need, and then, instead of repeating the code that creates those elements you can simply call the function. So in the example below, We create a function to generate a title, select box, radio buttons and a check box. Then call that function three times, one for each of the tabs.

(Note that in the newest versions of Shiny there is an alternative approach, modules, discussed below).

### Example app: Create re-useable UI elements
The `createSelectRadio` function, a function that we create in this app, takes an id as input and then creates and outputs a list of components. The new ID for each component is the component name and then, as a suffix, the id provided when running the function.

```r
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
```

<iframe style="width:100%; height:390px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app28'></iframe>