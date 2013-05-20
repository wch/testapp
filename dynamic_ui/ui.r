shinyUI(pageWithSidebar(

  headerPanel(""),

  sidebarPanel(
    selectInput("input_type", "Input type", c("slider", "date", "daterange")),
    uiOutput("ui"),
    br(),
    tags$a(href = "https://github.com/wch/testapp/tree/master/dynamic_ui",
           "Source code")
  ),


  mainPanel(
    tags$p("Input type:"),
    verbatimTextOutput("input_type_text"),
    tags$p("Dynamic input value:"),
    verbatimTextOutput("dynamic_value")
  )
))
