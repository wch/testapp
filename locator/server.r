shinyServer(function(input, output, session) {
  # Starting data
  hover_points_data <- data.frame(x = 5, y = 5)
  click_points_data <- data.frame(x = numeric(), y = numeric())

  # Collect the clicked points
  click_points <- reactive({
    newpoint <- input$myplot_click
    if (!is.null(newpoint))
      click_points_data <<- data.frame(
        x = c(click_points_data$x, newpoint$x),
        y = c(click_points_data$y, newpoint$y))
    click_points_data
  })

  # Collect the hovered points
  hover_points <- reactive({
    newpoint <- input$myplot_hover
    if (!is.null(newpoint))
      hover_points_data <<- data.frame(
        x = c(hover_points_data$x, newpoint$x),
        y = c(hover_points_data$y, newpoint$y))
    hover_points_data
  })

  # Generate the plot
  output$myplot <- renderPlot({
    # Clicked points are red circles
    plot(hover_points()$x, hover_points()$y,
      xlim = c(0, 10), ylim = c(0, 10),
      xlab = NA, ylab = NA,
      pch = 3)

    # Hovered points are black crosses
    points(click_points()$x, click_points()$y, col = "red")
  })

  # Table of all clicked and hovered points
  output$mytable <- renderTable({
    rbind(
      # A workaround to deal with case where click_points() has zero rows
      data.frame(type = rep("click", nrow(click_points())), click_points()),
      data.frame(type = "hover", hover_points())
    )
  })
})
