module ApplicationHelper
  def current_year
    Date.current.year
  end

  def  github_url(author, repo)
    link_to 'Project',"https://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_class(level)
    {
      notice: 'alert-info',
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning'
    } [level.to_sym]
  end
end
