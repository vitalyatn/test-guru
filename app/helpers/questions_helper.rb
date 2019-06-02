module QuestionsHelper

  ACTION_LIST = { "new" => "Create New", "edit" => "Edit"}

  def question_header(test)
    "#{ACTION_LIST[params[:action]]} #{test.title} Question"
  end

  def current_year
    Time.now.year
  end

  def  github_url(author, repo)
  link_to 'Project',"https://github.com/#{author}/#{repo}", target: :_blank
  end

end
