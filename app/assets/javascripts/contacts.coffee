# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
javascript:
  user_name = "#{@teste}";
coffee:
  $(document).ready ->
    name = user_name
    alert name

jQuery ->
    alert gon.teste


console.log("#{gon.teste}");