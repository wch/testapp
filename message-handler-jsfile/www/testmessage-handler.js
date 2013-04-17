Shiny.registerMessageHandler("testmessage",
  function(message) {
    alert(JSON.stringify(message));
  }
);
