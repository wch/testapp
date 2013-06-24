shinyUI(basicPage(
  plotOutput("myplot", clickId = "myplot_click", hoverId = "myplot_hover",
    width = 400, height = 400),
  tableOutput("mytable")
))
