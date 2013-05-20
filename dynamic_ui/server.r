shinyServer(function(input, output) {

  output$ui <- renderUI({
    if (is.null(input$input_type))
      return()

    if (input$input_type == "slider") {
      sliderInput("dynamic", "Dynamic", min=1, max=20, value=10)
    } else if (input$input_type == "text") {
      textInput("dynamic",  "Dynamic", value="starting value")
    } else if (input$input_type == "numeric") {
      numericInput("dynamic",  "Dynamic", value=12)
    } else if (input$input_type == "checkbox") {
      checkboxInput("dynamic",  "Dynamic", value=TRUE)
    } else if (input$input_type == "checkboxGroup") {
      checkboxGroupInput("dynamic",  "Dynamic",
        choices = c("Option 1"="option1", "Option 2"="option2"),
        selected = "Option 2"
      )
    } else if (input$input_type == "radioButtons") {
      radioButtons("dynamic",  "Dynamic",
        choices = c("Option 1"="option1", "Option 2"="option2"),
        selected = "Option 2"
      )
    } else if (input$input_type == "selectInput") {
      selectInput("dynamic",  "Dynamic",
        choices = c("Option 1"="option1", "Option 2"="option2"),
        selected = "Option 2"
      )
    } else if (input$input_type == "selectInput (multi)") {
      selectInput("dynamic",  "Dynamic",
        choices = c("Option 1"="option1", "Option 2"="option2"),
        selected = c("Option 1", "Option 2"),
        multiple = TRUE
      )
    } else if (input$input_type == "date") {
      dateInput("dynamic", "Dynamic")
    } else if (input$input_type == "daterange") {
      dateRangeInput("dynamic", "Dynamic")
    }


  })

  output$input_type_text <- renderText({
    input$input_type
  })

  output$dynamic_value <- renderPrint({
    str(input$dynamic)
  })

})
