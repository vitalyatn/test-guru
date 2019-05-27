class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: "User"

  validates :title, presence: true,
                    uniqueness: {scope: :level}

  validates :level, numericality: { only_integer: true, greater_than: 0 }


  scope :sort_by_desc, -> (category) {Test.joins("JOIN categories ON
    categories.title = '#{category}' AND categories.id = tests.category_id").order(title: :desc).select(:title) }

  def self.level_difficult(level)
    if level == "простой"
      level = 0..1
    elsif level == "средний"
      level = 2..4
    else
      level = 5..Float::INFINITY
    end
    where level: level
  end
end
