# Including custom JavaScript in your app

Occasionally you may want to include some JavaScript that you’ve written in your Shiny app. Similar to the discussion of CSS above you can include the JS by referencing an external file or you can include JS inline in the header.

1. tags$head(includeScript("google-analytics.js"))
2. tags$head(HTML("<script type='text/javascript'></script>"))

### Example app: inline JavaScript code

Here we add inline JavaScript (jQuery) to fade out, then in the title and finally make it green.

```r
server <- function(input, output, session) {
  
}

ui <- basicPage(
  
    h1(id = "thetitle", "Inline JavaScript to change the title style"),
    actionButton("thebutton", "Click to change title color and transparency"),
    
    # here we're including inline JavaScript code (jQuery)
    tags$footer(HTML("<script type='text/javascript'>
                      $( document ).ready(function() {
                        var $thetitle = $('#thetitle');
                        var $thebutton  = $('#thebutton');
                        $thebutton.click(function(){
                          $thetitle.fadeOut(2000);
                          $thetitle.fadeIn(2000);
                          $thetitle.css('color', 'green');
                        })
                      });
                      </script>"))
)

shinyApp(ui = ui, server = server)
```

<iframe style="width:100%; height:200px;" src='http://shiny.nextlevelanalytics.com/apps/shinyapps/app39'></iframe>