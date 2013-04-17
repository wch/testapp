shinyServer(function(input, output, session) {

  observe({
    # We'll use the input$controller variable multiple times, so save it as x
    # for convenience.
    x <- input$controller

    session$sendMessage(type='testmessage', list(a=1, b='134', xvalue=x))

  })
})
