shinyUI(pageWithSidebar(
  headerPanel("Date Picker"),
  sidebarPanel(
    datePickerInput('date', label = 'Date input'),
    datePickerInput('date2', label = 'Date input 2'),
    dateRangePickerInput('daterange', label = 'Date range input'),

    dateRangePickerInput('daterange2', label = 'Date range input 2',
      start = "2012-02-29", end = "2012-06-13", sep = " to ")
  ),
  mainPanel(
    verbatimTextOutput("date"),
    verbatimTextOutput("date2"),
    verbatimTextOutput("daterange"),
    verbatimTextOutput("daterange2")
  )
))
