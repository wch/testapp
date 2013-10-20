max_inputs <- 5

shinyServer(function(input, output) {

  # Insert the right number of numeric input objects into the web page
  output$dyn_input <- renderUI({
    inputs <- lapply(1:input$n, function(i) {
      input_name  <- paste("numeric_", i, sep="")

      # If there's an existing value for this input object, use it as the
      # initial value for the new input which replaces it. Otherwise just use i
      # as the initial value. Isolate so we don't take a dependency on it.
      start_val <- isolate(input[[input_name]])
      if (is.null(start_val)) {
        start_val <- i
      }

      numericInput(input_name, label = input_name, value = start_val)
    })

    # Put the inputs into a taglist
    do.call(tagList, inputs)
  })



  # Insert the right number of text output objects into the web page
  output$dyn_output <- renderUI({
    output <- lapply(1:input$n, function(i) {
      output_name <- paste("text_", i, sep="")
      verbatimTextOutput(output_name)
    })

    # Convert the list to a tagList - necessary for it to show
    do.call(tagList, output)
  })

  # Call renderText for each output. Note that the outputs are created
  # staticially, at the start of the app. They could be created dynamically
  # (in response to changes in input$n), but doing so efficiently, so that
  # outputs aren't constantly being overwritten and executed unnecessarily,
  # would require some extra bookkeeping.
  for (i in 1:max_inputs) {
    # Need local() so that each item gets its own number. Without it, the value
    # of i in the renderPlot() will be the same across all instances, because
    # of when the expression is evaluated.
    local({
      my_i <- i
      input_name  <- paste("numeric_", my_i, sep="")
      output_name <- paste("text_", my_i, sep="")

      output[[output_name]] <- renderText({
        paste0(input_name, ": ", input[[input_name]])
      })
    })
  }
})
