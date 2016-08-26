# Deploy your app

Although Shiny apps end up as HTML files you can't simply copy them to your server. They require a Shiny server, a server that can run your R commands.

### Running locally

* If you're developing in RStudio and have a multi-page app, you can open either ui.R or server.R and click on **Run App** in the top right.

* For a single or multi-page app, you can use the function runApp where you specify the directory where the app.R or ui.R/server.R files are housed.

* For a single page app, you can use the function `shinyApp` where you specify the ui and the server as we've done in the examples above.

### Running on shinyapps.io

This site is managed by RStudio and is free for small apps with limited visits and scales up in paid versions.

### Running your own Shiny server

There is a free, open source version of the Shiny server that you can run on, for example, Amazon Web Services or your own server. This is designed for apps with a relatively low number of visitors.