# Shiny at its simplest

In its simplest form, a Shiny application requires a server function to do the calculations and a user interface. Below we have the simplest possible shiny app. We create an empty server, a UI with a basic message and then launch the app with the `shinyApp` function. Voila! a functioning web application created entirely in R!

For simplicity, we're creating our Shiny apps in this tutorial as single file apps. In the past, Shiny required that you create two separate files (server.R and ui.R) but as of version 0.10.2 Shiny supports single file applications with both server and UI code in the same file. With bigger apps, of course, you will likely have far more files and want to use ui.R and server.R, but for the mini-apps in this tutorial we will create single page apps.

A second difference with earlier versions of shiny is that the user interface required using a ui handler function (`shinyUI`), but this is no longer required. Instead you choose the function associated with the type of page you want to use as discussed in the [layout guide](http://shiny.rstudio.com/articles/layout-guide.html). In relatively big apps, we use `fluidPage` but for most of this tutorial we keep things simple with `basicPage`.

Depending on what you want to do with your app, the session argument is not required in the server, but since you need it for some tasks, a best practice would be to include it.

###Example app: The simplest possible app

Not much here, but this is a real Shiny app.

```r
library(shiny)

server <- function(input, output, session) { } #the server

ui <- basicPage("This is a real Shiny app") # the user interface

shinyApp(ui = ui, server = server) # this launches your app
```

<iframe style="width:100%" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app1'></iframe>