shinyUI(bootstrapPage(
  numericInput('n', 'Number of obs', 100),
  plotOutput('plot'),

  tags$script(type = "text/javascript", "
    $(function() { // Run when DOM ready
      $(window).bind('beforeunload', function(e) {
        Shiny.onInputChange('quit', true); // sets input$quit to true
      });
    });
  ")
)
