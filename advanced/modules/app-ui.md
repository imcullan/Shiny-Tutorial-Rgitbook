# App UI

In your app UI, you can include any UI elements that are not included in the module **and** you include your module. Since your module UI is a function, you call this function and feed it a prefix, anything you want.

```r
ui <- fluidPage(
  h3("This is not part of the module but the pieces below were created with a module"),
  scatterUI("prefix")
)
```
