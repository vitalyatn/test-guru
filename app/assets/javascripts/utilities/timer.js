document.addEventListener('turbolinks:load', function() {

  //test_time_limit -ай-ди чекбокса
  var create_timer = document.querySelector('#test_timer');

  if (create_timer) {
    create_timer.addEventListener('change',function() {
      if (create_timer.checked == true) {
        document.querySelector('.timer').classList.remove('hide');
      }
      else {
        document.querySelector('.timer').classList.add('hide');
      }
    })
  }

  var time = parseFloat(document.querySelector('.time-left').dataset.timeLeft);
  var timeLeft = document.querySelector('.time-left');
  var interval = setInterval(function() {
    if (time <= 0)
    {

      clearInterval(interval);
    // программно нажимаем на кнопку для завершения теста
      document.getElementById("test-passage-form").submit();
      //конец теста
    } else {
            alert("<%= @test_passage %>");
      time = (time - 1).toFixed(1);
      minutes = get_minutes(time);
      seconds = get_seconds(time);
      timeLeft.textContent = minutes + ":" + seconds;
    }
  }, 1000)
})

function get_minutes(time) {
    minutes = Math.trunc(time / 60);
    if (minutes < 10) {
      minutes = "0" + minutes;
    }
    return minutes;
}

function get_seconds(time) {
    seconds = time % 60;
    if (seconds < 10) {
      seconds = "0" + seconds;
    }
    return seconds;
}
