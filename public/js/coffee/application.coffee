class TofuBacon
  constructor: ->
    @questionForm = $('#generate_animal')
    @questionForm.on 'submit', @validateWeight

    @weightField = $('input[name="weight"]')
    @weightField.on 'click', @clearErrors
    @weightField.on 'keydown', @clearErrors

  validateWeight: (e) =>
    e.preventDefault()
    weight = @weightField.val()
    validWeight = /^[0-9]+$/
    if validWeight.test(weight) == false
      $('#errors p').html("Thinking outside the box is great, but to avoid inevitable errors in translation, enter a weight using numerical digits (0-9) only.")
    else if @weightField.val() > 1000
      $('#errors p').html("Whoa there, mega machine! This app is only meant for humans who even lift.<br>Try entering a more human-pick-uppable weight.")
    else
      @getAnimalResult()

  getAnimalResult: =>
    $.post '/', @questionForm.serialize(), (result) =>
      @showAnimalResult(result)

  swapViews: ->
    $('#question').toggle()
    $('#result').toggle()

  showAnimalResult: (result) =>
    $('#result').html(result)
    @swapViews()
    @focusOn($('body').find('#twitter_it'))
    $('body').find('#lift_again').on 'click', @resetAll

  clearErrors: ->
    $('#errors p').html("")

  resetAll: (e) =>
    e.preventDefault()
    @clearErrors()
    @weightField.val("")
    @focusOn(@weightField)
    @swapViews()

  focusOn: (el) ->
    setTimeout ->
      el.focus()

$ ->
  new TofuBacon
