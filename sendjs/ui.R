shinyUI(pageWithSidebar(
  headerPanel("Send Javascript test"),
  sidebarPanel(
    sliderInput("controller", "Controller:", min = 1, max = 20, value = 15),
    br(),
    a(href = "https://github.com/wch/testapp/tree/master/sendjs",
      "Source code")
  ),
  mainPanel(
    h2("Filler text"),

    # Add a message handler that simply evaluates the message as Javascript
    tags$head(tags$script(HTML('
      Shiny.addCustomMessageHandler("jsCode",
        function(message) {
          eval(message.value);
        }
      );
    ')))
  )
))
