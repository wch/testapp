shinyUI(pageWithSidebar(

  headerPanel("Bidirectional sliders"),

  sidebarPanel(
    p("Low and high sliders set the limits for each other."),
    uiOutput("loSlider"),
    uiOutput("hiSlider")
  ),
  mainPanel(
    p("Low value:"),
    verbatimTextOutput("loValueText"),
    p("High value:"),
    verbatimTextOutput("hiValueText")
  )
))
