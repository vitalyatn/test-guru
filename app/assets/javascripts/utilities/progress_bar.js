document.addEventListener('turbolinks:load', function() {
   var progress = document.querySelector('.progress-bar');
   if (progress) { progressBar(progress); }
})

function progressBar(progress) {
  var  current_question = progress.dataset.currentQuestion;
  var total_questions = progress.dataset.totalQuestions;
  var percent =  current_question / total_questions * 100;
  progress.setAttribute("style","width:"+ percent +"%")
}
