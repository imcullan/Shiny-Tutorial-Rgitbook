# Understanding and controlling when reactive functions get triggered

In our examples above, we included a reactive value (`input$mytext`) in `observe` or `reactive`. Each time the user changes the text value, the server updates the text box. No problem. These rules also apply to the family of `render` functions which we discuss later on.

But, and here is a mini test,:

* What happens if you have no reactive value in an `observe` function?
* What happens if your reactive value **is** in the `observe` function but is not involved in any calculations?