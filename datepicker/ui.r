shinyUI(pageWithSidebar(
  headerPanel("Date Picker"),
  sidebarPanel(
    dateInput('date',
      label = 'Date input: yyyy-mm-dd.  Controls value of date input in main panel.'),

    dateInput('date2',
      label = 'Date input 2: mm/dd/yy, zh-TW, range limit, weekstart=1',
      value = as.character(Sys.Date()),
      min = Sys.Date()-365, max = Sys.Date()+365, format = "%m/%d/%y",
      startview = 'year', language = 'zh-TW', weekstart = 1),

    dateRangeInput('daterange',
      label = 'Date range input: yyyy-mm-dd. Controls start and end of date range input in main panel.',
      start = Sys.Date()-1, end = Sys.Date()+1),

    dateRangeInput('daterange2',
      label = 'Date range input 2: mm/dd/yy, fr, range limit, weekstart=1. Controls min and max of date input and date range input in main panel',
      start = Sys.Date()-1, end = Sys.Date()+1,
      min = Sys.Date()-10, max = Sys.Date()+10,
      separator = " - ",
      format = "%m/%d/%y", startview = 'year', language = 'fr', weekstart = 1)
  ),

  mainPanel(
    verbatimTextOutput("date"),
    verbatimTextOutput("date2"),
    verbatimTextOutput("daterange"),
    verbatimTextOutput("daterange2"),
    dateInput("date_controlled",
              "Date input controlled from sidebar"),
    dateRangeInput("daterange_controlled",
                   "Date range input controlled from sidebar")
  )
))
