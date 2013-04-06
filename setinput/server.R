shinyServer(function(input, output, clientData, session) {
  output$out_text <- renderText({
    input$in_text
  })
  output$out_numeric <- renderText({
    input$in_numeric
  })
  output$out_checkbox <- renderText({
    input$in_checkbox
  })
  output$out_checkboxgroup <- renderText({
    paste(input$in_checkboxgroup, collapse = ", ")
  })
  output$out_radio <- renderText({
    input$in_radio
  })
  output$out_select <- renderText({
    input$in_select
  })
  output$out_slider <- renderText({
    input$in_slider
  })
  output$out_slider2 <- renderText({
    input$in_slider2
  })



  # Send message to the in_numeric objet
  observe({
    # session$send(
    #   type = "inputMessage",
    #   data = list(
    #     id = 'in_numeric', 
    #     message = list(value = input$in_slider, min = -40, max = 1000, step = 10)
    #   )
    # )

    x <- input$in_controlslider
    x_even <- x %% 2 == 0

    # Convenience version of above:
    updateNumberInput(session, 'in_numeric', 
      value = x, min = -40, max = 1000, step = 10)

    updateTextInput(session, 'in_text', value = paste("text", x))

    updateSliderInput(session, 'in_text', value = paste("text", x))

    updateCheckboxInput(session, 'in_checkbox', value = x_even)

    updateCheckboxGroupInput(session, 'in_checkboxgroup', 
      options = list(
        list(value = paste0('option', x, '-1'),
             label = paste0('option', x, '-1 label'),
             checked = x_even),
        list(value = paste0('option', x, '-2'),
             label = paste0('option', x, '-2 label'),
             checked = !x_even)
      )
    )
    # If x > 10, set the checkbox group values by using 'value' (not 'checked')
    if (x > 10) {
      if (x_even) {
        checkboxgroup_value <-  c(paste0('option', x, '-1'),
                                  paste0('option', x, '-2'))
      } else {
        checkboxgroup_value <-  list()
      }
      updateCheckboxGroupInput(session, 'in_checkboxgroup', value = checkboxgroup_value)
    }

    updateRadioInput(session, 'in_radio', 
      options = list(
        list(value = paste0('option', x, '-1'),
             label = paste0('option', x, '-1 label'),
             checked = x_even),
        list(value = paste0('option', x, '-2'),
             label = paste0('option', x, '-2 label'),
             checked = !x_even)
      )
    )

    updateSelectInput(session, 'in_select', 
      options = list(
        list(value = paste0('option', x, '-1'),
             label = paste0('option', x, '-1 label'),
             selected = x_even),
        list(value = paste0('option', x, '-2'),
             label = paste0('option', x, '-2 label'),
             selected = !x_even)
      )
    )

    # Multi-select input
    updateSelectInput(session, 'in_select2', 
      options = list(
        list(value = paste0('option', x, '-1'),
             label = paste0('option', x, '-1 label'),
             selected = x_even),
        list(value = paste0('option', x, '-2'),
             label = paste0('option', x, '-2 label'),
             selected = !x_even)
      )
    )
    # If x > 10, set the multi-select values by using 'value' (not 'selected')
    if (x > 10) {
      if (x_even) {
        select2_value <-  c(paste0('option', x, '-1'),
                            paste0('option', x, '-2'))
      } else {
        select2_value <-  list()
      }
      updateSelectInput(session, 'in_select2', value = select2_value)
    }


    updateSliderInput(session, 'in_slider', value = x)


    # For slider2 value, set both, just upper, or just lower, depending on x
    if (x > 10)      slider2_value <- c(x, x+20)
    else if (x < 6)  slider2_value <- c(x, NA)
    else             slider2_value <- c(NA, x+20)
    updateSliderInput(session, 'in_slider2', value = slider2_value)


    if (x == 20) updateTabsetInput(session, 'in_tabset', value = 'panel2')
    else         updateTabsetInput(session, 'in_tabset', value = 'panel1')

  })
})
