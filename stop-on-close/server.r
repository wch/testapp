# App stops when window is closed (this only makes sense for running the app
# locally)

shinyServer(function(input, output) {
  output$plot <- renderPlot({ hist(runif(input$n)) })
  
  observe({
    # If input$quit is unset (NULL) do nothing; if it's anythign else, quit
    # and return input$n
    if (is.null(input$quit)) return()

    stopApp(input$n)
  })
})
