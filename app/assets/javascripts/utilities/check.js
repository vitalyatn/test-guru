document.addEventListener('turbolinks:load', function() {

  var password = document.querySelector('#user_password');
  var passwordConfirmation = document.querySelector('#password_confirm');

  var message = document.querySelector('#message');
  var octiconInfo = document.querySelector('.octicon-info');

  if (passwordConfirmation) {
    passwordConfirmation.addEventListener('input',function() {
      var passwordConfirmValue = document.querySelector('#user_password_confirmation').value;
      if (passwordConfirmValue != "") {
        if (password.value != passwordConfirmValue) {
            octiconInfo.classList.add('text-danger')
            octiconInfo.classList.remove('hide')
            octiconInfo.classList.remove('text-success')
            message.setAttribute('title', 'Пароли не совпадают')
          }
        else {
            octiconInfo.classList.add('text-success')
            octiconInfo.classList.remove('hide')
            octiconInfo.classList.remove('text-danger')
            message.setAttribute('title', 'Пароли совпадают')
          }
        }
        else {
          octiconInfo.classList.add('hide')
        }
      })
    }
  })
