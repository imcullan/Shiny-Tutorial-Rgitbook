# Module UI

This is a function that takes, as input, an id that will end up getting pre-pended to all your HTML element ids. You can manually paste together your prefix and the IDs, but there is a helper function to make it a little easier called `NS`. `NS` creates a new function you can use to do the pasting a little more simply.

```r
scatterUI <- function(id) {
  ns <- NS(id)
  list(
    plotOutput(ns("plot1"))
  )
}
```