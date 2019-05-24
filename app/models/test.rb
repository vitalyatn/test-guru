class Test < ApplicationRecord

  def self.sort_by_desc(category)
    Test.joins("JOIN categories ON categories.title = '#{category}' AND
      categories.id = tests.category_id").order(title: :desc).select(:title)
  end

end
