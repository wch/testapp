shinyUI(pageWithSidebar(
  headerPanel("Shiny Widgets"),
  sidebarPanel(
    sliderInput("in_controlslider", "This slider controls other inputs:", min = 1, max = 20, value = 15,
                ticks = TRUE),

    textInput("in_text", "Text input:", value="starting value"),
    numericInput("in_numeric", "Numeric input:", min = 4, max = 10, value = 8, step = 0.5),
    checkboxInput("in_checkbox", "Checkbox input:", value = FALSE),
    checkboxGroupInput("in_checkboxgroup", "Checkbox group input:",
                       c("label 1" = "option1",
                         "label 2" = "option2"),
                       selected = NULL),
    radioButtons("in_radio", "Radio buttons:",
                 c("label 1" = "option1",
                   "label 2" = "option2")
                ),
    selectInput("in_select", "Select input",
                c("label 1" = "option1",
                  "label 2" = "option2")
               ),
    selectInput("in_select2", "Select 2 input", multiple = TRUE,
                c("label 1" = "option1",
                  "label 2" = "option2")
               ),
    sliderInput("in_slider", "Slider input:", min = 1, max = 20, value = 15,
                ticks = TRUE),
    sliderInput("in_slider2", "Slider 2 input:", min = 1, max = 40, value = c(10, 30),
                step = NULL)
  ),
  mainPanel(
    tabsetPanel(id = "in_tabset",
      tabPanel("panel1",
        p("Text output:"),
        verbatimTextOutput("out_text"),
        p("Numeric output:"),
        verbatimTextOutput("out_numeric"),
        p("Checkbox output:"),
        verbatimTextOutput("out_checkbox"),
        p("Checkbox group output:"),
        verbatimTextOutput("out_checkboxgroup"),
        p("Radio output:"),
        verbatimTextOutput("out_radio"),
        p("Select output:"),
        verbatimTextOutput("out_select"),
        p("Slider output:"),
        verbatimTextOutput("out_slider"),
        p("Slider 2 output:"),
        verbatimTextOutput("out_slider2")
      ),
      tabPanel("panel2", h2("This is the second panel."))
    )
  )
))
