// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "jquery_ujs"
import "./jquery_ui"
import "popper"
import "bootstrap"

$(document).ready(function(){
	$("#hide").click(function(){
	  $("#signup_form").toggleClass("d-none");
	});
	new SlimSelect({
	  select: '#post_tags'
	});
});
