shinyUI(pageWithSidebar(
  headerPanel("Date Picker"),
  sidebarPanel(
    dateInput('date', label = 'Date input: yyyy-mm-dd'),

    dateInput('date2',
      label = 'Date input 2: mm/dd/yy, zh-TW, range limit, weekstart=3',
      value = "2012-02-29",
      min = "2012-02-28", max = "2013-03-02", format = "%m/%d/%y",
      startview = 'year', language = 'zh-TW', weekstart = 3),

    dateRangeInput('daterange', label = 'Date range input: yyyy-mm-dd',
      start = "2012-02-29", end ="2012-03-12"),

    dateRangeInput('daterange2',
      label = 'Date range input 2: mm/dd/yy, fr, range limit, weekstart=3',
      start = as.Date('2012-02-29'), end = as.Date('2012-03-12'),
      min = "2012-02-28", max = "2013-03-02",
      separator = " - ",
      format = "%m/%d/%y", startview = 'year', language = 'fr', weekstart = 3)
  ),

  mainPanel(
    verbatimTextOutput("date"),
    verbatimTextOutput("date2"),
    verbatimTextOutput("daterange"),
    verbatimTextOutput("daterange2")
  )
))
