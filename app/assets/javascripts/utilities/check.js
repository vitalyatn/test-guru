// document.addEventListener('turbolinks:load', function() {
//   var password = document.querySelector('#user_password');
//   var passwordConfirmation = document.querySelector('#password_confirm');
//   passwordConfirmation.addEventListener('input',function() {
//     if (password.value != document.querySelector('#user_password_confirmation').value) {
//         this.querySelector('.octicon-info').classList.add('text-danger')
//         this.querySelector('.octicon-info').classList.remove('hide')
//         this.querySelector('.octicon-info').classList.remove('text-success')
//         this.querySelector('#message').setAttribute('title', 'Пароли совпадают')
//       }
//     else {
//       this.querySelector('.octicon-info').classList.add('text-success')
//       this.querySelector('.octicon-info').classList.remove('hide')
//       this.querySelector('.octicon-info').classList.remove('text-danger')
//       this.querySelector('#message').setAttribute('title', 'Пароли совпадают')
//       }
//     })
//   })



document.addEventListener('turbolinks:load', function() {

  var password = document.querySelector('#user_password');
  var passwordConfirmation = document.querySelector('#password_confirm');

  var message = document.querySelector('#message');
  var octiconInfo = document.querySelector('.octicon-info');


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
  })
