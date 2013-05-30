library(shinySlickgrid)
shinyUI(pageWithSidebar(

  headerPanel("slickgrid"),

  sidebarPanel(
    selectInput("dataset", "Choose a dataset:",
                choices = c("rock", "pressure", "mtcars", "diamonds"))
  ),
  mainPanel(
    slickgridOutput("view", editable = TRUE)
  )
))
