class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  has_many :gists
  has_many :users, through: :gists

  validates :body, presence: true
end
