shinyServer(function(input, output, clientData, session) {

  # input$date and others are Date objects; need to convert to character,
  # otherwise it will print an integer rather than a date.
  output$date  <- renderText({ as.character(input$date)  })
  output$date2 <- renderText({ as.character(input$date2) })

  output$daterange  <- renderText({ as.character(input$daterange) })
  output$daterange2 <- renderText({ as.character(input$daterange2) })
})
