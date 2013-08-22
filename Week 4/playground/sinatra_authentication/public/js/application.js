$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  var searchTerm = "ruby";
  var baseUrl = "http://search.twitter.com/search.json?q=";
  $.getJSON(baseUrl+searchTerm+"&callback=?", function(data) {
      $.each(data.results, function() {
      $('<div></div>')
          .hide()
          .append('<img src="'+this.profile_image_url+'" />')
          .append('<span><a href="http://www.twitter.com/'+this.from_user+'">'+this.from_user+'</a>&nbsp; '+this.text+'</span>')
          .appendTo('#tweets')
          .fadeIn();
       });
  });

});
