shinyServer(function(input, output, clientData, session) {
  # Send message to the in_number objet
  observe({
    js_string <- sprintf('alert("slider is %d");', input$controller)
    session$sendJavascript(js_string)
  })
})
