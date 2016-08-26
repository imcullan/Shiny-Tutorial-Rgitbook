# Input from your user interface

Currently, our users can interact with our application all they want, but our server is deaf and dumb. There is no code in the server to tell it to listen or react.

To listen, it needs to know what to listen for, and this is where our unique input ids come in. Our widgets all have a unique ID that the server will listen for and react to. Each of these input ids is mapped to the input argument on our server. So, for example, if you want to access the value of the text box we created (which is called `mytext`) from within the server you would call `input$mytext`. Likewise, for the slider the values are in `input$myslider`. These objects from the UI (`input$myslider`, `input$mytext`) are called reactive values.

But, and this is one of the most challenging concepts in Shiny, you can't simply refer to `input$mytext` in the server to get the current value of the text box. Instead **you need to wrap these reactive values in one of the functions designed to handle interactive widget outputs**. The functions that can handle the reactive values are `observe`, `reactive` and the suite of `render` functions, all of which are discussed below.