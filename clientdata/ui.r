shinyUI(pageWithSidebar(
  headerPanel("Shiny Client Data"),
  sidebarPanel(
    sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500)
  ),
  mainPanel(
    p("Shiny version: ", as.character(packageVersion('shiny'))),
    h3("clientData values"),
    verbatimTextOutput("summary"),   # clientData values
    h3("Parsed URL query"),
    verbatimTextOutput("queryText"),   # clientData values
    imageOutput("image", height=300),
    plotOutput("plot", height=300)
  )
))
