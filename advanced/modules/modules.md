# Shiny modules

At the Shiny Developers Conference, Garrett Grolemund from RStudio gave a great presentation on Shiny modules. They are designed, in part, to help solve the issue of re-useability discussed above in [creating re-useable UI elements](http://zevross.com/blog/2016/04/19/r-powered-web-applications-with-shiny-a-tutorial-and-cheat-sheet-with-40-example-apps/#create-re-useable-ui-elements). You may have, as an example, a block of UI widgets you want to repeat on multiple pages. Rather than copy and paste code, you can use modules to help manage the pieces. For more detail on Shiny modules check out this [write-up](http://shiny.rstudio.com/articles/modules.html) by Joe Cheng.

To use a module, in addition to creating the UI and server as we've done above, you also create a module UI and module server. Here are the four pieces you need for an application that uses one module.