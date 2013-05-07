shinyServer(function(input, output, session) {

  output$textout <- renderText({
    paste("Controller value is", input$controller)
  })
  output$plotout <- renderPlot({
    x <- input$controller
    hist(rnorm(x), main = paste(x, "samples"))
  })

})
