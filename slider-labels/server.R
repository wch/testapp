shinyServer(function(input, output) {

  output$values <- renderTable({
    data.frame(
      Name = c("log"),
      Value = as.character(c(input$log)), 
      stringsAsFactors=FALSE
    )
  })
})
