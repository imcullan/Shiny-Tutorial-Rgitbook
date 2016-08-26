# You need an HTML page with references to Shiny components

In addition to your ui.R and server.R (or app.R), you need to create an HTML page with the structure you want. Shiny-related components are then included in curly braces. A few key points to keep in mind:

1. You must include Shiny-related references in the header: Shiny apps reference Shiny-related JavaScript libraries and include other required information in the head of a Shiny app's HTML page. You need to include these references in your template. You can manually copy and paste them from another Shiny app, but it's much easier to use the `headContent()` function within curly braces.

2. You can also reference bootstrap in the header with a Shiny function: Including Bootstrap for styling is so common that Shiny includes a function to do it for you called `bootstrapLib`. Again, you use this in curly braces in your header.

3. Other shiny components can be included either directly in the HTML template or via references to the Shiny UI.

Here is what our sample app HTML file looks like:

```html
<!DOCTYPE html>
<html>
<!-- this file is called template.html -->
<head>
    <!--This code is necessary to include important shiny-related references -->
    {{headContent()}}
    <!--To use bootstrap for styling this will add the references -->
    {{bootstrapLib()}}
</head>

<body>
    <div class="container">
        <!-- I'm using HTML directly -->
        <div class="jumbotron" style="text-align: center;">
            <h2 class="display-3">HTML templates with Shiny</h2>
            <p class="lead">Details on creating Shiny apps with HTML templates. And a random photo</p>
            <img src="http://lorempixel.com/200/100" />
        </div>

        <h2>Block of controls from the Shiny UI</h2> 
        <!-- shinycontrols is an object from the ui -->
        {{shinycontrols}}

        <h2>Slider and radio buttons</h2>
        <!-- justslider is an object from the ui -->
        {{justslider}}
        {{radioButtons("my_radio", "Radio buttons from the HTML template", c("A", "B", "C"), "C")}}


        <h2>You can do calculations with R directly</h2>
        
        The average of a sequence of numbers from 1 to 10 is {{mean(1:10)}}!
    </div>
</body>
</html>
```