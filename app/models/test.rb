class Test < ApplicationRecord

  def self.sort_by_desc(category)
    result = Test.where(category_id: category).order(title: :desc).select(:title)
  end

end
