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