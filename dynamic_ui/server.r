shinyServer(function(input, output) {

  output$ui <- renderUI({
    if (is.null(input$input_type))
      return()

    if (input$input_type == "slider") {
      return(sliderInput("dynamic", "Dynamic", min=1, max=20, value=10))
    } else if (input$input_type == "date") {
      return(dateInput("dynamic", "Dynamic"))
    } else if (input$input_type == "daterange") {
      return(dateRangeInput("dynamic", "Dynamic"))
    }
  })

  output$input_type_text <- renderText({
    input$input_type
  })

  output$dynamic_value <- renderPrint({
    str(input$dynamic)
  })

})
