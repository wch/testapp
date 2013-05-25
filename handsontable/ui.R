library(shinyHandsontable)
shinyUI(pageWithSidebar(

  headerPanel("handsontable"),

  sidebarPanel(
    selectInput("dataset", "Choose a dataset:",
                choices = c("rock", "pressure", "mtcars", "diamonds"))
  ),
  mainPanel(
    handsontableOutput("view")
  )
))
