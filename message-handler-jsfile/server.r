shinyServer(function(input, output, session) {
  observe({
    x <- input$controller

    session$sendMessage(type='testmessage', list(a=1, b='text', x=x))
  })
})
