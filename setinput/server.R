shinyServer(function(input, output, clientData, session) {
  output$out_text <- renderText({
    input$in_text
  })
  output$out_number <- renderText({
    input$in_number
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



  # Send message to the in_number objet
  observe({
    # session$send(
    #   type = "inputMessage",
    #   data = list(
    #     id = in_number, 
    #     message = list(value = input$in_slider, min = -40, max = 1000, step = 10)
    #   )
    # )

    x <- input$in_controller
    if (is.null(x)) 
      x <- 10
    x_even <- x %% 2 == 0

    # Convenience version of above:
    updateNumberInput(session, 'in_number',
      label = paste('number label ', x),
      value = x, min = -40, max = 1000, step = 10)

    updateTextInput(session, 'in_text',
      label = paste('text label ', x),
      value = paste('text', x))

    updateCheckboxInput(session, 'in_checkbox',
      label = paste('checkbox label ', x),
      value = x_even)


    # Checkbox group ========================================================
    checkboxgroup_options <- c(paste0('option', x, '-1'),
                               paste0('option', x, '-2'))
    names(checkboxgroup_options) <- c(paste0('option', x, '-1 label'),
                                      paste0('option', x, '-2 label'))
    if (x_even) {
      checkboxgroup_selected <- names(checkboxgroup_options)[1]
    } else {
      checkboxgroup_selected <- names(checkboxgroup_options)[2]
    }

    updateCheckboxGroupInput(session, 'in_checkboxgroup', 
      label = paste('checkboxgroup label', x),
      choices = checkboxgroup_options,
      selected = checkboxgroup_selected
    )

    # Radio group ===========================================================
    radiogroup_options <- c(paste0('option', x, '-1'),
                            paste0('option', x, '-2'))
    names(radiogroup_options) <- c(paste0('option', x, '-1 label'),
                                   paste0('option', x, '-2 label'))
    if (x_even) {
      radiogroup_selected <- names(radiogroup_options)[1]
    } else {
      radiogroup_selected <- names(radiogroup_options)[2]
    }

    updateRadioInput(session, 'in_radio',
      label = paste('radio label', x),
      choices = radiogroup_options,
      selected = radiogroup_selected
    )


    # Select input ==========================================================
    select_options <- c(paste0('option', x, '-1'),
                        paste0('option', x, '-2'))
    names(select_options) <- c(paste0('option', x, '-1 label'),
                               paste0('option', x, '-2 label'))
    if (x_even) {
      select_selected <- names(select_options)[1]
    } else {
      select_selected <- names(select_options)[2]
    }

    updateSelectInput(session, 'in_select',
      label = paste('select label', x),
      choices = select_options,
      selected = select_selected
    )


    # Multi-select input ====================================================
    select2_options <- c(paste0('option', x, '-1'),
                         paste0('option', x, '-2'))
    names(select2_options) <- c(paste0('option', x, '-1 label'),
                                paste0('option', x, '-2 label'))
    if (x > 10) {
      if (x_even) {
        select2_selected <- names(select2_options)
      } else {
        select2_selected <- c()
      }
    } else {
      if (x_even) {
        select2_selected <- names(select2_options)[1]
      } else {
        select2_selected <- names(select2_options)[2]
      }
    }

    updateSelectInput(session, 'in_select2',
      label = paste('select label', x),
      choices = select2_options,
      selected = select2_selected
    )


    # Slider input ==========================================================
    updateSliderInput(session, 'in_slider',
      label = paste('slider label', x),
      value = x)


    # Slider range input ====================================================
    # For slider2 value, set both, just upper, or just lower, depending on x
    if (x > 10)      slider2_value <- c(x, x+20)
    else if (x > 5)  slider2_value <- c(NA, x+20)
    else             slider2_value <- c(x, NA)
    updateSliderInput(session, 'in_slider2', value = slider2_value)


    # Tabset input ==========================================================
    if (x == 20) updateTabsetInput(session, 'in_tabset', value = 'panel2')
    else         updateTabsetInput(session, 'in_tabset', value = 'panel1')

  })
})
