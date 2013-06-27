shinyUI(basicPage(
  plotOutput("myplot", clickId = "myplot_click", hoverId = "myplot_hover",
    hoverDelay = 150, width = 400, height = 400),
  tableOutput("mytable")
))
