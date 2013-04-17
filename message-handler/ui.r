shinyUI(pageWithSidebar(
  headerPanel("Setting inputs"),
  sidebarPanel(
    sliderInput("controller", "This slider controls other inputs:",
                min = 1, max = 20, value = 15)
  ),
  mainPanel(
    tags$script('
      Shiny.registerMessageHandler("testmessage",
        function(message) {
          alert(JSON.stringify(message));
        }
      );'
    )
  )
))
