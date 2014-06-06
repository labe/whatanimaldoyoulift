class TofuBacon
  constructor: ->
    @questionForm = $('#generate_animal')
    @questionForm.on 'submit', @validateWeight

    @weightField = $('input[name="weight"]')
    @weightField.on 'click', @clearErrors
    @weightField.on 'keydown', @clearErrors

    $('#lift_again').on 'click', @resetAll

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
      @swapViews()
      @showAnimalResult(result['name'], result['image_path'])
      @showNextAnimal(result['next_animal_name'])
    , 'json'

  swapViews: ->
    $('#question').toggle()
    $('#result').toggle()

  showAnimalResult: (name, imagePath) ->
    $('#animal_name').html(name)
    $('#animal_image').html("<image src='#{imagePath}' width='400px'>")

  showNextAnimal: (name) ->
    if name
      $('#next_animal span').html(name)
      $('#next_animal').show()
    else
      $('#next_animal').hide()

  clearErrors: ->
    $('#errors p').html("")

  resetAll: (e) =>
    e.preventDefault()
    @clearErrors()
    @weightField.val("")
    setTimeout =>
      @weightField.focus()
    @swapViews()

$ ->
  new TofuBacon
