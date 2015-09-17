# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

format = (item) ->
  formattedRes = "<strong>#{item.text}</strong>"
  formattedRes += "<br><small>#{item.ingredients}</small>" if item.ingredients
  formattedRes

$(document).ready () ->
  if $('#item_description').length
    $('#item_description').select2
      ajax:
        url: 'http://orostube-microservice.herokuapp.com/menu'
        type: 'GET'
        dataType: 'json'
        quietMillis: 250
        data: (term) ->
          q: term
        processResults: (data) ->
          formattedData = _.map data, (group) ->
            { text: group.name, children: _.map(group.items, (item) -> { id: item.name, text: "#{item.name} (#{item.price.toFixed(2)} €)", ingredients: item.ingredients, price: item.price.toFixed(2) })}
          { results: formattedData }
      templateResult: format
      templateSelection: (item) ->
        "<strong>#{item.text}</strong>"
      escapeMarkup: (m) -> m
    $('#item_description').on 'select2:select', (e) ->
      $('#item_price').val e.params.data.price

  if $('button#add_lunchtronic').length
    $('button#add_lunchtronic').on 'click', (e) ->
      e.preventDefault()
      $.post '/items.js',
        item:
          name: $('#item_name').val()
          description: 'Lunchtronic'
          price: -6.0
          order_id: $('#item_order_id').val()