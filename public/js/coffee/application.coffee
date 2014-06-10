class TofuBacon
  constructor: ->
    @questionForm = $('#generate_animal')
    @questionForm.on 'submit', @validateWeight

    @weightField = $('input[name="weight"]')
    @unitField = $('select[name="units"]')
    @weightField.on 'click', @clearErrors
    @weightField.on 'keydown', @clearErrors

  validateWeight: (e) =>
    e.preventDefault()
    weight = @weightField.val()
    validWeight = /^[0-9]*\.{0,1}[0-9]*$/
    if @weightField.val() == ""
      $('#errors p').html("Even air weighs something!")
    else if validWeight.test(weight) == false
      $('#errors p').html("Thinking outside the box is great, but to avoid inevitable errors in translation, enter a weight using numerical digits (0-9) only.")
    else if @weightField.val() < 1
      $('#errors p').html("A burrito weighs more than that! Surely you can even lift a burrito.")
    else if @pickUppableWeight() == false
      $('#errors p').html("Whoa there, mega machine! This app is only meant for humans who even lift.<br>Try entering a more human-pick-uppable weight.")
    else
      @getAnimalResult()

  pickUppableWeight: =>
    max = 6000
    return (@unitField.val() == "lbs" && @weightField.val() <= max) || (@unitField.val() == "kg" && (@weightField.val() * 2.2) <= max)

  getAnimalResult: =>
    $.post '/', @questionForm.serialize(), (result) =>
      @showAnimalResult(result)

  showAnimalResult: (result) =>
    $('#result').html(result)
    @focusOn($('body').find('#twitter_it'))
    @swapViews()
    $('body').find('#lift_again').on 'click', @resetAll

  focusOn: (el) ->
    setTimeout ->
      el.focus()

  swapViews: ->
    $('#question').toggle()
    $('#result').toggle()

  clearErrors: ->
    $('#errors p').html("")

  resetAll: (e) =>
    e.preventDefault()
    @weightField.val("")
    @focusOn(@weightField)
    @swapViews()

$ ->
  new TofuBacon
