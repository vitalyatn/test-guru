document.addEventListener('turbolinks:load', function() {

  var rule = document.querySelector('#bage_rule');
  if (rule) {
    rule.addEventListener('change',function() {
      var value = rule.value;
      if (value == 'all_category_completed' || value == 'first_test_completed' ) {
        document.querySelector('.category').classList.remove('hide');
        document.querySelector('.level').classList.add('hide');
        document.querySelector('#bage_category').setAttribute('name','bage[value]')
        document.querySelector('#bage_level').setAttribute('name','bage[level]')
      }
      else if (value == 'level') {
        document.querySelector('#bage_level').setAttribute('name','bage[value]')
        document.querySelector('#bage_category').setAttribute('name','bage[category]')
        document.querySelector('.category').classList.add('hide');
        document.querySelector('.level').classList.remove('hide');
      }
      else {
        document.querySelector('.level').classList.add('hide');
        document.querySelector('.category').classList.add('hide');
      }
    })
  }
})
