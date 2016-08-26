# Adding elements with tags$xxx

It's easy to add HTML elements to your Shiny app using [HTML tags](http://shiny.rstudio.com/articles/tag-glossary.html). There are more than 100 HTML elements you can add to your page using the syntax `tags$OBJECT()`, for example,  `tags$p()` for a paragraph, or `tags$blockquote()`. For a limited number of these tags, the most common ones, there are helper functions that allow you to skip the `tags$` so, for example, a first tier header can be created with `h1()`, but be careful, not all tags allow this.

For more detail on generating HTML, it is recommended you review the [HTML tags page](http://shiny.rstudio.com/articles/html-tags.html) on the RStudio website.

### Example app: using HTML tags to layout your app

In this app we add HTML tags using, for example, `tags$blockquote` or, for common elements like `h1` we drop the `tags$`.

```r
server <- function(input, output, session) {
  
}

ui <- basicPage(
  h1("Title without tags$"),
  tags$blockquote("But block quote requires tags$ because it is less common than h3, h1 or code"),
  h3("H3 is fine without tags and so is code here"),
  code("data.frame(a=1:10, b=1:10)")
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:226px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app3'></iframe>