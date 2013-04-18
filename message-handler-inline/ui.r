shinyUI(pageWithSidebar(
  headerPanel("Message sending, with message hander in inline Javascript"),

  sidebarPanel(
    sliderInput("controller", "Controller:",
                min = 1, max = 20, value = 15)
  ),

  mainPanel(
    tags$head(tags$script('
      Shiny.addCustomMessageHandler("testmessage",
        function(message) {
          alert(JSON.stringify(message));
        }
      );
    '))
  )
))
