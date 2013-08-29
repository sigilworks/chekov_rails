
var startUrl,
    pollUrl,
    allow = true;

function Poll() {

  this.start = function start(start, poll) {

    startUrl = start;
    pollUrl = poll;

    // abort any pending request
    request && request.abort();

    // fire off the request to MatchUpdateController
    var request = $.ajax({
      url : startUrl,
      type : "get" })
    .done(function(reply) {
      console.log("Game on..." + reply);
      setInterval(function() {
        if (allow === true) {
          allow = false;
          getUpdate();
        }
      }, 500);
    })
    // callback handler that will be called on failure
    .fail(function(jqXHR, textStatus, errorThrown) {
      // log the error to the console
      console.log("Start - the following error occured: " + textStatus, errorThrown);
    });

  };

  function getUpdate() {
    console.log("Okay let's go...");

    // abort any pending request
    request && request.abort();

    // fire off the request to MatchUpdateController
    var request = $.ajax({
      url : pollUrl,
      type : "get" })
    .done(function(message) {
      console.log("Received a message");
      var update = createResponse(message);
      $(update).insertAfter('#first_row'); })
    // callback handler that will be called on failure
    .fail(function(jqXHR, textStatus, errorThrown) {
      // log the error to the console
      console.log("Polling - the following error occured: " + textStatus, errorThrown); })
    // callback handler that will be called regardless if the request failed or succeeded
    .always(function() { allow = true; });

    function createResponse(message) {
      var resp = "<div>"
            + "<p class='update'>Time:</p>"
            + "</div>"
            + "<div>"
            + "<p id='time' class='update'>"
            + message.matchTime
            + "</p>"
            + "</div>"
            + "<div id='update-div'>"
            + "<p id='message' class='update'>"
            + message.messageText
            + "</p>"
            + "</div>";
      return resp;
    };

};

$(document).ready(function() {

  var startUrl = "matchupdate/subscribe",
      pollUrl = "matchupdate/simple",
      poll = new Poll();

  poll.start(startUrl, pollUrl);

});