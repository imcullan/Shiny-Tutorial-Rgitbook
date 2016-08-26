# If there is no reactive value the code will run once and never again

If the `observe` (or `reactive` or `render`) function has no reactive value inside it, it will run when you launch the app but never again. So in this server code, the values 1-10 will print to the console once and then never again. That's it.

```r
server <- function(input, output, session) {
  observe({
    # will only run when the app loads, never again
    print(1:10) 
    })
}
```