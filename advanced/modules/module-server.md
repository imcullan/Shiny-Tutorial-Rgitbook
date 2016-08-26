# Module Server

The module server includes the processing needed for your module and looks almost identical to your non-module server function except that you likely want to allow it to accept additional arguments. So below, we have a scatter function that will render the plot, and beyond the usual input, output and session arguments it will accept a color argument.

```r
scatter <- function(input, output, session, my_color) {
  output$plot1 <- renderPlot({
    ggplot(mtcars, aes_string(wt, mpg)) + geom_point(color=my_color, size=2)
  })
}
```
