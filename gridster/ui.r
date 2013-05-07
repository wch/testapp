library(shinyGridster)

shinyUI(bootstrapPage(
  tags$head(
    tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css')
  ),


  h1("shinyGridster test app"),

  gridster(width = 250,
    gridsterItem(col = 1, row = 1, sizex = 1, sizey = 1,
      h2("Input tile"),
      sliderInput("controller", "Controller:", min = 1, max = 20, value = 15)
    ),
    gridsterItem(col = 2, row = 1, sizex = 1, sizey = 2,
      h2("Output tile"),
      plotOutput("plotout", height=250)
    )
  )
))
