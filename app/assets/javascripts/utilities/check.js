document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password');
  var passwordConfirmation = document.querySelector('#password_confirm');
  passwordConfirmation.addEventListener('input',function() {
    if (password.value != document.querySelector('#user_password_confirmation').value) {
        this.querySelector('.octicon-info').classList.add('text-danger')
        this.querySelector('.octicon-info').classList.remove('hide')
        this.querySelector('.octicon-info').classList.remove('text-success')
      }
    else {
      this.querySelector('.octicon-info').classList.add('text-success')
      this.querySelector('.octicon-info').classList.remove('hide')
      this.querySelector('.octicon-info').classList.remove('text-danger')
      }
    })
  })
