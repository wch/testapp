shinyUI(pageWithSidebar(
  headerPanel("Date Picker"),
  sidebarPanel(
    dateInput('date',
      label = 'Date input: yyyy-mm-dd. Controls value of date input in main panel.',
      value = Sys.Date()),

    dateRangeInput('daterange',
      label = 'Date range input: yyyy-mm-dd. Controls min and max of date input and date range input in main panel.',
      start = Sys.Date()-1, end = Sys.Date()+1),

    dateRangeInput('daterange2',
      label = 'Date range input 2: mm/dd/yy, fr, range limit, weekstart=1. Controls start and end of date range input in main panel.',
      start = Sys.Date()-1, end = Sys.Date()+1,
      min = Sys.Date()-10, max = Sys.Date()+10,
      separator = " - ",
      format = "mm/dd/yy", startview = 'year', language = 'fr', weekstart = 1),


    tags$hr(),
    h4("Tests for default values"),

    dateInput('date2',
      label = 'Date input 2: string for starting value, mm/dd/yy, zh-TW, range limit, weekstart=1',
      value = as.character(Sys.Date()),
      min = Sys.Date()-365, max = Sys.Date()+365, format = "mm/dd/yy",
      startview = 'year', language = 'zh-TW', weekstart = 1),


    dateInput('date3',
      label = 'Date input 3. Default value is current date in client\'s time zone.'),

    dateRangeInput('daterange 3',
      label = 'Date range input 3. Default start and end is current date in client\'s time zone)')

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
