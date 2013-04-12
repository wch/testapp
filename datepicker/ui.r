shinyUI(pageWithSidebar(
  headerPanel("Date Picker"),
  sidebarPanel(
    dateInput('date', label = 'Date input'),
    dateInput('date2', label = 'Date input 2'),
    dateRangeInput('daterange', label = 'Date range input'),

    dateRangeInput('daterange2', label = 'Date range input 2',
      sep = " to ",
      start = "2012-02-29", end = "2012-06-13",
      min   = "2000-01-01", max = "2016-12-31")
  ),
  mainPanel(
    verbatimTextOutput("date"),
    verbatimTextOutput("date2"),
    verbatimTextOutput("daterange"),
    verbatimTextOutput("daterange2")
  )
))
