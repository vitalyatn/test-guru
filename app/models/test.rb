class Test < ApplicationRecord

  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: "User"

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :sort_by_desc, -> (category) { Test.joins(:category).where(categories:
      { title: category }).order(title: :desc).select(:title) }

  scope :easy, -> { where level: 0..1 }
  scope :medium, -> { where level: 2..4 }
  scope :hard, -> { where level: 5..Float::INFINITY }

end
