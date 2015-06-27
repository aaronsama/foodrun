# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
            { text: group.name, children: _.map(group.items, (item) -> { id: item.name, text: "#{item.name} (#{item.price.toFixed(2)} €)" })}
          { results: formattedData }