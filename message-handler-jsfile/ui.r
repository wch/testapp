shinyUI(pageWithSidebar(
  headerPanel("Message sending, with message hander in separate Javascript file"),

  sidebarPanel(
    sliderInput("controller", "Controller:", min = 1, max = 20, value = 15)
  ),

  mainPanel(
    tags$head(tags$script(src = 'testmessage-handler.js'))
  )
))
