shinyUI(pageWithSidebar(

  headerPanel("Dynamic number of inputs and outputs"),

  sidebarPanel(
    sliderInput("n", "Number of inputs/outputs", value=1, min=1, max=5),
    uiOutput("dyn_input"),
    br(),
    tags$a(href = "https://github.com/wch/testapp/tree/master/dynamic_in_out",
           "Source code")
  ),

  mainPanel(
    # This is the dynamic UI for the text
    uiOutput("dyn_output")
  )
))
