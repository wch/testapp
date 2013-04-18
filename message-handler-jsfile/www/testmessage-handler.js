Shiny.addCustomMessageHandler("testmessage",
  function(message) {
    alert(JSON.stringify(message));
  }
);
