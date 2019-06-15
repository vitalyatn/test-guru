module ApplicationHelper
  def current_year
    Date.current.year
  end

  def  github_url(author, repo)
    link_to 'Project',"https://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_message(key)
    content_tag :p, flash[key], class: "flash #{key}" if flash[key]
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

end
