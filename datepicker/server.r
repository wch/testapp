shinyServer(function(input, output, clientData, session) {

  output$date  <- renderText({ input$date  })
  output$date2 <- renderText({ input$date2 })

  output$daterange  <- renderText({ input$daterange  })
  output$daterange2 <- renderText({ input$daterange2 })
})
