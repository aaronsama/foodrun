# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

format = (item) ->
  formattedRes = "<strong>#{item.text}</strong>"
  formattedRes += "<br><small>#{item.ingredients}</small>" if item.ingredients
  formattedRes

$(document).ready () ->
  if $('.item-autocomplete').length
    $('.item-autocomplete').select2
      data: []
      ajax:
        url: 'http://orostube-microservice.herokuapp.com/menu'
        type: 'GET'
        dataType: 'json'
        quietMillis: 250
        data: (term) ->
          q: term
        results: (data) ->
          formattedData = _.map data, (group) ->
            { text: group.name, children: _.map(group.items, (item) -> { id: item.name, text: "#{item.name} (#{item.price.toFixed(2)} €)", ingredients: item.ingredients })}
          { results: formattedData }
      formatResult: format
      formatSelection: format
      escapeMarkup: (m) -> m
