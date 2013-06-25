shinyUI(pageWithSidebar(

  headerPanel("Bidirectional sliders"),

  sidebarPanel(
    p("Low and high sliders set the limits for each other."),
    uiOutput("loSlider"),
    uiOutput("hiSlider"),
    br(),
    a(href = "https://github.com/wch/testapp/tree/master/bidir-slider",
      "Source code")
  ),
  mainPanel(
    p("Low value:"),
    verbatimTextOutput("loValueText"),
    p("High value:"),
    verbatimTextOutput("hiValueText")
  )
))
