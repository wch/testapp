shinyUI(pageWithSidebar(
  headerPanel("Shiny Widgets"),
  sidebarPanel(
    sliderInput("controller", "This slider controls other inputs:",
                min = 1, max = 20, value = 15)
  ),
  mainPanel(
    h2("Filler text")
  )
))
