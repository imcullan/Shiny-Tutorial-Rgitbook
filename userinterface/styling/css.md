# Style yourself with CSS

If you want to use your own CSS, you have several options. For the sake of completeness, we will cover them all, but the best practice is to include all of your CSS in an external stylesheet (let's say it's called `style.css`). If you're using a two page app (with a ui.R and server.R file) you can add a *www* folder at the same level as the UI and server files with your style sheet and this will be read automatically. Otherwise you can read your stylesheet with `includeCSS`. Here is your full list of options.

1. Include your raw CSS directly inline in the head of your app,
2. Include CSS within specific HTML tags,
3. With a two page app (ui.R and server.R) you can add a folder called *www* and the app will automatically read any CSS files you've included there.
4. The `shinyjs` package (discussed below) also has a useful function called `inlineCSS` that you can use to add CSS,
5. Use the `includeCSS` function to read an external CSS file.

As mentioned above, the best practice for larger apps would be to include all your CSS in a single, external file so that it's easy to find and change settings. For smaller apps including CSS in the head or HTML tags is acceptable, but be careful, if you include styling in the HTML tags it can be difficult to prioritize and organize your styles.

For more detail, see [RStudio's page on CSS](http://shiny.rstudio.com/articles/css.html).

### Example app: using inline CSS in the HTML head

Note that the actual style code is within an HTML function, this prevents Shiny from treating the text as regular text and escaping the strings.

```r
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
```

<iframe style="width:100%; height:200px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app6'></iframe>

### Example app: using `includeCSS` (assumes you have an external file called `style.css`)

In this case, the style.css file only has one bit of CSS: `body{background-color: Maroon;}`.

```r
server <- function(input, output, session) {

}

ui <- basicPage(

includeCSS("style.css"),
  
  h2("CSS by reading an external page"),
  p("Some important text")

)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:200px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app7'></iframe>

### Example app: including a style in an individual HTML tag

Usually, this isn't a great idea because it's hard to find your styles and it's even harder to be consistent with style. But for small apps it's fine.

```r
server <- function(input, output, session) {

}

ui <- basicPage(

  # here we style inline
  h2(style = "color:green; font-family:'Comic Sans MS'", 
     "Styles within an HTML tag (not recommended for big apps)"),
  p("Some important text")

)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:200px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app8'></iframe>

### Example app: An example of using the `shinyjs inlineCSS` function

The `shinyjs` package has a lot of nice add-on functionality and includes the `inlineCSS` function to make it easier to include CSS using a syntax that is more R-like. Note that instead of `body{color:DarkBlue}`, which is CSS, we have `list(body = "color:DarkBlue")` which is R code. This will make all the text blue.

```r
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
```

<iframe style="width:100%; height:220px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app9'></iframe>