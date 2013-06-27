shinyServer(function(input, output, session) {

  # The current low and high slider values, with initial values provided
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

  # Create the sliders. Use isolate() around the value so that the slider isn't
  # re-sent when it's changed (it should only be re-sent when the other slider
  # changes).
  output$loSlider <- renderUI({
    sliderInput("loSliderValue", "Low Slider Value:", min = 1, max = hiValue(),
      value = isolate(loValue()))
  })

  output$hiSlider <- renderUI({
    sliderInput("hiSliderValue", "High Slider Value:", min = loValue(), max = 10,
      value = isolate(hiValue()))
  })

  # Text output for the slider values
  output$loValueText <- renderText({ loValue() })
  output$hiValueText <- renderText({ hiValue() })
})
