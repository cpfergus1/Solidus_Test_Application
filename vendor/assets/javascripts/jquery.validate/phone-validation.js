!function ($) {
  $.validator.methods.phoneMinLength = function (value, element, param) {
    return this.optional(element) || value.replace(/[^\d]/g, '').length >= param;
  };

  $.validator.addMethod('pattern', function (value, element, regex) {
    return this.optional(element) || regex.test(value);
  }, "Invalid format: phone length <code>min 10, max 15</code>, use only digits or <code>+ - ( )</code>");
}(jQuery);
