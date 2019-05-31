module QuestionsHelper

  def question_header(test_id)
    Test.find(test_id).title
  end

  def current_year
    Time.now.year
  end

  def  github_url(author, repo) 
  link_to 'Project',"https://github.com/#{author}/#{repo}"
  end

end
