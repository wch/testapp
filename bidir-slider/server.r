shinyServer(function(input, output, session) {

  loValue <- reactive({
    if (is.null(input$loSliderValue))
      1
    else
      input$loSliderValue
  })

  hiValue <- reactive({
    if (is.null(input$hiSliderValue))
      10
    else
      input$hiSliderValue
  })

  output$loSlider <- renderUI({
    sliderInput("loSliderValue", "Low Slider Value:", min = 1, max = hiValue(),
      value = loValue())
  })

  output$hiSlider <- renderUI({
    sliderInput("hiSliderValue", "High Slider Value:", min = loValue(), max = 10,
      value = hiValue())
  })

  output$loValueText <- renderText({ loValue() })
  output$hiValueText <- renderText({ hiValue() })
})
