shinyServer(function(input, output, session) {

  # input$date and others are Date objects; need to convert to character,
  # otherwise it will print an integer rather than a date.
  output$date  <- renderText({ as.character(input$date)  })
  output$date2 <- renderText({ as.character(input$date2) })

  output$daterange  <- renderText({ as.character(input$daterange) })
  output$daterange2 <- renderText({ as.character(input$daterange2) })

  observe({
    updateDateInput(session, 'date_controlled',
      value = as.character(input$date),
      min   = as.character(input$daterange[1]),
      max   = as.character(input$daterange[2])
    )

    updateDateRangeInput(session, 'daterange_controlled',
      min   = as.character(input$daterange[1]),
      max   = as.character(input$daterange[2]),
      start = as.character(input$daterange2[1]),
      end   = as.character(input$daterange2[2])
    )

  })

})
