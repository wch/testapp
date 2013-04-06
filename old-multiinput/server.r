shinyServer(function(input, output, clientData, session) {
  output$out_checkbox <- renderText({
    input$in_checkbox
  })
  output$out_checkboxgroup <- renderText({
    paste(input$in_checkboxgroup, collapse = ", ")
  })
  output$out_radio <- renderText({
    input$in_radio
  })
})
