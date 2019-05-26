class Test < ApplicationRecord

  belongs_to :category
  has_many :questions

  has_many :passed_tests
  has_many :users, through: :passed_tests

  belongs_to :author, class_name: "User"

  def self.sort_by_desc(category)
    Test.joins("JOIN categories ON categories.title = '#{category}' AND
      categories.id = tests.category_id").order(title: :desc).select(:title)
  end

end
