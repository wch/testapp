shinyUI(pageWithSidebar(
  headerPanel("Shiny Widgets"),
  sidebarPanel(
    datePickerInput('date', label = 'Date input')
  ),
  mainPanel(
    verbatimTextOutput("date")
  )
))
