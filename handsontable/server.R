library(shinyHandsontable)
library(ggplot2) # For diamonds data

shinyServer(function(input, output, session) {

  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "mtcars" = mtcars,
           "diamonds" = diamonds)
  })

  output$view <- renderHandsontable({
    datasetInput()
  })
})
