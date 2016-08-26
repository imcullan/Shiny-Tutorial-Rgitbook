# Link your user interface with the server to display text, tables and plots

The third type of listener (after `observe` and `reactive`) is designed to create data-related items to add to your user interface. In the previous mini-apps we listened and reacted to reactive values with `observe` or `reactive` but simply updated a text box. Not that exciting. The functions like `renderText` or `renderPlot` and their UI counterparts, `textOutput` and `plotOutput`, enable you to create meaningful output.
