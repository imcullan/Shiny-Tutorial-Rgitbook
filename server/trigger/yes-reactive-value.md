# If there is a reactive value the code will run on app load and then on each change

Conversely, if you include a reactive value in an `observe` (or `reactive` or `render`) function, the code inside will be triggered on app load and then every time the reactive value changes, even if that reactive value is not used in any calculations. So in the code below, you can see that `input$mytext` is not actually part of the print statement, it's not used in any calculations. Nevertheless, any time your user changes the text box this server will print 1 to 10 to the console. This is a very important concept: **a reactive value in your `observe` or `reactive` functions will trigger that function to run if the user interacts with it even if the reactive element is not part of the calculations.**

```
server <- function(input, output, session) {
  observe({
    input$mytext
    # this will run on app load and then again every time "mytext" changes
    print(1:10) 
    })
}
```