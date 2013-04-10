shinyServer(function(input, output, clientData, session) {

  output$date <- renderText({
    input$date
  })
})
