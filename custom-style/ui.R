widget_style <-
  "display: inline-block;
  vertical-align: text-top;
  padding: 7px;
  border: solid;
  border-width: 1px;
  border-radius: 4px;
  border-color: #CCC;"

shinyUI(bootstrapPage(
  wellPanel(
    div(style = widget_style,
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp"))
    ),
    div(style = widget_style,
      sliderInput("n", 
                  "Number of observations:", 
                   value = 500,
                   min = 1, 
                   max = 1000)
    )
  ),
  
  tabsetPanel(
    tabPanel("Summary", verbatimTextOutput("summary")), 
    tabPanel("Plot", plotOutput("plot")), 
    tabPanel("Table", tableOutput("table"))
  )
))
