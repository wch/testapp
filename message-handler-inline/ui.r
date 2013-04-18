shinyUI(pageWithSidebar(
  headerPanel("Message sending, with message hander in inline Javascript"),

  sidebarPanel(
    sliderInput("controller", "Controller:",
                min = 1, max = 20, value = 15)
  ),

  mainPanel(
    # Put this script in the header, and use the HTML() function to make
    # sure that characters like '<' don't get escaped.
    tags$head(tags$script(HTML('
      Shiny.addCustomMessageHandler("testmessage",
        function(message) {
          alert(JSON.stringify(message));
        }
      );
    ')))
  )
))
