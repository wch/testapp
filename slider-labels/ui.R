shinyUI(pageWithSidebar(
  headerPanel("Slider labels"),
  
  sidebarPanel(
    # Manual labels (to appear logarithmic)
    sliderInput("log", "Logarithmic (tick labels only):",
                min = 1, max = 4, value = 1, step = 1,
                ticks = c(.9, .99, .999, .9999)),

    br(),
    a(href = "https://github.com/wch/testapp/tree/master/slider-labels",
      "Source code")
  ),

  mainPanel(
    tableOutput("values")
  )
))
