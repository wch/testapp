shinyServer(function(input, output, session) {

  output$image <- renderImage({
    width  <- session$clientData$output_plot_width
    height <- session$clientData$output_plot_height

    # A temp file to save the output. This file will be removed later by renderImage
    outfile <- tempfile(fileext='.png')

    png(outfile, width=width, height=height)
    hist(rnorm(input$obs), main="Generated in renderImage()")
    dev.off()

    # Return a list containing the filename
    list(src = outfile,
         contentType = 'image/png',
         width = width,
         height = height,
         alt = "This is alternate text")

  }, deleteFile = TRUE)
  
  output$plot <- renderPlot({
    hist(rnorm(input$obs), main="Generated in renderPlot()")
  })

  # Print out clientData
  output$summary <- renderText({
    cnames <- names(session$clientData)

    allvalues <- lapply(cnames, function(name) {
      item <- session$clientData[[name]]
      if (is.list(item)) {
        list_to_string(item, name)
      } else {
        paste(name, item, sep=" = ")
      }
    })
    paste(allvalues, collapse = "\n")
  })

  # Parse the GET query
  output$queryText <- renderText({
    query <- parseQueryString(session$clientData$url_search)

    # Return a string with key-value pairs
    paste(names(query), query, sep = "=", collapse=", ")
  })

})



list_to_string <- function(obj, listname) {
  if (is.null(names(obj))) {
    paste(listname, "[[", seq_along(obj), "]] = ", obj, sep = "", collapse = "\n")
  } else {
    paste(listname, "$", names(obj), " = ", obj, sep = "", collapse = "\n")
  }
}
