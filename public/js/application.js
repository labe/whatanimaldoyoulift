(function() {
  var TofuBacon,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  TofuBacon = (function() {
    function TofuBacon() {
      this.resetAll = __bind(this.resetAll, this);
      this.getAnimalResult = __bind(this.getAnimalResult, this);
      this.validateWeight = __bind(this.validateWeight, this);
      this.questionForm = $('#generate_animal');
      this.questionForm.on('submit', this.validateWeight);
      this.weightField = $('input[name="weight"]');
      this.weightField.on('click', this.clearErrors);
      this.weightField.on('keydown', this.clearErrors);
      $('#lift_again').on('click', this.resetAll);
    }

    TofuBacon.prototype.validateWeight = function(e) {
      var validWeight, weight;
      e.preventDefault();
      weight = this.weightField.val();
      validWeight = /^[0-9]+$/;
      if (validWeight.test(weight) === false) {
        return $('#errors p').html("Thinking outside the box is great, but to avoid inevitable errors in translation, enter a weight using numerical digits (0-9) only.");
      } else if (this.weightField.val() > 1000) {
        return $('#errors p').html("Whoa there, mega machine! This app is only meant for humans who even lift.<br>Try entering a more human-pick-uppable weight.");
      } else {
        return this.getAnimalResult();
      }
    };

    TofuBacon.prototype.getAnimalResult = function() {
      return $.post('/', this.questionForm.serialize(), (function(_this) {
        return function(result) {
          _this.swapViews();
          _this.showAnimalResult(result['name'], result['image_path']);
          _this.showNextAnimal(result['next_animal_name']);
          return _this.focusOn($('#lift_again'));
        };
      })(this), 'json');
    };

    TofuBacon.prototype.swapViews = function() {
      $('#question').toggle();
      return $('#result').toggle();
    };

    TofuBacon.prototype.showAnimalResult = function(name, imagePath) {
      $('#animal_name').html(name);
      return $('#animal_image').html("<image src='" + imagePath + "' width='400px'>");
    };

    TofuBacon.prototype.showNextAnimal = function(name) {
      if (name) {
        $('#next_animal span').html(name);
        return $('#next_animal').show();
      } else {
        return $('#next_animal').hide();
      }
    };

    TofuBacon.prototype.clearErrors = function() {
      return $('#errors p').html("");
    };

    TofuBacon.prototype.resetAll = function(e) {
      e.preventDefault();
      this.clearErrors();
      this.weightField.val("");
      this.focusOn(this.weightField);
      return this.swapViews();
    };

    TofuBacon.prototype.focusOn = function(el) {
      return setTimeout(function() {
        return el.focus();
      });
    };

    return TofuBacon;

  })();

  $(function() {
    return new TofuBacon;
  });

}).call(this);
